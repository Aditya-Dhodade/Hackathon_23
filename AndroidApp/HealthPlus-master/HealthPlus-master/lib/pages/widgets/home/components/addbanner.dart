import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// import '../../../size_config.dart';
import '../../constantfold/size_config.dart';

class DiscountBanner extends StatelessWidget {
  const DiscountBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 85,
      width: double.infinity,
      margin: EdgeInsets.all(getProportionateScreenWidth(20)),
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
        vertical: getProportionateScreenWidth(15),
      ),
      decoration: BoxDecoration(
        //color: Color(0xFF4A3298),
        color:Colors.teal[300],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text.rich(
        TextSpan(
          style: TextStyle(color: Colors.white),
          children: [

            TextSpan(text: "Add Your health related Report here !\n\n"),

            TextSpan(
              text: "Get diseases predicted",),

            TextSpan(text: " Upload your information  \n\n"),

            TextSpan(
              text: "Get heart diseases predicted",

              style: TextStyle(
                fontSize: getProportionateScreenWidth(24),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
