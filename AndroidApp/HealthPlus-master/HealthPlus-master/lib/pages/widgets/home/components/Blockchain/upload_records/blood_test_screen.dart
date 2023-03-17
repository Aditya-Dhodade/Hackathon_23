import 'dart:convert';
import 'dart:io';
import 'dart:io' show File;
import 'package:face_net_authentication/pages/cubit/keysprivate_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:health_plus/BlockChain/constants.dart';
// import 'package:health_plus/BlockChain/services/functions.dart';
// import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:health_plus/custome_screen/custome_loader.dart';
// import 'package:health_plus/screens/view_records/view_full_blood_report.dart';
import 'package:web3dart/web3dart.dart';

import 'package:http/http.dart';

import '../../../../../../blockchain/constants.dart';
import '../../../../../../blockchain/services/functions.dart';
import '../custome_screen/custome_loader.dart';
import '../view_records/view_full_blood_report.dart';

class UploadBloodTest extends StatefulWidget {
  const UploadBloodTest({Key? key}) : super(key: key);

  @override
  _UploadBloodTestState createState() => _UploadBloodTestState();
}

class _UploadBloodTestState extends State<UploadBloodTest> {
  File? _image;
  String? message;
  Client? httpClient;
  Web3Client? ethClient;
  var data;
  bool isloading = false;

  @override
  void initState() {
    // TODO: implement initState
    httpClient = Client();
    ethClient = Web3Client(POLYGON_ALCHEMY, httpClient!);

    super.initState();
  }

  Future getImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    _image = File(image!.path);
    setState(() {});
  }

// uploading image from here
  void uploadImage() async {
    setState(() {
      isloading = true;
    });
    final request = http.MultipartRequest(
        "POST",
        Uri.parse(
            "https://4cbf-106-193-214-213.in.ngrok.io/predict-from_blood"));
    final headers = {"Content-type": "multipart/form-data"};
    request.files.add(http.MultipartFile(
        'image', _image!.readAsBytes().asStream(), _image!.lengthSync(),
        filename: _image!.path.split("/").last));
    request.headers.addAll(headers);
    final response = await request.send();
    http.Response res = await http.Response.fromStream(response);

    Map<String, dynamic> dict = jsonDecode(res.body);
    print(dict);

    for (MapEntry<String, dynamic> e in dict.entries) {
      dict[e.key] = e.value.toString();
    }

    data = json.decode(res.body);
    print(data);

    // FirebaseFirestore db = FirebaseFirestore.instance;
// dynamic count = 0;
//         db.collection("users")
//         .doc(user.uid)
//         .get()
//         .then((DocumentSnapshot documentSnapshot) {
//       if (documentSnapshot.exists) {
//         Map<String, dynamic> dataCount = documentSnapshot.data() as Map<String,dynamic>;
//         count = dataCount['usercount'];
//       } else {
//         print('Document does not exist on the database');
//       }
//     });
// print(data.toString().runtimeType);
// print(user.uid.toString().runtimeType);
    String re = await addOCR(
        ethClient!,
        BlocProvider.of<KeysprivateCubit>(context).getPrivateKey(),
        [jsonEncode(data)]);
    print(re + "dfsadf");
    // db.collection("users")
    //     .doc(user.uid)
    //     .collection('BloodtestReport')
    //     .add(dict);
    // db.collection("Bloodreport").add(dict);

    setState(() {
      isloading = false;
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => ViewFullBloodReport(dict)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(" Upload blood test Report"),
      ),
      body: isloading
          ? CustomLoader()
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _image == null
                    ? Text(
                        'No image selected.',
                        style: TextStyle(color: Colors.teal, fontSize: 20),
                      )
                    : Image.file(_image!),
                Container(
                  width: MediaQuery.of(context).size.width,
                ),
                ElevatedButton(
                    child: Text("Upload report and get prediction",
                        style: TextStyle(color: Colors.white, fontSize: 18)),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        )),
                    onPressed: () {
                      if (_image != null) {
                        uploadImage();
                      } else {
                        Fluttertoast.showToast(
                            msg: "Please upload report first");
                      }
                    }),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        onPressed: getImage,
        child: Icon(Icons.add_a_photo),
      ),
    );
  }
}

class UPLOADPDF extends StatelessWidget {
  const UPLOADPDF({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
    );
  }
}
