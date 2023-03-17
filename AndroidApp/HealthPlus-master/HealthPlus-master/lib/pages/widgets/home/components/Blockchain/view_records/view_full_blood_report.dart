import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class ViewFullBloodReport extends StatefulWidget {
  final Map<String, dynamic> mp;

  const ViewFullBloodReport(this.mp, {super.key});

  @override
  State<ViewFullBloodReport> createState() => _ViewFullBloodReportState(mp);
}

class _ViewFullBloodReportState extends State<ViewFullBloodReport> {
  final Map<String, dynamic> myMap;
  String result="Default";
  _ViewFullBloodReportState(this.myMap);

  @override
  Widget build(BuildContext context) {

    if(myMap["Output"] == "0" || myMap["Output"] == "0.0"  )
    {
      result="Anemia";
    }
    else if(myMap["Output"] == "1"  ||  myMap["Output"] == "1.0" )
    {
      result="Covid 19";
    }
    else if(myMap["Output"] == "2" || myMap["Output"] == "2.0" )
    {
      result="Leukemia";
    }
    else if(myMap["Output"] == "3" || myMap["Output"] == "3.0")
    {
      result="Inflammatory Disease";
    }
    else if(myMap["Output"] == "4" || myMap["Output"] == "4.0")
    {
      result="Nutritional Deficiency";
    }
    else if(myMap["Output"] == "5" || myMap["Output"] == "5.0" )
    {
      result="Healthy";
    }


    TableRow buildRow(List<String> cells, {bool isHeader = false}) => TableRow(
        children: cells.map((cell) {
          final style = TextStyle(
            fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
            fontSize: isHeader ? 14 : 13,
            color: isHeader ? Colors.teal : Colors.black,

            //color: Colors.deepOrangeAccent
          );
          return Padding(
              padding: const EdgeInsets.all(12),
              child: Center(
                child: Text(
                  cell,
                  style: style,
                ),
              ));
        }).toList());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("View Report"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
//margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
// height: 200,
// color: Colors.amberAccent,
          height: MediaQuery.of(context).size.height * double.infinity,
          width: MediaQuery.of(context).size.height * double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30), color: Colors.teal[50]),

          child: SingleChildScrollView(
              child: Column(
                children: [
                  Table(
                    //sortColumnIndex: 0,
                    //sortAscending: sort,
                    border: TableBorder.all(
                      color: Colors.teal,
                      width: 1.0,
                      style: BorderStyle.solid,
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    children: [
                      buildRow([
                        'Parameter',
                        'Result',
                      ], isHeader: true),
                      buildRow([
                        "Haemoglobin",myMap["Haemoglobin"].toString()
                        // double.tryParse(myMap["Patient Name"]).toString()
                      ]),
                      buildRow([
                        "Total WBC Count",myMap["Total WBC Count"].toString()
                        // double.tryParse(myMap["Total WBC count"]).toString()
                      ]),
                      buildRow([
                        "RBC count",myMap["RBC count"].toString()
                        // double.tryParse(myMap["RBC count"]).toString()
                      ]),
                      buildRow([
                        "Neutrophils",myMap["Neutrophils"].toString()
                        // double.tryParse(myMap["Neutrothils"]).toString()
                      ]),
                      buildRow([
                        "Lymphocytes",myMap["Lymphocytes"].toString()
                        // double.tryParse(myMap["Lymehocytes"]).toString()
                      ]),
                      buildRow([
                        "Monocytes",myMap["Monocytes"].toString()
                        // double.tryParse(myMap["Monocytes"]).toString()
                      ]),
                      buildRow([
                        "Eosinophils",myMap["Eosinophils"].toString()
                        // double.tryParse(myMap["Eosinophils"]).toString()
                      ]),
                      // buildRow([
                      //   "Monocytes", ""
                      //   // double.tryParse(myMap["Monocytes"]).toString()
                      // ]),
                      // buildRow([
                      //   "Eosinophils", myMap["Total WBC count"].toString()
                      //   // double.tryParse(myMap["Eosinophils"]).toString()
                      // ]),
                      buildRow([
                        "Basophils", myMap["Basophils"].toString()
                        // double.tryParse(myMap["Basophils"]).toString()
                      ]),
                      buildRow([
                        "Haematocrit (HCT)", myMap["Haematocrit (HCT)"].toString()
                        // double.tryParse(myMap["Haematocrit (HCT)"]).toString()
                      ]),
                      buildRow(["MCV", myMap["MCV"].toString()
                        // double.tryParse(myMap["MCV"]).toString()
                      ]
                      ),
                      buildRow(["MCH", myMap["MCH"].toString()
                        // double.tryParse(myMap["MCH"]).toString()
                      ]),
                      buildRow(["MCHC", myMap["MCHC"].toString()
                        // double.tryParse(myMap["MCHC"]).toString()
                      ]),
                      buildRow(["RDW ", myMap["RDW"].toString()
                        // double.tryParse(myMap["RDW"]).toString()
                      ]),
                      buildRow([
                        "Platelet Count",myMap["Platelet Count"].toString()
                        // double.tryParse(myMap["Platelet Count"]).toString()
                      ]),
                      buildRow([
                        "Predicted Disease",myMap['Prediction'].toString()

                        // double.tryParse(myMap["Platelet Count"]).toString()
                      ]),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [],
                  )
                ],
              )),
        ),
      ),
    );
  }
}