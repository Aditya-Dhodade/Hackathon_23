// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:hive/hive.dart';
//
// import '../../components/custom_surfix_icon.dart';
// import '../../models/add_date.dart';
//
// class Advice extends StatefulWidget {
//   const Advice({Key? key}) : super(key: key);
//
//   @override
//   State<Advice> createState() => _AdviceState();
// }
//
// class _AdviceState extends State<Advice> {
//   User? user = FirebaseAuth.instance.currentUser;
//
//   @override
//   Widget build(BuildContext context) {
//     // return Scaffold(
//     //   appBar: AppBar(
//     //     title: const Text("Advice"),
//     //     backgroundColor: Colors.teal[500],
//     //   ),
//     //     body:   Padding(
//     //       padding: const EdgeInsets.all(8.0),
//     //       child: SingleChildScrollView(
//     //         child: Container(
//     //           child: StreamBuilder(
//     //             stream: FirebaseFirestore.instance.collection('laboratory').snapshots(),
//     //             builder: (context,AsyncSnapshot<QuerySnapshot> snapshot){
//     //
//     //               if(snapshot.hasData){
//     //                 return ListView.builder(
//     //                     itemCount: snapshot.data!.docs.length,
//     //                     itemBuilder: (context,index){
//     //                       var data=snapshot.data!.docs[index].data() as Map<String,dynamic>;
//     //                       return Padding(
//     //                         padding: const EdgeInsets.all(10.0),
//     //                         child: SingleChildScrollView(
//     //                           child: Container(
//     //                             //margin: const EdgeInsets.all(10),
//     //                             padding: const EdgeInsets.all(10),
//     //                             // height: 200,
//     //                             // color: Colors.amberAccent,
//     //                             height: MediaQuery.of(context).size.height *1/4,
//     //                             width: MediaQuery.of(context).size.height *1/3,
//     //                             decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),border: Border.all(width: 2, color: Colors.teal),color: Colors.teal[50]),
//     //
//     //
//     //                             child: SingleChildScrollView(
//     //                               child: Padding(
//     //                                 padding: const EdgeInsets.only(left: 5,top: 8.0),
//     //                                 child: Column(
//     //                                   //mainAxisAlignment: MainAxisAlignment.center,
//     //
//     //                                   crossAxisAlignment: CrossAxisAlignment.start,
//     //                                   children: [
//     //                                     Text(
//     //                                       "Laboratory Name :"+snapshot.data?.docs[index]['labname'],
//     //                                       style: TextStyle(color: Colors.deepOrangeAccent,fontSize: 15),),
//     //                                     const SizedBox(
//     //                                       height: 5,
//     //                                     ),
//     //
//     //                                     Text(
//     //                                       "Owner's Name :"+snapshot.data?.docs[index]['ownername'],
//     //                                       style: TextStyle(color: Colors.deepOrangeAccent,fontSize: 15),
//     //                                     ),
//     //                                     const SizedBox(
//     //                                       height: 5,
//     //                                     ),
//     //                                     // Text(
//     //                                     //   "Location :"+snapshot.data?.docs[index]['location'],
//     //                                     //   style: TextStyle(color: Colors.deepOrangeAccent,fontSize: 15),
//     //                                     // ),
//     //                                     const SizedBox(
//     //                                       height: 5,
//     //                                     ),
//     //                                     Text(
//     //                                       "Contact no :"+snapshot.data?.docs[index]['mobileno'],
//     //                                       style: TextStyle(color: Colors.deepOrangeAccent,fontSize: 15),
//     //                                     ),
//     //                                     const SizedBox(
//     //                                       height: 5,
//     //                                     ),
//     //                                   ],
//     //                                 ),
//     //                               ),
//     //                             ),
//     //                           ),
//     //                         ),
//     //                       );
//     //                       return Container();
//     //                     }
//     //
//     //                 );
//     //
//     //               }
//     //               return Container();
//     //
//     //             },
//     //           ),
//     //         ),
//     //       ),
//     //     ),
//     //     floatingActionButton: FloatingActionButton(
//     //
//     //     //onPressed: _incrementCounter,
//     //     onPressed:(){},
//     //     tooltip: 'Increment',
//     //
//     //     child: Icon(Icons.add,color: Colors.white,),
//     //       backgroundColor: Colors.teal,
//     //
//     //     ),
//     // );
//
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.teal,
//         title: Text("Near By Lab"),
//       ),
//       body: Container(
//         child: StreamBuilder(
//           stream: FirebaseFirestore.instance.collection("users").doc(user!.uid).collection("Reports").snapshots(),
//           builder: (context,AsyncSnapshot<QuerySnapshot> snapshot){
//
//             if(snapshot.hasData){
//               return ListView.builder(
//                   itemCount: snapshot.data!.docs.length,
//                   itemBuilder: (context,index){
//                     var data=snapshot.data!.docs[index].data() as Map<String,dynamic>;
//                     return Padding(
//                       padding: const EdgeInsets.all(10.0),
//                       child: SingleChildScrollView(
//                         child: Container(
//                           //margin: const EdgeInsets.all(10),
//                           padding: const EdgeInsets.all(10),
//                           // height: 200,
//                           // color: Colors.amberAccent,
//                           height: MediaQuery.of(context).size.height *1/4,
//                           width: MediaQuery.of(context).size.height *1/3,
//                           decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),border: Border.all(width: 2, color: Colors.teal),color: Colors.teal[50]),
//
//
//                           child: SingleChildScrollView(
//                             child: Padding(
//                               padding: const EdgeInsets.only(left: 5,top: 8.0),
//                               child: Column(
//                                 //mainAxisAlignment: MainAxisAlignment.center,
//
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     "Age & Gender :"+snapshot.data?.docs[index]['Age & Sex'],
//                                     style: TextStyle(color: Colors.deepOrangeAccent,fontSize: 15),),
//                                   const SizedBox(
//                                     height: 5,
//                                   ),
//
//                                   Text(
//                                     "Patient Name :"+snapshot.data?.docs[index]['Patient Name'],
//                                     style: TextStyle(color: Colors.deepOrangeAccent,fontSize: 15),
//                                   ),
//                                   const SizedBox(
//                                     height: 5,
//                                   ),
//                                   // Text(
//                                   //   "Location :"+snapshot.data?.docs[index]['location'],
//                                   //   style: TextStyle(color: Colors.deepOrangeAccent,fontSize: 15),
//                                   // ),
//                                   const SizedBox(
//                                     height: 5,
//                                   ),
//                                   // Text(
//                                   //   "Contact no :"+snapshot.data?.docs[index]['mobileno'],
//                                   //   style: TextStyle(color: Colors.deepOrangeAccent,fontSize: 15),
//                                   // ),
//                                   const SizedBox(
//                                     height: 5,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     );
//                     return Container();
//                   }
//
//               );
//
//             }
//             return Container();
//
//           },
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: Colors.teal,
//         onPressed:(){
//           // Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=> AddDetails(txt: "")));
//         },
//         tooltip: 'Increment',
//         child:  Icon(Icons.add),
//       ),
//     );
//   }
// }
//
//
//
//
//
//
//
