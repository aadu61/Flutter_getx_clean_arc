import 'package:mashe/core/export_core.dart';

class AppTheme {
  static void changeAppTheam() {
    if (Get.isDarkMode) {
      Get.changeThemeMode(ThemeMode.light);
    } else {
      Get.changeThemeMode(ThemeMode.dark);
    }
  }

  ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      textTheme: TextTheme(
        titleMedium: TextStyle(fontSize: 24.spMin, fontFamily: Fonts.poppins, fontWeight: FontWeight.w600, color: MyColors.appBlackColor),
        labelLarge: TextStyle(fontSize: 16.spMin, fontFamily: Fonts.poppins, fontWeight: FontWeight.w500, color: MyColors.appBlackColor),
      ));

  ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      textTheme: TextTheme(
        titleMedium: TextStyle(fontSize: 24.spMin, fontFamily: Fonts.poppins, fontWeight: FontWeight.w600, color: MyColors.naturalWhite),
        labelLarge: TextStyle(fontSize: 16.spMin, fontFamily: Fonts.poppins, fontWeight: FontWeight.w500, color: MyColors.naturalWhite),
      ));
}

extension ThemeExtension on ThemeData {
  Color get baseContainerColor => brightness == Brightness.light ? MyColors.naturalWhite : MyColors.appBlackColor;
}
