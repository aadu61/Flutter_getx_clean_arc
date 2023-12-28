import 'dart:ui';

import 'package:get/get.dart';

class ControllerInternationalization extends GetxController{

  void changeLanguage(String languageCode, String languageCountryCode){
    var locale = Locale(languageCode,languageCountryCode);
    Get.updateLocale(locale);
  }
}