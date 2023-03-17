from flask import Flask, request, jsonify
import werkzeug
import easyocr
import PIL
from PIL import ImageDraw
import numpy as np
import json
import logging
import pickle
import requests
from keras.models import load_model
from keras.preprocessing import image
from keras.applications.vgg16 import preprocess_input
from keras.utils import load_img,img_to_array
import numpy as np
import os


app = Flask (__name__)

reader = easyocr.Reader(['en'])


@app.route('/predict-cardio', methods=["POST"])
def upload_mri():
    if(request.method=="POST"):
        imagefile = request.files ['image']
        filename = werkzeug.utils.secure_filename (imagefile.filename)
        path = "C:/Users/Aditya/Desktop/wce hack/api for models/uploadedDataC/"+filename
        imagefile.save("./uploadedDataC/" + filename)
        # imagefile.save(os.path.join(app.config['UPLOAD_FOLDER'], filename))

        test_model=load_model('ml models/cardio.h5')
        img=load_img(path, target_size=(224,224))
        x=img_to_array(img)
        x=np.expand_dims(x, axis=0)
        img_dat=preprocess_input(x)
        classes=test_model.predict(img_dat)
        temp1 = list(classes)
        
        value = {}
        if temp1[0][0] == 1:
            value['Prediction'] = 'No CAD'
        else:
            value['Prediction'] = 'CAD'
        
        json_file = json.dumps(value)
        logging.info('reached till here')
        return json_file

@app.route('/predict-pneumonia', methods=["POST"])
def upload_xray():
    if(request.method=="POST"):
        imagefile = request.files ['image']
        filename = werkzeug.utils.secure_filename (imagefile.filename)
        path = "C:/Users/Aditya/Desktop/wce hack/api for models/uploadedDataP/"+filename
        imagefile.save("./uploadedDataP/" + filename)

        test_model=load_model('ml models/pneumonia.h5')
        img=load_img(path, target_size=(224,224))
        x=img_to_array(img)
        x=np.expand_dims(x, axis=0)
        img_dat=preprocess_input(x)
        classes=test_model.predict(img_dat)
        temp1 = list(classes)
        
        value = {}
        if temp1[0][0] == 1:
            value['Prediction'] = 'No pneumonia'
        else:
            value['Prediction'] = 'Pneumonia'
        
        json_file = json.dumps(value)
        logging.info('reached till here')
        return json_file

@app.route('/predict-from_blood', methods=["POST"])
def upload_blood_repo():
    if(request.method=="POST"):
        imagefile = request.files ['image']
        filename = werkzeug.utils.secure_filename (imagefile.filename)
        path = "C:/Users/Aditya/Desktop/FE CE/wce hack/api for models/uploadedDataB/"+filename
        imagefile.save("./uploadedDataB/" + filename)
        
        bounds = reader.readtext(path, contrast_ths=0.05, adjust_contrast=0.7, add_margin=0.45, width_ths=0.7,decoder='beamsearch')
        
        result = {}
        d = ['Patient Name', 'Age & Sex', 'Haemoglobin', 'Total WBC Count', 'RBC count', 'Neutrophils', 'Lymphocytes',
            'Monocytes', 'Eosinophils', 'Basophils', 'Haematocrit (HCT)', 'MCV', 'MCH', 'MCHC', 'RDW', 'Platelet Count', 'RDW']
        print(bounds)
        new_param = []
        for i in bounds:
            print('working')
            if i[1][0] == '~':
                s = i[1].lstrip('~')
                new_param.append(s)
            elif i[1][0] == '(':
                s = i[1].lstrip('(')
                new_param.append(s)
            elif i[1][0] == '|':
                s = i[1].lstrip('|')
                new_param.append(s)
            elif i[1][0] == '[':
                s = i[1].lstrip('[')
                new_param.append(s)
            elif i[1][0] == '"':
                s = i[1].lstrip('"')
                new_param.append(s)            
            else:
                new_param.append(i[1])
            
        for i in range(0, len(new_param)):
            if new_param[i] in d:
                result[new_param[i]] = new_param[i + 1]

        param = ['Haemoglobin', 'RBC count', 'Total WBC Count', 'Neutrophils', 'Lymphocytes', 'Monocytes', 'Eosinophils',
            'Basophils', 'Haematocrit (HCT)', 'MCV', 'MCH', 'MCHC', 'Platelet Count', 'RDW']
        for i in param:
            if result.get(i) is not None:
                pass
            else:
                result[i] = 0

        values = {}
        for i in param:
            values[i] = result[i]

        for k, v in values.items():
            res = isinstance(v, str)
            if res != True:
                continue
            values[k] = v.replace(',', '.')
        
        lst1 = []
        
        for k,v in values.items():
            res = isinstance(v, str)
            print(v)
            if res:
                if (not v[0].isdigit()) and (not v.isalpha()):
                    values[k] = 0 

        for k,v in values.items():
            values[k] = float(v)
            lst1.append(values[k])
        print('its here')
        with open('ml models/model.pkl', 'rb') as file:
            model = pickle.load(file)
        print(lst1)
        input_values = np.array(lst1)
        input_values = input_values.reshape(1,-1) 
    
        pred = model.predict(input_values)
        print(pred[0])

        if(float(pred[0]) == 0):
            values['Prediction'] = 'Anemia'
        elif(float(pred[0]) == 1):
            values['Prediction'] = 'leukemia'
        elif(float(pred[0]) == 2):
            values['Prediction'] = 'Covid 19'
        elif(float(pred[0]) == 3):
            values['Prediction'] = 'Anemia'
        elif(float(pred[0]) == 4):
            values['Prediction'] = 'Neutritonal Deficiency'
        elif(float(pred[0]) == 5):
            values['Prediction'] = 'Healthy'

        values['Patient Name'] = result['Patient Name']
        for i in d:
            if result.get(i) is not None:
                pass
            else:
                result[i] = 0
        values['Age & Sex'] = result['Age & Sex'].replace('I','/')
        values['Age & Sex'] = result['Age & Sex'].replace('i','/')
        
        json_file = json.dumps(values)
        logging.info('reached till here')
        return json_file
    
@app.route('/predict-diabetes', methods=["POST"])
def upload_diabetes_repo():
    if(request.method=="POST"):
        imagefile = request.files ['image']
        filename = werkzeug.utils.secure_filename (imagefile.filename)
        path = "C:/Users/Aditya/Desktop/wce hack/api for models/uploadedDataD/"+filename
        imagefile.save("./uploadedDataD/" + filename)
        
        bounds = reader.readtext(path, contrast_ths=0.05, adjust_contrast=0.7, add_margin=0.45, width_ths=0.7,decoder='beamsearch')
        
        # def isfloat(num):
        #     try:
        #         float(num)
        #         return True
        #     except ValueError:
        #         return False
            
        result1 = {}
        d = ['Patient Name', 'Age ', 'Sex', 'Glucose', 'Blood Pressure', 'Skin Thickness', 'Insulin',
            'BMI', 'Diabetes Pedigree Function','Age']
        print(bounds)
        new_param = []
        for i in bounds:
            print('working')
            if i[1][0] == '~':
                s = i[1].lstrip('~')
                new_param.append(s)
            elif i[1][0] == '(':
                s = i[1].lstrip('(')
                new_param.append(s)
            elif i[1][0] == '|':
                s = i[1].lstrip('|')
                new_param.append(s)
            elif i[1][0] == '[':
                s = i[1].lstrip('[')
                new_param.append(s)
            elif i[1][0] == '"':
                s = i[1].lstrip('"')
                new_param.append(s)            
            else:
                new_param.append(i[1])
            
        for i in range(0, len(new_param)):
            if new_param[i] in d:
                result1[new_param[i]] = new_param[i + 1]

        param = ['Glucose', 'Blood Pressure', 'Skin Thickness', 'Insulin','BMI', 'Diabetes Pedigree Function','Age']
        for i in param:
            if result1.get(i) is not None:
                pass
            else:
                result1[i] = 0

        values = {}
        for i in param:
            values[i] = result1[i]

        for k, v in values.items():
            res = isinstance(v, str)
            if res != True:
                continue
            values[k] = v.replace(',', '.')
        
        lst1 = []
        
        for k,v in values.items():
            res = isinstance(v, str)
            print(v)
            if res:
                if not v[0].isdigit():
                    values[k] = 0 

        for k,v in values.items():
            values[k] = float(v)
            lst1.append(values[k])
        print('its here')
        with open('ml models/diabetes.pkl', 'rb') as file:
            model = pickle.load(file)
        print(lst1)
        input_values = np.array(lst1)
        input_values = input_values.reshape(1,-1) 
    
        pred = model.predict(input_values)
        print(pred[0])
        if float(pred[0]) == 0:
            values['Prediction'] = 'Non diabetic'
        else:
            values['Prediction'] = 'Diabetic'

        values['Patient Name'] = result1['Patient Name']
        for i in d:
            if result1.get(i) is not None:
                pass
            else:
                result1[i] = 0
        values['Age'] = result1['Age'].replace('I','/')
        values['Age'] = result1['Age'].replace('i','/')
        values['Sex'] = result1['Sex'].replace('I','/')
        values['Sex'] = result1['Sex'].replace('i','/')
        
        json_file = json.dumps(values)
        logging.info('reached till here')
        return json_file

# @app.route("/predict")
# def predict():
#     print('its here')
#     with open('model.pkl', 'rb') as file:
#         model = pickle.load(file)
#     print(lst)
#     input_values = np.array(lst)
#     lst = []
#     input_values = input_values.reshape(1,-1) 
    
#     pred = model.predict(input_values)
#     print(pred[0])

# @app.route('/', methods=["POST"])
# def home():
#      return "abcdefg"

if __name__ == "_main_":
    app.run(debug=True,port=5000)
