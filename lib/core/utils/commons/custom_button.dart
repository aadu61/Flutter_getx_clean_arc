import 'package:flutter_svg/svg.dart';

import '../../export_core.dart';


class CustomButton extends StatelessWidget {
  final String name;
  final VoidCallback? onTap;
  final String? icon;
  final Color? buttonColor;
  final Color textColor;
  final bool isActive;
  final bool isBorder;
  final double? inSideVerticalPadding;

  const CustomButton(
      {Key? key,
      required this.name,
      required this.onTap,
      this.icon,
      this.buttonColor,
      this.textColor = Colors.white,
      this.isActive = false,
      this.isBorder = false,
      this.inSideVerticalPadding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        highlightColor: MyColors.naturalWhite.withOpacity(0.3),
        onTap: onTap != null
            ? () {
                onTap!();
              }
            : null,
        child: Ink(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.sp),
            border: isBorder ? Border.all(color: MyColors.naturalWhite, width: 2.sp) : null,
            color: isBorder
                ? null
                : (buttonColor != null)
                    ? isActive ? buttonColor: MyColors.lightGray
                    : null,
            // backgroundBlendMode: isBorder
            //     ? null
            //     : isActive
            //         ? null
            //         : BlendMode.luminosity,
            gradient: isBorder
                ? null
                : (buttonColor != null)
                    ? null
                    : LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: isActive ? MyColors.activeButtonColor : MyColors.deActiveButtonColor),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: inSideVerticalPadding ?? 24.sp),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (icon != null && icon != "") ...[
                  icon?.split(".").last == "svg"
                      ? SvgPicture.asset(
                          icon ?? "",
                          height: 22.sp,
                          width: 22.sp,
                          color: textColor,
                        )
                      : Image.asset(
                          icon ?? "",
                          height: 22.sp,
                          width: 22.sp,
                          color: textColor,
                        ),
                  CustomSize.horizontalSpace(6.8.sp),
                ],
                CommonFunctions.customTextView(
                    text: name,
                    fontWeight:FontWeight.w600,
                    fontSize: 16.sp,
                    color: isActive ?  MyColors.naturalWhite:MyColors.naturalBlack,
                    textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
