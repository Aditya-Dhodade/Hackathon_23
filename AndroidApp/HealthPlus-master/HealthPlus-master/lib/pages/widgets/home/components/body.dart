import 'package:flutter/cupertino.dart';

import '../../constantfold/size_config.dart';
// import '../../size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenWidth(20)),
            //HomeHeader(),
            SizedBox(height: getProportionateScreenWidth(10)),
            //DiscountBanner(),
           // Categories(),
            SizedBox(height: getProportionateScreenWidth(10)),
            //EcommerceImage(),
            SizedBox(height: getProportionateScreenWidth(30)),
            //PopularProducts(),
            SizedBox(height: getProportionateScreenWidth(30)),
          ],
        ),
      ),
    );
  }
}
