
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../constantfold/size_config.dart';


// import '../size_config.dart';

class  CustomLoader extends StatefulWidget {

  // static String routeName="/splash";
  const CustomLoader({Key? key}) : super(key: key);
  //static String routeName="/splash";
  //static String routeName="/splash";
  _CustomLoaderState createState() => _CustomLoaderState();
}
class _CustomLoaderState extends State<CustomLoader> {
  var auth =FirebaseAuth.instance;
  var isLogin =false;

  checkIfLogin() async{
    auth.authStateChanges().listen((User? user) {
      if(user!=null && mounted){
        setState(() {
          isLogin=true;
        });
      }
    });
  }

  void initState()
  {
    //checkIfLogin();
    super.initState();
    _navigatetohome();
  }
  _navigatetohome()async
  {
    await Future.delayed(Duration(milliseconds: 5000),(){});// await for 1.5 seconds


    // Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=> ViewUserReport()));



  }



  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        backgroundColor: Colors.white,

        body:
        Container(
            margin: EdgeInsets.only(left: 25, right: 25),
            alignment: Alignment.center,
            child:
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/healthCustom.gif", height: 300, width: 300,alignment: Alignment.topCenter,),
                  SizedBox(height: 10,),
                  Text("Uploading your report please wait", style: TextStyle(
                      fontSize: 22,fontWeight: FontWeight.bold,
                      color: Colors.teal[500]
                  ),
                  ),
                  SizedBox(height: 10,),

                ],
              ),
            )
        )
    );
  }
}


