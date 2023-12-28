import 'package:mashe/business_logic/controllers/splash_screen_controllers/splash_controller.dart';
import 'package:mashe/core/export_core.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<SplashScreenController>(
      init: SplashScreenController(),
      builder: (splashScreenController) {
        return Scaffold(
          body: Stack(
            children: [
              ///Background image
              Image.asset(
                ImageConstants.splashBackGround,
                width: Get.width,
                height: Get.height,
                fit: BoxFit.cover,
              ),

              ///Logo With the Name
              Align(
                alignment: Alignment.center,
                child: AnimatedContainer(
                  padding: EdgeInsets.all(0.sp),
                  duration: const Duration(milliseconds: 1000),
                  curve: Curves.easeInOut,
                  transformAlignment: Alignment.center,
                  transform: Matrix4.translationValues(0, splashScreenController.isLoadingAnimation.value ? -120.sp : 0.sp, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AnimatedContainer(
                        padding: EdgeInsets.all(0.sp),
                        duration: const Duration(milliseconds: 1000),
                        curve: Curves.easeInOut,
                        transformAlignment: Alignment.center,
                        height: splashScreenController.isLoadingAnimation.value ? 120.sp : 200.sp,
                        width: splashScreenController.isLoadingAnimation.value ? 120.sp : 200.sp,
                        child: GestureDetector(
                          onTap: () {
                            splashScreenController.isLoadingAnimation.value = !splashScreenController.isLoadingAnimation.value;
                          },
                          child: Image.asset(
                            ImageConstants.appLogoSplashScreen,
                            width: 200.sp,
                            height: 200.sp,
                          ),
                        ),
                      ),
                      AnimatedOpacity(
                          duration: const Duration(milliseconds: 1000),
                          curve: Curves.easeInOut,
                          opacity: splashScreenController.isLoadingAnimation.value ? 1 : 0,
                          child: CommonFunctions.customTextView(
                              text: AppString.mashe, color: MyColors.naturalWhite, fontSize: Fonts.fonts40, fontWeight: FontWeight.w600, fontFamily: Fonts.poppins))
                    ],
                  ),
                ),
              ),

              ///BottomSheet
              AnimatedContainer(
                onEnd: () {},
                curve: Curves.easeInOut,
                duration: const Duration(milliseconds: 1000),
                transform: Matrix4.translationValues(0, splashScreenController.isLoadingAnimation.value ? 0 : Get.height, 0),
                child: Container(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: Get.width,
                    padding: EdgeInsets.only(top: 40.sp, left: 16.sp, right: 16.sp),
                    decoration: BoxDecoration(
                      color: MyColors.naturalWhite,
                      borderRadius: BorderRadius.only(topRight: Radius.circular(24.sp), topLeft: Radius.circular(24.sp)),
                    ),
                    child: splashScreenController.isLanguageSelected.value
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 36.sp),
                                child: RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                        text: "faster".tr,
                                        style: TextStyle(fontFamily: Fonts.poppins, fontWeight: FontWeight.w700, color: MyColors.appPrimaryRed, fontSize: Fonts.fonts24),
                                        children: [
                                          TextSpan(
                                              text: 'food_delivery_app_in_the_town'.tr,
                                              style: TextStyle(fontFamily: Fonts.poppins, fontWeight: FontWeight.w600, color: MyColors.appBlackColor, fontSize: Fonts.fonts24)),
                                        ])),
                              ),
                              CustomSize.verticalSpace(12.sp),
                              CommonFunctions.customTextView(
                                  text: AppString.everythingYouAreLookingForIsHere.tr,
                                  fontSize: 16.sp,
                                  fontFamily: Fonts.poppins,
                                  fontWeight: FontWeight.w400,
                                  color: MyColors.fontGrey),
                              CustomSize.verticalSpace(40.sp),
                              CustomButton(
                                name: AppString.getStarted.tr,
                                onTap: () {},
                                inSideVerticalPadding: 14.sp,
                                isActive: true,
                              ),
                              CustomSize.verticalSpace(54.sp)
                            ],
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CommonFunctions.customTextView(
                                  text: AppString.chooseLanguage, fontWeight: FontWeight.w600, fontSize: Fonts.fonts24, color: MyColors.appBlackColor, fontFamily: Fonts.poppins),
                              SizedBox(
                                height: 24.sp,
                              ),
                              MediaQuery.removePadding(
                                context: context,
                                removeTop: true,
                                child: ListView.separated(
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      var localSingleObject = splashScreenController.languages[index];

                                      return GestureDetector(
                                        behavior: HitTestBehavior.opaque,
                                        onTap: () {
                                          for (int i = 0; i < splashScreenController.languages.length; i++) {
                                            if (index == i) {
                                              splashScreenController.languages[index].isSelected = true;
                                            } else {
                                              splashScreenController.languages[i].isSelected = false;
                                            }
                                          }

                                          splashScreenController.languages.refresh();
                                        },
                                        child: Row(
                                          children: [
                                            Image.asset(
                                              localSingleObject.isSelected! ? ImageConstants.radioFill : ImageConstants.radioUnFill,
                                              width: 24.sp,
                                              height: 24.sp,
                                            ),
                                            SizedBox(
                                              width: 12.sp,
                                            ),
                                            CommonFunctions.customTextView(
                                                text: localSingleObject.title ?? "", fontSize: 16.sp, fontWeight: FontWeight.w500, fontFamily: Fonts.poppins)
                                          ],
                                        ),
                                      );
                                    },
                                    separatorBuilder: (context, index) {
                                      return Divider(
                                        color: MyColors.appLineGrey,
                                        thickness: 0.5.sp,
                                      );
                                    },
                                    itemCount: splashScreenController.languages.length),
                              ),
                              CustomButton(
                                name: AppString.next,
                                onTap: () {
                                  splashScreenController.changeLanguage();
                                },
                                inSideVerticalPadding: 14.sp,
                                isActive: splashScreenController.languages.any((element) {
                                  if (element.isSelected == true) {
                                    return true;
                                  } else {
                                    return false;
                                  }
                                }),
                              ),
                              CustomSize.verticalSpace(54.sp)
                            ],
                          ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
