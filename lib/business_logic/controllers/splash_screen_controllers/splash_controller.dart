import 'package:get/get.dart';
import 'package:mashe/business_logic/controllers/inernational_controller.dart';
import 'package:mashe/business_logic/models/selection_radio_model.dart';

class SplashScreenController extends GetxController with GetSingleTickerProviderStateMixin {

  ///region variable declaration
  RxBool isLoadingAnimation = RxBool(false);
  RxBool isLanguageSelected = RxBool(false);
  RxList<SelectionRadioModel> languages = RxList<SelectionRadioModel>([]);

  ///endregion

  ///region build in functions like oninit close etc
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    addDataToLanguageList();
  }

  ///endregion

  ///region functions and methods
  ///Adding data to the list
  void addDataToLanguageList() {
    languages.add(SelectionRadioModel(title: "English", isSelected: false));
    languages.add(SelectionRadioModel(title: "Arabic", isSelected: false));
    languages.add(SelectionRadioModel(title: "Hebrew", isSelected: false));

    ///After 3 second the animation will be start
    Future.delayed(const Duration(seconds: 3), () {
      isLoadingAnimation.value = true;
    });
  }

  ///Change language as per the user selection
  void changeLanguage() {
    Get.put(ControllerInternationalization());
    var localController = Get.find<ControllerInternationalization>();

    var selectedLanguageTitle = "";
    languages.firstWhere((element) {
      if (element.isSelected == true) {
        selectedLanguageTitle = element.title ?? "";
        return true;
      } else {
        return false;
      }
    });
    localController.changeLanguage(getLanguageCode(selectedLanguageTitle).split(" ").first, getLanguageCode(selectedLanguageTitle).split(" ").first);
    isLanguageSelected.value = true;
  }

  ///return selected language code and country code
  String getLanguageCode(String selectedLanguageTitle) {
    if (selectedLanguageTitle == "Arabic") {
      return "ar IQ";
    } else if (selectedLanguageTitle == "Hebrew") {
      return "he IL";
    } else {
      return "en US";
    }
  }

  ///endregion

}
