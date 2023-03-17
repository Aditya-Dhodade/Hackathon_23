// // import 'dart:html';
//
// // import 'dart:html';
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:healthplus/home/components/view_full_report.dart';
//
// import '../icon_but_with_cnt.dart';
//
// class Middle extends StatefulWidget {
//   const Middle({Key? key}) : super(key: key);
//
//   @override
//   State<Middle> createState() => _MiddleState();
// }
//
// class _MiddleState extends State<Middle> {
//
//   User user = FirebaseAuth.instance.currentUser!;
//   FirebaseFirestore db = FirebaseFirestore.instance;
//
//   void PrintCheck()
//   {
//
//   }
//   @override
//   Widget build(BuildContext context) {
//
//    PrintCheck();
//
// //     return Padding(
// //       padding: const EdgeInsets.all(10.0),
// //       child: Container(
// // //margin: const EdgeInsets.all(10),
// //         padding: const EdgeInsets.all(10),
// // // height: 200,
// // // color: Colors.amberAccent,
// //         height: MediaQuery.of(context).size.height *(1/4),
// //         width: MediaQuery.of(context).size.height *double.infinity,
// //         decoration: BoxDecoration(border: Border.all(width: 2, color: Colors.teal),borderRadius: BorderRadius.circular(30),color: Colors.teal[50]),
// //
// //
// //         child: SingleChildScrollView(
// //           child: Column(
// // //mainAxisAlignment: MainAxisAlignment.center,
// //
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// // //               IconBtnWithCounter(
// // //                   svgSrc: "assets/icons/User.svg",
// // //                   press: () {
// // // //Navigator.push(context, MaterialPageRoute(builder:(context)=> CartScreen()));
// // // //Navigator.push(context, MaterialPageRoute(builder:(context)=> CustomAppBar(rating: 100.0)));
// // // //Navigator.pushNamed(context, AddProduct.routeName);
// // //                   }
// // //               ),
// //               SizedBox(height: 10,),
// //               Text(
// //                 "Name    :",
// //                 style: TextStyle(color: Colors.deepOrangeAccent,fontSize: 20,fontWeight: FontWeight.bold,),
// //               ),
// //
// //
// //               const SizedBox(
// //                 height: 5,
// //               ),
// //               Text(
// //                 "Test       :",
// //                 style: TextStyle(color: Colors.deepOrangeAccent,fontSize: 20,fontWeight: FontWeight.bold,),
// //               ),
// //               const SizedBox(
// //                 height: 5,
// //               ),
// //               Text(
// //                 "Age        :",
// //                 style: TextStyle(color: Colors.deepOrangeAccent,fontSize: 20,fontWeight: FontWeight.bold,),
// //               ),
// //               const SizedBox(
// //                 height: 5,
// //               ),
// //               Text(
// //                 "Gender  :",
// //                 style: TextStyle(color: Colors.deepOrangeAccent,fontSize: 20,fontWeight: FontWeight.bold,),
// //               ),
// //
// //               const SizedBox(
// //                 height: 5,
// //               ),
// //               Text(
// // //"Deal Date :"+(snapshot.data?.docs[index]['Deal_Date']),
// // //timeago.format(document.data['tripDoc']['docCreatedOn'].toDate())
// //                 "Date       : ",
// //                 style: TextStyle(color: Colors.deepOrangeAccent,fontSize: 20,fontWeight: FontWeight.bold,),
// //               ),
// //               const SizedBox(
// //                 height: 5,
// //               ),
// //               Row(
// //                 mainAxisAlignment: MainAxisAlignment.end,
// //                 crossAxisAlignment: CrossAxisAlignment.center,
// //                 children: [
// //
// // // GestureDetector(
// // //   onTap: () {
// // //
// // //   },
// // //   child: Row(
// // //     children: [
// // //       Icon(
// // //         Icons.shopping_cart,
// // //         color: Colors.red[700],
// // //       ),
// // //     ],
// // //   ),
// // // ),
// //                   IconBtnWithCounter(
// //                       svgSrc: "assets/icons/receipt.svg",
// //                       press: () {
// //                     Navigator.push(context, MaterialPageRoute(builder:(context)=> ViewReport()));
// // //Navigator.push(context, MaterialPageRoute(builder:(context)=> CustomAppBar(rating: 100.0)));
// // //Navigator.pushNamed(context, AddProduct.routeName);
// //                       }
// //                   ),
// //                 ],
// //               )
// //
// //
// //
// //
// //
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
//   return Padding(
//     padding: const EdgeInsets.all(8.0),
//     child: Container(
//       child: StreamBuilder(
//         // stream: db.collection('users').doc(),
//
//
//         stream: FirebaseFirestore.instance.collection("users").doc(user.uid).collection('Reports').snapshots(),
//         builder: (context,AsyncSnapshot<QuerySnapshot> snapshot){
//
//           if(snapshot.hasData){
//             return ListView.builder(
//                 itemCount: snapshot.data!.docs.length,
//                 itemBuilder: (context,index){
//                   var data=snapshot.data!.docs[index].data() as Map<String,dynamic>;
//                   return Padding(
//                     padding: const EdgeInsets.all(10.0),
//                     child: SingleChildScrollView(
//                       child: Container(
//                         //margin: const EdgeInsets.all(10),
//                         padding: const EdgeInsets.all(10),
//                         // height: 200,
//                         // color: Colors.amberAccent,
//                         height: MediaQuery.of(context).size.height *1/4,
//                         width: MediaQuery.of(context).size.height *1/3,
//                         decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),border: Border.all(width: 2, color: Colors.teal),color: Colors.teal[50]),
//
//
//                         child: SingleChildScrollView(
//                           child: Padding(
//                             padding: const EdgeInsets.only(left: 5,top: 8.0),
//                             child: Column(
//                               //mainAxisAlignment: MainAxisAlignment.center,
//
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//
//                                 Text(
//
//
//                                   "Name :"+snapshot.data?.docs[index]['Patient Name'],
//                                   style: TextStyle(color: Colors.deepOrangeAccent,fontSize: 15),),
//                                 const SizedBox(
//                                   height: 5,
//                                 ),
//
//                                 Text(
//                                   "Age & Gender :"+snapshot.data?.docs[index]['Age & Sex'],
//                                   style: TextStyle(color: Colors.deepOrangeAccent,fontSize: 15),
//                                 ),
//                                 const SizedBox(
//                                   height: 5,
//                                 ),
//                                 // Text(
//                                 //   "Location :"+snapshot.data?.docs[index]['location'],
//                                 //   style: TextStyle(color: Colors.deepOrangeAccent,fontSize: 15),
//                                 // ),
//                                 const SizedBox(
//                                   height: 5,
//                                 ),
//                                 Text(
//                                   "Test Name :"+ "EDTA Blood Test",
//                                   style: TextStyle(color: Colors.deepOrangeAccent,fontSize: 15),
//                                 ),
//                                 const SizedBox(
//                                   height: 5,
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   );
//                   return Container();
//                 }
//
//             );
//
//           }
//           else
//             {
//               return CircularProgressIndicator();
//             }
//         },
//       ),
//     ),
//   );
//   }
//
//
// }
