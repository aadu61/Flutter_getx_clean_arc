import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Fonts {
  static double fonts40 = 40.spMin;
  static double fonts24 = 24.spMin;


  static const String poppins = 'Poppins';

}

class CustomSize{
  static verticalSpace(double height){
    return SizedBox(height: height,);
  }
  static horizontalSpace(double width){
    return SizedBox(width: width,);
  }
}