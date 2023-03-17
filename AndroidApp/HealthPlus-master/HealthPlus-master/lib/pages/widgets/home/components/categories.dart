import 'dart:convert';

import 'package:face_net_authentication/pages/cubit/keysprivate_cubit.dart';
import 'package:face_net_authentication/pages/widgets/home/components/uploadRecords/view_report.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:health_plus/Statistics/statistics.dart';
// import 'package:health_plus/blockchain/services/functions.dart';
// import 'package:health_plus/home/components/uploadRecords/view_report.dart';
// import 'package:health_plus/screens/upload_records/upload_record_screen.dart';
import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';

import '../../../../blockchain/constants.dart';
// import '../../BlockChain/ExpiryCheck.dart';
// import '../../blockchain/constants.dart';
// import '../../components/message.dart';
import '../../../../blockchain/services/functions.dart';
import '../../constantfold/size_config.dart';
// import '../../size_config.dart';
import '../upload_pdf.dart';
// import 'Blockchain/upload_records/upload_record_screen.dart';
import 'advice.dart';
import 'uploadRecords/upload_record_screen.dart';

class Categories extends StatefulWidget {
  String uid;
  Categories({required this.uid, Key? key}) : super(key: key);
  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
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
    List<Map<String, dynamic>> categories = [
      //{"icon": "assets/icons/Flash Icon.svg", "text": "Near by Lab","key":"1"},
      {
        "icon": "assets/icons/Market View2.svg",
        "text": "Statistics",
        "key": "2"
      },

      {"icon": "assets/icons/Gift Icon.svg", "text": "Expiry", "key": "5"},

      //{"icon": "assets/icons/Game Icon.svg", "text": "Game"},

      {"icon": "assets/icons/receipt.svg", "text": "View Report", "key": "3"},
      {"icon": "assets/icons/Discover.svg", "text": " Add Report", "key": "4"},
    ];
    return Padding(
      padding: EdgeInsets.all(getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          categories.length,
          (index) => CategoryCard(
              icon: categories[index]["icon"],
              text: categories[index]["text"],
              press: () async {
                if (categories[index]["key"] == "1") // Flash deal
                {
                  //Navigator.push(context,MaterialPageRoute(builder: (context)=>FlashDeal()));
                  // Navigator.push(context,MaterialPageRoute(builder: (context)=>PublishScreen()));
                  //  Fluttertoast.showToast(msg: "Nearby Labouratory for test !");
                } else if (categories[index]["key"] == "2") // Advice
                {
                  //Navigator.push(context, MaterialPageRoute(builder: (context)=>LineChartWidget()));

                  // Transaction t1= Transaction (
                  //     sender: "Vishal",
                  //     receiver: "Doctor",
                  //     details: [],
                  //     timestamp: DateTime.now());

                  //Navigator.push(context, MaterialPageRoute(builder: (context)=>VisitDetails(t1, true)));

                  Fluttertoast.showToast(msg: "Advice");
                } else if (categories[index]["key"] == "3") // Market view
                {
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
                  Fluttertoast.showToast(msg: "View Report");
                } else if (categories[index]["key"] == "4") // Add product
                {
                  //Navigator.push(context, MaterialPageRoute(builder: (context)=>UploadPdf()));
                  //Navigator.push(context, MaterialPageRoute(builder: (context)=>UploadPdf()));
                  Fluttertoast.showToast(msg: "Add Report");
                  Navigator.push(context, MaterialPageRoute(builder: (ctx) {
                    return BlocProvider.value(
                      value: BlocProvider.of<KeysprivateCubit>(context),
                      child: UploadRecords(),
                    );
                  }));
                } else if (categories[index]["key"] == "5") // Add product
                {
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => ExpiryCheck()));
                  //Navigator.push(context, MaterialPageRoute(builder: (context)=>UploadPdf()));
                  Fluttertoast.showToast(msg: "Expiry Check");

                  //Navigator.push(context, MaterialPageRoute(builder: (context)=>UploadRecords()));
                  //Navigator.push(context, MaterialPageRoute(builder: (context)=>UploadPdf()));
                  Fluttertoast.showToast(msg: "Add Record");
                }
              }),
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String? icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: getProportionateScreenWidth(55),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(15)),
              height: getProportionateScreenWidth(55),
              width: getProportionateScreenWidth(55),
              decoration: BoxDecoration(
                color: Colors.teal[50],
                borderRadius: BorderRadius.circular(10),
              ),
              child: SvgPicture.asset(icon!),
            ),
            SizedBox(height: 5),
            Text(text!, textAlign: TextAlign.center)
          ],
        ),
      ),
    );
  }
}

// [[[0x515cd5895ff9cc9bebf726262add500e26973fd9, "OrDCt27MJzQHj8pPNFT6tgARPv12", [{Haemoglobin: 8.5, RBC count: 3.99, Total WBC Count: 9900.0, Neutrophils: 31.0, Lymphocytes: 63.0, Monocytes: 4.0, Eosinophils: 2.0, Basophils: 0.0, Haematocrit (HCT): 0.0, MCV: 0.0, MCH: 21.3, MCHC: 32.69, Platelet Count: 431000.0, RDW: 0.0, Prediction: Covid 19, Patient Name: MiSS. SHIVANYA BANE, Age & Sex: 2 Year/Female}, {Haemoglobin: 8.5, RBC count: 3.99, Total WBC Count: 9900.0, Neutrophils: 31.0, Lymphocytes: 63.0, Monocytes: 4.0, Eosinophils: 2.0, Basophils: 0.0, Haematocrit (HCT): 0.0, MCV: 0.0, MCH: 21.3, MCHC: 32.69, Platelet Count: 431000.0, RDW: 0.0, Prediction: Covid 19, Patient Name: MiSS. SHIVANYA BANE, Age & Sex: 2 Year/Female}]]]]

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
