import 'dart:io';


import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mashe/core/constants/export_constant.dart';
import 'package:shimmer/shimmer.dart';

import 'export_common.dart';

class CommonFunctions {
  static imageLoading(
      {required String filePath,
        Null Function()? onTap,
        double? width,
        double? height,
        bool? isProfile,
        String? name,
        BoxFit? fit,
        BorderRadius? borderRadius,
        Widget Function(BuildContext _, String __, dynamic ___)? errorBuilder,
        Color? color}) {
    if (CustomValidation.hasValidUrl(filePath)) {
      return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: onTap ?? () {},
          child: ClipRRect(
            borderRadius: borderRadius ?? BorderRadius.circular(0),
            child: CachedNetworkImage(
              width: width,
              height: height,
              fit: fit,
              color: color,
              imageUrl: filePath,
              errorWidget: errorBuilder ??
                      (_, __, ___) {
                    if (isProfile != null) {
                      return errorUserImageContainer(width: width, height: height, borderRadius: borderRadius);
                    } else {
                      return errorImageContainer(width: width, height: height, borderRadius: borderRadius, name: name);
                    }
                  },
              progressIndicatorBuilder: (_, url, download) {
                if (width != null) {
                  return shimmerImage(width: width, height: height, borderRadius: borderRadius);
                } else {
                  return CircularProgressIndicator(color: MyColors.appBlackColor, value: download.progress);
                }

                // return shimmerImage(
                //     width: width, height: height, borderRadius: borderRadius);
              },
            ),
          ));
    } else if (filePath.split("/").first == "assets") {
      return GestureDetector(
          onTap: onTap ?? () {},
          child: ClipRRect(
            borderRadius: borderRadius ?? BorderRadius.circular(0),
            child: Image.asset(
              filePath,
              width: width,
              height: height,
              color: color,
              fit: fit,
              errorBuilder: (_, __, ___) {
                if (isProfile != null) {
                  return errorUserImageContainer(width: width, height: height, borderRadius: borderRadius);
                } else {
                  return errorImageContainer(width: width, height: height, borderRadius: borderRadius, name: name);
                }
              },
              frameBuilder: (_, image, loadingBuilder, __) {
                if (loadingBuilder == null) {
                  return shimmerImage(width: width, height: height, borderRadius: borderRadius);
                }
                return image;
              },
            ),
          ));
    } else {
      return GestureDetector(
          onTap: onTap ?? () {},
          child: ClipRRect(
            borderRadius: borderRadius ?? BorderRadius.circular(0),
            child: Image.file(
              File(filePath),
              width: width,
              height: height,
              color: color,
              fit: fit,
              errorBuilder: (_, __, ___) {
                if (isProfile != null) {
                  return errorUserImageContainer(width: width, height: height, borderRadius: borderRadius);
                } else {
                  return errorImageContainer(width: width, height: height, borderRadius: borderRadius, name: name);
                }
              },
              frameBuilder: (_, image, loadingBuilder, __) {
                if (loadingBuilder == null) {
                  return shimmerImage(width: width, height: height, borderRadius: borderRadius);
                }
                return image;
              },
            ),
          ));
    }
  }

  ///Common Shimmer Image effect
  static Widget shimmerImage({double? height, double? width, BorderRadius? borderRadius}) {
    return Shimmer.fromColors(
      baseColor: MyColors.shimmerBaseColor,
      highlightColor: MyColors.shimmerHighLightColor,
      child: Container(
        height: height ?? double.infinity,
        width: width ?? double.infinity,
        decoration: BoxDecoration(
            borderRadius: borderRadius,
            border: Border.all(
              width: 1,
              color: MyColors.appPrimaryRed,
            )),
      ),
    );
  }

  ///Error loading image when
  static Widget errorImageContainer({double? width, double? height, BorderRadius? borderRadius, required String? name}) {
    return Container(
      height: height ?? double.infinity,
      width: width ?? double.infinity,
      decoration: BoxDecoration(
          borderRadius: borderRadius,
          color: name != null ? MyColors.appPrimaryRed.withOpacity(0.2) : null,
          border: Border.all(
            width: 1,
            color: name == null ? MyColors.appPrimaryRed : Colors.transparent,
          )),
      child: Padding(
        padding: EdgeInsets.all(30.sp),
        child: name == null
            ? Image.asset(
          ImageConstants.appLogoSplashScreen,
        )
            : Center(
          child: customTextView(
              text: clipName(userName: name, custom: false),
              fontSize: 32.sp,
              fontWeight: FontWeight.w700,
              color: MyColors.appBlackColor,
              fontFamily: Fonts.poppins),
        ),
      ),
    );
  }

  static Widget errorUserImageContainer({double? width, double? height, BorderRadius? borderRadius}) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(borderRadius: borderRadius, color: MyColors.appPrimaryRed),
      child: Padding(
        padding: EdgeInsets.all(width! >= 50.sp ? 20.sp : 10.sp),
        child: Image.asset(
          ImageConstants.appLogoSplashScreen,
          color: MyColors.appPrimaryRed,
        ),
      ),
    );
  }

  String getExtension(String? url) {
    String extension = "";
    if (url?.isNotEmpty ?? false) {
      extension = url?.split(".").last.toLowerCase() ?? '';
    }
    return extension;
  }

  /// type cast function
  static double safeParseDouble(dynamic value) {
    try {
      return double.parse((value as dynamic).toString());
    } on FormatException {
      return 0.0;
    } catch (e) {
      Console.debug(e);
      return 0.0;
    }
  }

  static int safeParseInt(dynamic value) {
    try {
      return int.parse((value as dynamic).toString());
    } catch (e) {
      return 0;
    }
  }

  static num safeParseNum(dynamic value) {
    try {
      return num.parse((value as dynamic).toString());
    } catch (e) {
      return 0;
    }
  }

  static DateTime safeParseDateTime(dynamic value) {
    try {
      return DateTime.parse((value as dynamic).toString());
    } catch (e) {
      return DateTime.now();
    }
  }

  void showCustomSnackBar({required String msg}) {
    double progressPercentage = 0;
    Console.debug("Snack Bar calling....");
    final snackBar = SnackBar(
      content: Container(
        height: 50.sp + MediaQuery.of(Get.context!).padding.bottom,
        width: double.infinity,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: MyColors.appPrimaryRed.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 15,
            offset: const Offset(0, 2),
          ),
        ]),
        child: Row(
          children: [
            // Image.asset(
            //   "icons/ic_infoCircle.png",
            //   height: 25.sp,
            //   width: 25.sp,
            //   color: MyColors.yellow,
            // ),
            SizedBox(
              width: 5.w,
            ),
            customTextView(
              text: msg,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      backgroundColor: MyColors.naturalWhite,
      elevation: 0.6,
      padding: EdgeInsets.zero,
      duration: const Duration(seconds: 3),
    );

    ScaffoldMessenger.of(Get.context!).clearSnackBars();
    ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar);
  }

  static Widget customTextView(
      {required String text,
        Color? color,
        Color? backgroundColor,
        double? fontSize,
        FontWeight? fontWeight,
        String? fontFamily,
        TextDecoration? textDecoration,
        TextAlign? textAlign,
        TextOverflow? overflow,
        Paint? foreGround,
        double? lineHeight,
        TextStyle? style,
        int? maxLine}) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLine,

      style: style ??
          TextStyle(
            decoration: textDecoration ?? TextDecoration.none,
            fontSize: fontSize,
            height: lineHeight,
            fontFamily: fontFamily ?? Fonts.poppins,
            fontWeight: fontWeight,
            foreground: foreGround,

            backgroundColor: backgroundColor,
            color: color,
          ),
    );
  }

  ///Custom Button using ink well  effect.
  ///
  ///you can change ink well color using highlightcolor property.
  ///
  ///you can also give shadow to the buttons using list of shadow.
  ///
  /// you can attach icon as well and can show that using bool as isIconVisible.
  ///
  /// you can give vertical space and can change button style using text styles property.
  ///
  /// you can give gradient color as well to button with text color also.
  ///
  /// created by aadesh mishra 6/02/2023
  static customButton({
    Gradient? gradientColor,
    Color? backGroundColor,
    required String buttonText,
    required Null Function() onTap,
    Color? highlightColor,
    Color? textColor,
    List<BoxShadow>? boxShadow,
    String? icon,
    bool? isIconVisible,
    Color? borderColor,
    double? textFontSize,
    String? textFontFamily,
    FontWeight? textFontWeight,
    double? verticalPadding,
    BorderRadius? borderradius,
  }) {
    return Container(
      decoration: BoxDecoration(
          color: backGroundColor ?? MyColors.appCardBackGround,
          borderRadius: borderradius ?? BorderRadius.circular(8.sp),
          border: Border.all(color: borderColor ?? Colors.transparent, width: 1),
          boxShadow: boxShadow,
          gradient: gradientColor),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          highlightColor: highlightColor ?? MyColors.naturalWhite.withOpacity(0.3),
          onTap: onTap,
          borderRadius: borderradius ?? BorderRadius.circular(8.sp),
          child: Container(
              width: Get.width,
              padding: EdgeInsets.symmetric(vertical: verticalPadding ?? 21.sp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  customTextView(
                      text: buttonText,
                      color: textColor ?? MyColors.naturalWhite,
                      fontSize: textFontSize ?? 18.sp,
                      fontWeight: textFontWeight ?? FontWeight.w600,
                      fontFamily: textFontFamily ?? Fonts.poppins,
                      textAlign: TextAlign.center),
                  Visibility(
                    visible: isIconVisible ?? false,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Image.asset(
                        icon ?? "",
                        height: 20.sp,
                        width: 20.sp,
                      ),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }




}

String clipName({required String userName, bool custom = false}) {
  String trimmedName = userName.trim();
  List<String> trimmedNameList = trimmedName.split(" ");
  try {
    if (custom) {
      return trimmedName != ''
          ? (trimmedNameList.length >= 2)
          ? trimmedNameList.first[0].toUpperCase() + trimmedNameList[1][0].toUpperCase()
          : trimmedNameList.first[0].toUpperCase() + trimmedNameList.first[1].toUpperCase()
          : '';
    } else {
      return trimmedName != ''
          ? (trimmedNameList.length >= 2)
          ? trimmedNameList.first[0].toUpperCase() + trimmedNameList.last[0].toUpperCase()
          : trimmedNameList.first[0].toUpperCase() + trimmedNameList.first[1].toUpperCase()
          : '';
    }
  } catch (e) {
    Console.debug(e);
    return 'NA';
  }
}