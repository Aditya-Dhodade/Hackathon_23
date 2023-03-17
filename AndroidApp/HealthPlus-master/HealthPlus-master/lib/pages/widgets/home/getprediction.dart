//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
//
//
//
// class GetPrediction extends StatefulWidget {
//   static String routeName = "/addproduct";
//
//   GetPrediction( {Key? key }) : super(key: key);
//
//   @override
//   _GetPredictionState createState() => _GetPredictionState();
// }
//
// class _GetPredictionState extends State<GetPrediction> {
//
//   final controllerAge = TextEditingController();
//   final controllerBMI= TextEditingController();
//   final systoleLow = TextEditingController();
//   final dystoleHigh=TextEditingController();
//   XFile ? image1,image2,image3,image4;
//   ImagePicker imagePicker = ImagePicker();
//   final inp_glucose = TextEditingController();
//
//   final  inp_gender= TextEditingController();
//   final  inp_smoke = TextEditingController();
//   final  inp_cholestrole= TextEditingController();
//   final inp_alcohol=TextEditingController();
//   final  inp_sigarate=TextEditingController();
//   final inp_physicalA=TextEditingController();
//
//
//
//
//
//
//
//
//
//   // @override
//   // void initState() {
//   //   // TODO: implement initState
//   //   super.initState();
//   //   ex.addListener(() {
//   //     setState(() {});
//   //   });
//   //   amount_.addListener(() {
//   //     setState(() {});
//   //   });
//   //   controllerLocation.addListener(() {
//   //     if (controllerLocation.text.isEmpty) {
//   //       setState(() {
//   //         // searchResults = [];
//   //       });
//   //       return;
//   //     }
//   //
//   //     // getAutocomplete();
//   //   });
//   // }
//
//
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey.shade100,
//
//       body: SafeArea(
//         child: Stack(
//           alignment: AlignmentDirectional.center,
//           children: [
//             background_container(context),
//             Positioned(
//               top: 120,
//               left: 0,
//               right: 0,
//               bottom: 0,
//               child: SingleChildScrollView(child: main_container()),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Container main_container() {
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(20),
//         color: Colors.white,
//       ),
//       height: 1500,
//       width: 340,
//       child: Column(
//
//         children: [
//           SizedBox(height: 30),
//           Age(), // for name
//           SizedBox(height: 30),
//           Systolic_BP(), // for select the product
//           SizedBox(height: 30),
//           Dystolic_BP(),
//           SizedBox(height: 30),
//           Cholestrole(),
//           SizedBox(height: 30),
//           Glucose(),
//           SizedBox(height: 30),
//           Smoke(),
//           SizedBox(height: 30),
//           Alcohol(),
//           SizedBox(height: 30),
//           PhysicalActivity(),
//           SizedBox(height: 30),
//           BMI(),
//           SizedBox(height: 30),
//           Image1(),
//           SizedBox(height: 30),
//           Image2(),
//           SizedBox(height: 30),
//           Image3(),
//           SizedBox(height: 30),
//           Image4(), // Take mobile No input
//           SizedBox(height: 30),
//           save(),
//           SizedBox(height: 25),
//
//         ],
//       ),
//     );
//   }
//
//   // GestureDetector save() {
//   //   return GestureDetector(
//   //     onTap: () async {
//   //       final product= Products(
//   //           age: controllerAge.text,
//   //           gender: int.parse(inp_gender.text),
//   //           systole: systoleLow.text,
//   //           dystole: dystoleHigh.text,
//   //           cholestole: int.parse(inp_cholestrole.text),
//   //           glucose: int.pinp_glucose!,
//   //           smoke: inp_smoke!,
//   //           alcohol: inp_alcohol!,
//   //           physicalA: inp_physicalA!,
//   //           BMI: controllerBMI.text
//   //       );
//
//         final json = product.toJson();
//
//         var request = http.MultipartRequest('POST', Uri.parse('https://8ba2-61-14-206-67.in.ngrok.io/predict'));
//
//         request.files.add(await http.MultipartFile.fromPath('image_0', image1!.path));
//         request.files.add(await http.MultipartFile.fromPath('image_1', image2!.path));
//         request.files.add(await http.MultipartFile.fromPath('image_2', image3!.path));
//         request.files.add(await http.MultipartFile.fromPath('image_3', image4!.path));
//         request.fields['json_data'] =jsonEncode(json);
//         var response = await request.send();
//
//         if (response.statusCode == 200) {
//         var jsonResponse = jsonDecode(await response.stream.bytesToString());
//         int prediction = jsonResponse['prediction'];
//         // do something with the prediction
//         } else {
//         print('Request failed with status: ${response.statusCode}.');
//         }
//
//
//       },
//       child: Container(
//         alignment: Alignment.center,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(15),
//           color: Colors.teal,
//         ),
//         width: 120,
//         height: 50,
//         child: Text(
//           'Save',
//
//           style: TextStyle(
//             fontFamily: 'f',
//             fontWeight: FontWeight.w600,
//             color: Colors.white,
//             fontSize: 17,
//           ),
//         ),
//       ),
//     );
//   }
//
//
//
//   Column background_container(BuildContext context) {
//     return Column(
//       children: [
//         Container(
//           width: double.infinity,
//           height: 240,
//           decoration: BoxDecoration(
//             color: Colors.teal,
//             borderRadius: BorderRadius.only(
//               bottomLeft: Radius.circular(20),
//               bottomRight: Radius.circular(20),
//             ),
//           ),
//           child: Column(
//             children: [
//               SizedBox(height: 40),
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 15),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.of(context).pop();
//                       },
//                       child: Icon(Icons.arrow_back, color: Colors.white),
//                     ),
//                     Text(
//                       'Predict Heart Disease',
//                       style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.w600,
//                           color: Colors.white),
//                     ),
//                     Icon(
//                       Icons.attach_file_outlined,
//                       color: Colors.white,
//                     )
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ],
//     );
//   }
//   Future getImage() async {
//     ImagePicker imagePicker = ImagePicker();
//     await imagePicker.pickImage(source: ImageSource.camera);
//   }
//
//   GestureDetector Image1() {
//     return GestureDetector(
//       onTap: () async {
//         image1 =
//             await imagePicker.pickImage(source: ImageSource.camera);
//       },
//       child: Container(
//         alignment: Alignment.center,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(15),
//           color: Colors.teal,
//         ),
//         width: 120,
//         height: 50,
//         child: Text(
//           'Pick image 1',
//
//           style: TextStyle(
//             fontFamily: 'f',
//             fontWeight: FontWeight.w600,
//             color: Colors.white,
//             fontSize: 17,
//           ),
//         ),
//       ),
//     );
//   }
//
//
//
//
//   GestureDetector Image2() {
//     return GestureDetector(
//       onTap: () async {
//         image2 =
//         await imagePicker.pickImage(source: ImageSource.camera);
//       },
//       child: Container(
//         alignment: Alignment.center,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(15),
//           color: Colors.teal,
//         ),
//         width: 120,
//         height: 50,
//         child: Text(
//           'Pick image 2',
//
//           style: TextStyle(
//             fontFamily: 'f',
//             fontWeight: FontWeight.w600,
//             color: Colors.white,
//             fontSize: 17,
//           ),
//         ),
//       ),
//     );
//   }
//
//   GestureDetector Image3() {
//     return GestureDetector(
//       onTap: () async {
//         image3 =
//         await imagePicker.pickImage(source: ImageSource.camera);
//       },
//       child: Container(
//         alignment: Alignment.center,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(15),
//           color: Colors.teal,
//         ),
//         width: 120,
//         height: 50,
//         child: Text(
//           'Pick image 3',
//
//           style: TextStyle(
//             fontFamily: 'f',
//             fontWeight: FontWeight.w600,
//             color: Colors.white,
//             fontSize: 17,
//           ),
//         ),
//       ),
//     );
//   }
//
//   GestureDetector Image4() {
//     return GestureDetector(
//       onTap: () async {
//         image4 =
//         await imagePicker.pickImage(source: ImageSource.camera);
//       },
//       child: Container(
//         alignment: Alignment.center,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(15),
//           color: Colors.teal,
//         ),
//         width: 120,
//         height: 50,
//         child: Text(
//           'Pick image 4',
//
//           style: TextStyle(
//             fontFamily: 'f',
//             fontWeight: FontWeight.w600,
//             color: Colors.white,
//             fontSize: 17,
//           ),
//         ),
//       ),
//     );
//   }
//
//
//   Padding Age() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       child: TextField(
//         keyboardType: TextInputType.number,
//         // focusNode: controllerAge,
//         controller: controllerAge,
//         decoration: InputDecoration(
//           contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
//           labelText: 'Enter your age',
//           labelStyle: TextStyle(fontSize: 17, color: Colors.grey.shade500),
//           enabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10),
//               borderSide: BorderSide(width: 2, color: Color(0xffC5C5C5))),
//           focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10),
//               borderSide: BorderSide(width: 2, color: Colors.deepOrangeAccent)),
//         ),
//       ),
//     );
//   }
//
//   Padding Gender() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       child: TextField(
//         keyboardType: TextInputType.number,
//         // focusNode: controllerAge,
//         controller: inp_gender!,
//         decoration: InputDecoration(
//           contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
//           labelText: 'Enter 0 for male and 1 for female',
//           labelStyle: TextStyle(fontSize: 17, color: Colors.grey.shade500),
//           enabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10),
//               borderSide: BorderSide(width: 2, color: Color(0xffC5C5C5))),
//           focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10),
//               borderSide: BorderSide(width: 2, color: Colors.deepOrangeAccent)),
//         ),
//       ),
//     );
//   }
//   Padding Cholestrole() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       child: TextField(
//         keyboardType: TextInputType.number,
//         // focusNode: controllerAge,
//         controller: controllerAge,
//         decoration: InputDecoration(
//           contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
//           labelText: 'Enter 0,1,2 for low , medium and high cholestrole',
//           labelStyle: TextStyle(fontSize: 17, color: Colors.grey.shade500),
//           enabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10),
//               borderSide: BorderSide(width: 2, color: Color(0xffC5C5C5))),
//           focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10),
//               borderSide: BorderSide(width: 2, color: Colors.deepOrangeAccent)),
//         ),
//       ),
//     );
//   }
//
//   Padding Glucose() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       child: TextField(
//         keyboardType: TextInputType.number,
//         // focusNode: controllerAge,
//         controller: controllerAge,
//         decoration: InputDecoration(
//           contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
//           labelText: 'Enter 0,1,2 for low , medium and high glucose',
//           labelStyle: TextStyle(fontSize: 17, color: Colors.grey.shade500),
//           enabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10),
//               borderSide: BorderSide(width: 2, color: Color(0xffC5C5C5))),
//           focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10),
//               borderSide: BorderSide(width: 2, color: Colors.deepOrangeAccent)),
//         ),
//       ),
//     );
//   }
//
//   Padding Smoke() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       child: TextField(
//         keyboardType: TextInputType.number,
//         // focusNode: controllerAge,
//         controller: controllerAge,
//         decoration: InputDecoration(
//           contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
//           labelText: 'Enter 0 if you smoke else 1',
//           labelStyle: TextStyle(fontSize: 17, color: Colors.grey.shade500),
//           enabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10),
//               borderSide: BorderSide(width: 2, color: Color(0xffC5C5C5))),
//           focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10),
//               borderSide: BorderSide(width: 2, color: Colors.deepOrangeAccent)),
//         ),
//       ),
//     );
//   }
//   Padding Alcohol() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       child: TextField(
//         keyboardType: TextInputType.number,
//         // focusNode: controllerAge,
//         controller: controllerAge,
//         decoration: InputDecoration(
//           contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
//           labelText: 'Enter 0 if you alcoholic else 1',
//           labelStyle: TextStyle(fontSize: 17, color: Colors.grey.shade500),
//           enabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10),
//               borderSide: BorderSide(width: 2, color: Color(0xffC5C5C5))),
//           focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10),
//               borderSide: BorderSide(width: 2, color: Colors.deepOrangeAccent)),
//         ),
//       ),
//     );
//   }
//   Padding PhysicalActivity() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       child: TextField(
//         keyboardType: TextInputType.number,
//         // focusNode: controllerAge,
//         controller: controllerAge,
//         decoration: InputDecoration(
//           contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
//           labelText: 'Enter 0 if not active else 1',
//           labelStyle: TextStyle(fontSize: 17, color: Colors.grey.shade500),
//           enabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10),
//               borderSide: BorderSide(width: 2, color: Color(0xffC5C5C5))),
//           focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10),
//               borderSide: BorderSide(width: 2, color: Colors.deepOrangeAccent)),
//         ),
//       ),
//     );
//   }
//
//
//   Padding Systolic_BP() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       child: TextField(
//         keyboardType: TextInputType.number,
//         // focusNode: amount_,
//         controller: systoleLow,
//         decoration: InputDecoration(
//           contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
//           labelText: 'Enter systolic blood pressure value',
//           labelStyle: TextStyle(fontSize: 17, color: Colors.grey.shade500),
//           enabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10),
//               borderSide: BorderSide(width: 2, color: Color(0xffC5C5C5))),
//           focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10),
//               borderSide: BorderSide(width: 2, color: Colors.deepOrangeAccent)),
//         ),
//       ),
//     );
//   }
//
//   Padding Dystolic_BP() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       child: TextField(
//         keyboardType: TextInputType.number,
//         // focusNode: amount_,
//         controller: dystoleHigh,
//         decoration: InputDecoration(
//           contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
//           labelText: 'Enter dystolic blood pressure',
//           labelStyle: TextStyle(fontSize: 17, color: Colors.grey.shade500),
//           enabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10),
//               borderSide: BorderSide(width: 2, color: Color(0xffC5C5C5))),
//           focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10),
//               borderSide: BorderSide(width: 2, color: Colors.deepOrangeAccent)),
//         ),
//       ),
//     );
//   }
//
//   Padding BMI() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       child: TextField(
//         keyboardType: TextInputType.number,
//         // focusNode: amount_,
//         controller: controllerBMI,
//         decoration: InputDecoration(
//           contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
//           labelText: 'Enter BMI value',
//           labelStyle: TextStyle(fontSize: 17, color: Colors.grey.shade500),
//           enabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10),
//               borderSide: BorderSide(width: 2, color: Color(0xffC5C5C5))),
//           focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10),
//               borderSide: BorderSide(width: 2, color: Colors.deepOrangeAccent)),
//         ),
//       ),
//     );
//   }
//
//
//
//
//   //
//   //
//   // DropdownButton<String> Gender(){
//   //   List<String> _items = ['Male', 'Female'];
//   //
//   //   return DropdownButton(
//   //     value: gender,
//   //     items: _items.map((String value) {
//   //       return DropdownMenuItem<String>(
//   //         value: value,
//   //         child: Text(value),
//   //       );
//   //     }).toList(),
//   //     onChanged: (String? newValue) {
//   //       setState(() {
//   //         gender = newValue!;
//   //       });
//   //
//   //     },
//   //   );
//   //
//   // }
//   //
//   // DropdownButton<String> Cholestrole(){
//   //   List<String> _items = ['Low', 'Mid', 'High'];
//   //
//   //   return DropdownButton(
//   //     value: cholestrol,
//   //     items: _items.map((String value) {
//   //       return DropdownMenuItem<String>(
//   //         value: value,
//   //         child: Text(value),
//   //       );
//   //     }).toList(),
//   //     onChanged: (String? newValue) {
//   //       setState(() {
//   //         gender = newValue!;
//   //       });
//   //
//   //     },
//   //   );
//   //
//   // }
//  //
//  // Padding gender2(){
//  //    List<String>listitem=['Male', 'Female'];
//  //
//  //   return Padding(
//  //     padding: const EdgeInsets.symmetric(horizontal: 20),
//  //     // child: TextField(
//      //   keyboardType: TextInputType.number,
//      //   // focusNode: amount_,
//      //   controller: controllerBMI,
//      //   decoration: InputDecoration(
//      //     contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
//      //     labelText: 'Enter BMI value',
//      //     labelStyle: TextStyle(fontSize: 17, color: Colors.grey.shade500),
//      //     enabledBorder: OutlineInputBorder(
//      //         borderRadius: BorderRadius.circular(10),
//      //         borderSide: BorderSide(width: 2, color: Color(0xffC5C5C5))),
//      //     focusedBorder: OutlineInputBorder(
//      //         borderRadius: BorderRadius.circular(10),
//      //         borderSide: BorderSide(width: 2, color: Colors.deepOrangeAccent)),
//      //   ),
//  //     child: DropdownButton(
//  //     hint: Text("Enter gender"),
//  //       dropdownColor: Colors.grey,
//  //       icon: Icon(Icons.arrow_drop_down),
//  //       iconSize: 36,
//  //       isExpanded: true,
//  //       underline: SizedBox(),
//  //       style: TextStyle(
//  //         color: Colors.black,
//  //         fontSize: 22,
//  //       ),
//  //       value:choocegender ,
//  //       onChanged: (newvalue){
//  //        setState(() {
//  //          choocegender=newvalue!;
//  //        });
//  //       },
//  //       items: listitem.map((valueItem)
//  //           {
//  //             return DropdownMenuItem(
//  //                 child: Text(valueItem),
//  //                 value: valueItem,
//  //             );
//  //           }
//  //       ).toList()
//  //     ),
//  //   );
//  // }
//
//   // DropdownButton<String> Glucose(){
//   //   List<String> _items = ['Low', 'Mid','High'];
//   //
//   //   return DropdownButton(
//   //     value: gender,
//   //     items: _items.map((String value) {
//   //       return DropdownMenuItem<String>(
//   //         value: value,
//   //         child: Text(value),
//   //       );
//   //     }).toList(),
//   //     onChanged: (String? newValue) {
//   //       setState(() {
//   //         gender = newValue!;
//   //       });
//   //
//   //     },
//   //   );
//   //
//   // }
//
//   // DropdownButton<String> Smoke(){
//   //   List<String> _items = ['Yes', 'No'];
//   //
//   //   return DropdownButton(
//   //     value: gender,
//   //     items: _items.map((String value) {
//   //       return DropdownMenuItem<String>(
//   //         value: value,
//   //         child: Text(value),
//   //       );
//   //     }).toList(),
//   //     onChanged: (String? newValue) {
//   //       setState(() {
//   //         gender = newValue!;
//   //       });
//   //
//   //     },
//   //   );
//   //
//   // }
//   //
//   // DropdownButton<String> Alcoholic(){
//   //   List<String> _items = ['Yes', 'No'];
//   //
//   //   return DropdownButton(
//   //     value: gender,
//   //     items: _items.map((String value) {
//   //       return DropdownMenuItem<String>(
//   //         value: value,
//   //         child: Text(value),
//   //       );
//   //     }).toList(),
//   //     onChanged: (String? newValue) {
//   //       setState(() {
//   //         gender = newValue!;
//   //       });
//   //
//   //     },
//   //   );
//   //
//   // }
//   //
//   // DropdownButton<String> PhisicalA(){
//   //   List<String> _items = ['Yes', 'No'];
//   //
//   //   return DropdownButton(
//   //     value: gender,
//   //     items: _items.map((String value) {
//   //       return DropdownMenuItem<String>(
//   //         value: value,
//   //         child: Text(value),
//   //       );
//   //     }).toList(),
//   //     onChanged: (String? newValue) {
//   //       setState(() {
//   //         gender = newValue!;
//   //       });
//   //
//   //     },
//   //   );
//   //
//   // }
//
// // for name of farmer
// }
// class Products{
//   final String age;
//   final int gender;
//   final String systole;
//   final String dystole;
//   final int cholestole;
//   final int glucose;
//   final int smoke;
//   final int alcohol;
//   final int physicalA;
//   final String BMI;
//
//
//   Products({
//     required this.age,
//     required this.gender,
//     required this.systole,
//     required this.dystole,
//     required this.cholestole,
//     required this.glucose,
//     required this.smoke,
//     required this.alcohol,
//     required this.physicalA,
//     required this.BMI
//
//   });
//
//
//
//   Map<String ,dynamic> toJson()=>
//       {
//         'age':age,
//         'gender':gender,
//         'systole':systole,
//         'dystole':dystole,
//         'cholestole':cholestole,
//         'glucose':glucose,
//         'smoke':smoke,
//         'alcohol':alcohol,
//         'smoke':smoke,
//         'physic_activity':physicalA,
//         'bmi':BMI
//       };
// }