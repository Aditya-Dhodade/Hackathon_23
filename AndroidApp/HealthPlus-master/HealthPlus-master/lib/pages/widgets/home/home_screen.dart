

// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:face_net_authentication/pages/cubit/keysprivate_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import '../components/custom_navigation_bar.dart';
// import '../enums.dart';
// import '../size_config.dart';
// import 'components/SuggesstionBanner.dart';
import '../constantfold/size_config.dart';
import 'components/addbanner.dart';
import 'components/categories.dart';
import 'components/home_header.dart';
import 'components/middleparts.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(child: Body()),
      //bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home,) ////////////
      //bottomNavigationBar: Bottom(),
    );
  }
}
class Body extends StatelessWidget {
  User? user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(

        child: Column(
          children: [
            SizedBox(height: getProportionateScreenWidth(25)),
            HomeHeader(),
            SizedBox(height: getProportionateScreenWidth(25)),
            DiscountBanner(),
            
            BlocProvider.value(value: BlocProvider.of<KeysprivateCubit>(context),child: Categories(uid: BlocProvider.of<KeysprivateCubit>(context).uID,),)


          ],
        ),
      ),
    );
  }
}
