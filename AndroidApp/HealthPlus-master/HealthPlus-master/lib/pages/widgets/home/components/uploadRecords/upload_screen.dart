// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:healthplus/home/components/uploadRecords/blood_test_screen.dart';
// import 'package:healthplus/home/components/uploadRecords/heart_MRI_screen.dart';
// import 'package:healthplus/home/components/uploadRecords/lung_x_ray.dart';
//
// import 'glucose_test_screen.dart';
//
// class UploadRecords extends StatefulWidget {
//   const UploadRecords({Key? key}) : super(key: key);
//
//   @override
//   State<UploadRecords> createState() => _UploadRecordsState();
// }
//
// class _UploadRecordsState extends State<UploadRecords> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Upload medical records"),
//       ),
//         body: Padding(
//           padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
//           child: Column(
//             children: [
//               // Full width button Example 1
//               SizedBox(
//                   width: double.infinity,
//                   child: ElevatedButton(
//                       onPressed: () {
//                         Navigator.push(context,
//                             MaterialPageRoute(builder: (context)=> UploadBloodTest()
//                             )
//                         );
//                       },
//                       child: const Text('Add Blood test',
//                         style: TextStyle(
//                           fontSize: 15
//                         ),
//                       )
//                   )
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               SizedBox(
//                   width: double.infinity,
//                   child: ElevatedButton(
//                       onPressed: () {
//                         Navigator.push(context,
//                           MaterialPageRoute(builder: (context)=> UploadglucoseReport())
//                         );
//                       },
//                       child: const Text('Add glucose test',
//                         style: TextStyle(
//                           fontSize: 15
//                         ),
//                       )
//                   )
//               ),
//               // Full width button Example 2
//
//               const SizedBox(
//                 height: 20,
//               ),
//               SizedBox(
//                   width: double.infinity,
//                   child: ElevatedButton(
//                       onPressed: () {
//                         Navigator.push(context,
//                           MaterialPageRoute(builder: (context)=> UploadHeartMRI()
//                           )
//                         );
//                       },
//                       child: const Text('Add  heart MRI',
//                         style: TextStyle(
//                           fontSize: 15
//                         ),
//                       )
//                   )
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               SizedBox(
//                   width: double.infinity,
//                   child: ElevatedButton(
//                       onPressed: () {
//                         Navigator.push(context,
//                           MaterialPageRoute(builder: (context)=> UploadLungXray())
//                         );
//                       },
//                       child: const Text('Add lung X-ray',
//                         style: TextStyle(
//                           fontSize: 15
//                         ),
//                       )
//                   )
//               ),
//
//               // Full width button 3
//
//             ],
//           ),
//         ),
//       );
//
//   }
// }
