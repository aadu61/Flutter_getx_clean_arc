import 'package:flutter/material.dart';

class MyColors {
  // Light theme Colors
 static Color appBlackColor = const Color(0xff262626);
 static Color appPrimaryRed = const Color(0xffD91643);
 static Color naturalWhite = const Color(0xffFFFFFF);
 static Color naturalBlack = const Color(0xff000000);
 static Color appCardBackGround = const Color(0xffF2F2F2);
 static Color appLineGrey = const Color(0xffEBEBEB);
 static Color lightGray = const Color(0xffB7B7B7);
 static Color fontGrey = const Color(0xff858585);
 static Color newGrayTextColor =  const Color(0xff626C7A);
 static Color darkGrey =  const Color(0xffA6A6A6);
 static Color blueBanner =  const Color(0xff007499);
 static Color voliteBanner =  const Color(0xff6733AB);
 static Color orangeBanner =  const Color(0xffE56000);
 static Color scafoldBg =  const Color(0xffFCFCFC);
 static Color warningColor =  const Color(0xffFFA801);

 static Color shimmerBaseColor = Colors.black.withOpacity(0.8);
 static Color shimmerHighLightColor = const Color(0xffF9F9F9);
 static Color shimmerDarkGreyColor =  const Color(0xff666666).withOpacity(0.05);

 static List<Color> deActiveButtonColor = [
   lightGray,
   lightGray,
   lightGray,
 ];
 static List<Color> activeButtonColor = [
   appPrimaryRed,
   appPrimaryRed,
   appPrimaryRed
 ];

}

class MyGradient {

  static Gradient secondWinnerBackground = const LinearGradient(colors: [Color(0xFF6B6B6B), Color(0xFFB4B4B4)], begin: Alignment.topCenter, end: Alignment.bottomCenter);

  static Gradient thirdWinnerBackground = const LinearGradient(colors: [Color(0xFF84574A), Color(0xFFA4824C)], begin: Alignment.topCenter, end: Alignment.bottomCenter);

  static Shader secondWinner = const LinearGradient(
    colors: <Color>[Color(0xFF6B6B6B), Color(0xFFB4B4B4)],
  ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  static Shader thirdWinner = const LinearGradient(
    colors: <Color>[Color(0xFF84574A), Color(0xFFA4824C)],
  ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
}