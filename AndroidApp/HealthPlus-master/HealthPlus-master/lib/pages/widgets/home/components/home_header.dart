import 'package:face_net_authentication/pages/widgets/home/components/search_field.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
// import 'package:health_plus/home/components/search_field.dart';



// import '../../profile/profile_screen.dart';
// import '../../size_config.dart';
import '../../constantfold/size_config.dart';
import '../icon_but_with_cnt.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SearchField(),
          IconBtnWithCounter(
              svgSrc: "assets/icons/User.svg",
              press: () {
                //Navigator.push(context, MaterialPageRoute(builder:(context)=> CartScreen()));
                //Navigator.push(context, MaterialPageRoute(builder:(context)=> CustomAppBar(rating: 100.0)));
                //Navigator.pushNamed(context, AddProduct.routeName);

                // Navigator.push(context, MaterialPageRoute(builder:(context)=> ProfileScreen()));

              }
          ),
          //Admin(),  // removed from search field add cart
          //CustomBottomNavBar()
        ],
      ),
    );
  }
}
