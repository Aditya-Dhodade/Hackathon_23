// import 'dart:convert';
// import 'dart:io';
// import 'dart:io' show File;
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:healthplus/components/rounded_icon_btn.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:http/http.dart' as http;
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:healthplus/home/components/view_full_report.dart';
// import 'package:healthplus/home/customloader.dart';
//
//
// class UploadglucoseReport extends StatefulWidget {
//   const UploadglucoseReport({Key? key}) : super(key: key);
//
//   @override
//   _UploadglucoseReportState createState() => _UploadglucoseReportState();
// }
//
//
//
// class _UploadglucoseReportState extends State<UploadglucoseReport> {
//
//   File? _image;
//   String? message;
//   var data;
//   bool isloading=false;
//
//   Future getImage() async {
//     final image = await ImagePicker().pickImage(source: ImageSource.gallery);
//     _image = File(image!.path);
//     setState(() {});
//   }
// // uploading image from here
//   void uploadImage() async {
//     setState(() {
//       isloading=true;
//     });
//     final request = http.MultipartRequest(
//         "POST", Uri.parse("https://db75-106-193-214-189.in.ngrok.io//predict-diabetes"));
//     final headers = {"Content-type": "multipart/form-data"};
//     request.files.add(http.MultipartFile('image',
//         _image!. readAsBytes().asStream(), _image!.lengthSync(),
//         filename: _image!. path.split("/").last));
//     request.headers.addAll(headers);
//     final response = await request.send();
//     http.Response res = await http.Response.fromStream (response);
//
//     Map<String,dynamic> dict = jsonDecode(res.body);
//     print(dict);
//
//     for(MapEntry<String, dynamic> e in dict.entries)
//     {
//       dict[e.key]=e.value.toString();
//     }
//
//     data = json.decode(res.body);
//     User user = FirebaseAuth.instance.currentUser!;
//     FirebaseFirestore db = FirebaseFirestore.instance;
//     db.collection("users")
//         .doc(user.uid)
//         .collection('GlucoseTestReport')
//         .add(dict);
//     db.collection("GlucoseReport").add(dict);
//
//     setState(() {
//       isloading=false;
//       Navigator.push(context, MaterialPageRoute(builder: (context)=> ViewReport(dict)));
//
//     });
//
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.teal,
//         title: Text(" Upload Glucose Report"),
//       ),
//       body: isloading ? CustomLoader():
//       Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           _image == null
//               ? Text('No image selected.',
//             style: TextStyle(color: Colors.teal, fontSize: 20),
//           )
//               : Image.file(_image!),
//
//           Container(
//             width: MediaQuery.of(context).size.width,
//           ),
//
//           ElevatedButton(
//
//               child: Text("Upload Image", style: TextStyle(color: Colors.white,fontSize:25)),
//               style:ElevatedButton.styleFrom(
//                   backgroundColor: Colors.teal,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(30),
//                   )
//               ),
//               onPressed: (){
//                 if(_image != null) {
//                   uploadImage();
//                 }else{
//                   Fluttertoast.showToast(msg: "Please upload report first");
//                 }
//               }
//           ),
//
//           SizedBox(height: 20,),
//
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: Colors.teal,
//         onPressed: getImage,
//         child: Icon(Icons.add_a_photo),
//       ),
//     );
//   }
// }
//
// class UPLOADPDF extends StatelessWidget {
//   const UPLOADPDF({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.white,
//     );
//   }
// }
