import 'package:get/get_navigation/src/root/internacionalization.dart';
import 'package:mashe/core/constants/export_constant.dart';

class LanguageChange extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {"en_US": englishUs, "he_IL": hebrewIl, "ar_IQ": arabicIq};

  Map<String, String> englishUs = {
    AppString.getStarted: AppString.getStarted,
    "faster": "Faster",
    "food_delivery_app_in_the_town": " food delivery app in the town",
    AppString.everythingYouAreLookingForIsHere: AppString.everythingYouAreLookingForIsHere,
    AppString.selectLocation: AppString.selectLocation,
    AppString.chooseYourDeliveryLocation: AppString.chooseYourDeliveryLocation,
    AppString.useMyCurrentLocation: AppString.useMyCurrentLocation,
    AppString.browseAllCities: AppString.browseAllCities,
    AppString.confirm: AppString.confirm,
    AppString.welcome: AppString.welcome,
    AppString.enterYourMobileNumberToGetStarted: AppString.enterYourMobileNumberToGetStarted,
    AppString.fillInDetailsToRegisterYourself: AppString.fillInDetailsToRegisterYourself,
    AppString.fullName: AppString.fullName,
    AppString.email: AppString.email,
  };

  Map<String, String> hebrewIl = {
    AppString.getStarted: AppStringHebrew.getStarted,
    "faster": "מהיר יותר",
    "food_delivery_app_in_the_town": "אפליקציית משלוחי אוכל בעיר ",
    AppString.everythingYouAreLookingForIsHere: AppStringHebrew.everythingYouAreLookingForIsHere,
    AppString.selectLocation: AppStringHebrew.selectLocation,
    AppString.chooseYourDeliveryLocation: AppStringHebrew.chooseYourDeliveryLocation,
    AppString.useMyCurrentLocation: AppStringHebrew.useMyCurrentLocation,
    AppString.browseAllCities: AppStringHebrew.browseAllCities,
    AppString.confirm: AppStringHebrew.confirm,
    AppString.welcome: AppStringHebrew.welcome,
    AppString.enterYourMobileNumberToGetStarted: AppStringHebrew.enterYourMobileNumberToGetStarted,
    AppString.fillInDetailsToRegisterYourself: AppStringHebrew.fillInDetailsToRegisterYourself,
    AppString.fullName: AppStringHebrew.fullName,
    AppString.email: AppStringHebrew.email,
  };

  Map<String, String> arabicIq = {
    AppString.getStarted: AppStringArabic.getStarted,
    "faster": "أسرع",
    "food_delivery_app_in_the_town": "تطبيق توصيل الطعام في المدينة",
    AppString.everythingYouAreLookingForIsHere: AppStringArabic.everythingYouAreLookingForIsHere,
    AppString.selectLocation: AppStringArabic.selectLocation,
    AppString.chooseYourDeliveryLocation: AppStringArabic.chooseYourDeliveryLocation,
    AppString.useMyCurrentLocation: AppStringArabic.useMyCurrentLocation,
    AppString.browseAllCities: AppStringArabic.browseAllCities,
    AppString.confirm: AppStringArabic.confirm,
    AppString.welcome: AppStringArabic.welcome,
    AppString.enterYourMobileNumberToGetStarted: AppStringArabic.enterYourMobileNumberToGetStarted,
    AppString.fillInDetailsToRegisterYourself: AppStringArabic.fillInDetailsToRegisterYourself,
    AppString.fullName: AppStringArabic.fullName,
    AppString.email: AppStringArabic.email,
  };
}
