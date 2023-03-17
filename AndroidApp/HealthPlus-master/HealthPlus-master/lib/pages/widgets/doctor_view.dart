import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';

import '../../blockchain/constants.dart';
import '../../blockchain/services/functions.dart';
import 'home/components/uploadRecords/view_report.dart';

class DoctorView extends StatefulWidget {
  const DoctorView({required this.uid,Key? key}) : super(key: key);
  final String uid;

  @override
  State<DoctorView> createState() => _DoctorViewState();
}

class _DoctorViewState extends State<DoctorView> {
  Client? httpClient;
  Web3Client? ethClient;

  @override
  void initState() {
    // TODO: implement initState
    httpClient = Client();
    ethClient = Web3Client(POLYGON_ALCHEMY, httpClient!);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(child: Container(child: Text("View Report")),onPressed: ()async {
          List<dynamic> datas = await getAllPatient(ethClient!);
                  // print(datas);
                  List<Map<String, dynamic>> blockData =
                      getData(widget.uid, datas);
                  print(blockData);
                  await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ViewUserReport(
                                blockData: blockData,
                              )));
        },)
      ),
    );
  }
}

List<Map<String, dynamic>> getData(String uid, List<dynamic> datas) {
  List<dynamic> inidata = datas[0];
  print("object");
  print(inidata);
  List<Map<String, dynamic>> def = [];
  for (var everyPerson in inidata) {
    print("every");
    print(everyPerson[1] == '"${uid}"');
    // print(everyPerson[1].runtimeType);
    // print("asd");
    // print(uid.runtimeType);
    if (everyPerson[1] == '"${uid}"') {
      // for (var everyjson in everyPerson[2]) {
      //   def.add(jsonDecode(everyjson));
      // }
      for (int i = 2; i < everyPerson[2].length; i++) {
        def.add(jsonDecode(everyPerson[2][i]));
      }
    }
  }
  return def;
}
