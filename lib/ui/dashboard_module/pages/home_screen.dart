import 'package:flutter_animate/flutter_animate.dart';
import 'package:mashe/business_logic/controllers/dashboard_module_controllers/pages_module/home_page_controller.dart';
import 'package:mashe/core/export_core.dart';
import 'package:sticky_headers/sticky_headers.dart';

import 'widgets/export_home_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var statusBar = MediaQuery.of(context).padding.top;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: GetX<HomePageController>(
        init: HomePageController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: MyColors.scafoldBg,
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomSize.verticalSpace(statusBar),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.sp),
                  child: Row(
                    children: [
                      Expanded(child: CommonFunctions.customEditText(hintText: AppString.search.tr, prefixIcon: ImageConstants.search)),
                      CustomSize.horizontalSpace(20.sp),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 12.sp, vertical: 14.sp),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(14.sp), border: Border.all(color: MyColors.fontGrey)),
                        child: Row(
                          children: [
                            Image.asset(
                              ImageConstants.home,
                              width: 18.sp,
                              height: 18.sp,
                            ),
                            CustomSize.horizontalSpace(4.sp),
                            CommonFunctions.customTextView(
                                text: AppString.home.tr, fontSize: 14.sp, fontFamily: Fonts.poppins, fontWeight: FontWeight.w500, color: MyColors.appBlackColor),
                            CustomSize.horizontalSpace(8.sp),
                            Image.asset(
                              ImageConstants.arrowDown,
                              width: 18.sp,
                              height: 18.sp,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ).animate().fade().slide(),
                CustomSize.verticalSpace(16.sp),
                Expanded(
                    child: SingleChildScrollView(
                  keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ///Banners
                      const BannersOffersWidgets().animate().fade(),

                      ///Indicator
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: controller.bannerList.asMap().entries.map((entry) {
                          return GestureDetector(
                            child: controller.bannerCurrentIndex.value == entry.key
                                ? Container(
                                    width: 24.sp,
                                    height: 8.sp,
                                    margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                                    decoration: BoxDecoration(color: MyColors.appPrimaryRed, borderRadius: BorderRadius.circular(50.sp)),
                                  )
                                : Container(
                                    width: 8.sp,
                                    height: 8.sp,
                                    margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: MyColors.naturalBlack.withOpacity(0.15),
                                    ),
                                  ),
                          );
                        }).toList(),
                      ).animate().fade().slide(),
                      CustomSize.verticalSpace(16.sp),

                      ///Popular Brand
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.sp),
                        child: CommonFunctions.customTextView(text: AppString.popularBrand.tr, fontWeight: FontWeight.w600, fontSize: 24.sp, color: MyColors.appBlackColor),
                      ).animate().fade(),

                      const PopularBrandWidgets().animate().fade().slideX(duration: const Duration(milliseconds: 500)),

                      ///What's in your mind?
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.sp),
                        child: CommonFunctions.customTextView(text: AppString.whatInYourMind.tr, fontWeight: FontWeight.w600, fontSize: 24.sp, color: MyColors.appBlackColor),
                      ).animate().fade(),
                      CustomSize.verticalSpace(16.sp),

                      ///Sticky Header
                      StickyHeader(
                          header: Container(
                            height: 60.sp,
                            padding: EdgeInsets.symmetric(vertical: 12.sp),
                            color: MyColors.naturalWhite,
                            child: MediaQuery.removePadding(
                              context: context,
                              removeTop: true,
                              removeBottom: true,
                              child: ListView.separated(
                                itemCount: controller.whatInYourMind.length,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                padding: EdgeInsets.symmetric(horizontal: 16.sp),
                                itemBuilder: (context, index) {
                                  var whatInYourMindObject = controller.whatInYourMind[index];
                                  return GestureDetector(
                                    behavior: HitTestBehavior.opaque,
                                    onTap: () {
                                      for (int i = 0; i < controller.whatInYourMind.length; i++) {
                                        if (index == i) {
                                          controller.whatInYourMind[index].isSelected = true;
                                        } else {
                                          controller.whatInYourMind[i].isSelected = false;
                                        }
                                      }
                                      controller.whatInYourMind.refresh();
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.symmetric(vertical: 8.sp, horizontal: 20.sp),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(100.sp),
                                          color: whatInYourMindObject.isSelected! ? MyColors.appPrimaryRed.withOpacity(0.2) : MyColors.naturalWhite,
                                          border: Border.all(color: whatInYourMindObject.isSelected! ? MyColors.appPrimaryRed : MyColors.appLineGrey)),
                                      child: CommonFunctions.customTextView(
                                          text: whatInYourMindObject.title ?? "",
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14.sp,
                                          color: whatInYourMindObject.isSelected! ? MyColors.appPrimaryRed : MyColors.appBlackColor),
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return SizedBox(
                                    width: 8.sp,
                                  );
                                },
                              ).animate().fade().slideX(duration: const Duration(milliseconds: 500)),
                            ),
                          ),
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const FoodTypeCategoryList().animate().fade().slideX(duration: const Duration(milliseconds: 500)),

                              ///Selected Food Type
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16.sp),
                                child: CommonFunctions.customTextView(
                                    text: controller.selectedFoodType.value, fontWeight: FontWeight.w600, fontSize: 24.sp, color: MyColors.appBlackColor),
                              ),
                              CustomSize.verticalSpace(10.sp),

                              const RestaurantAdsList().animate().fade().scale(duration: const Duration(milliseconds: 500)),

                              const RestaurantGridList().animate().fade().scale(duration: const Duration(milliseconds: 500)),
                            ],
                          )
                      ),
                    ],
                  ),
                ))
              ],
            ),
          );
        },
      ),
    );
  }
}
