import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:mashe/business_logic/controllers/dashboard_module_controllers/pages_module/home_page_controller.dart';
import 'package:mashe/core/export_core.dart';

class RestaurantAdsList extends StatelessWidget {
  const RestaurantAdsList({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<HomePageController>(
      init: HomePageController(),
      builder: (controller) {
        return CarouselSlider(
            items: controller.restaurantsData.value?.advertisement?.map((element) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.sp),
                child: Container(
                  height: 200.sp,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.sp),
                  ),
                  child: Stack(
                    children: [
                      CommonFunctions.imageLoading(
                          filePath: ImageConstants.imgShawarma, height: 200.sp, borderRadius: BorderRadius.circular(20.sp), fit: BoxFit.cover),
                      Padding(
                        padding: EdgeInsets.all(12.sp),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                element.restaurantIcon == null || element.restaurantIcon!.isEmpty
                                    ? CommonFunctions.customRestaurantIcon(title: element.restaurantName)
                                    : Container(
                                  height: 48.sp,
                                  width: 48.sp,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: MyColors.naturalWhite, width: 2.sp),
                                      color: MyColors.appPrimaryRed),
                                  child: CommonFunctions.imageLoading(
                                      filePath: element.restaurantIcon ?? "", width: 48.sp, height: 48.sp, borderRadius: BorderRadius.circular(100.sp)),
                                ),
                                CustomSize.verticalSpace(12.sp),
                                CommonFunctions.customTextView(
                                    text: element.restaurantName ?? "",
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: Fonts.poppins,
                                    color: MyColors.naturalWhite),
                                CustomSize.verticalSpace(8.sp),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 8.sp, vertical: 4.sp),
                                  decoration: BoxDecoration(color: MyColors.naturalWhite, borderRadius: BorderRadius.circular(100.sp)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        ImageConstants.scooter,
                                        width: 16.sp,
                                        height: 16.sp,
                                        color: MyColors.appPrimaryRed,
                                      ),
                                      CustomSize.horizontalSpace(2.sp),
                                      CommonFunctions.customTextView(
                                          text: "15 Mins", fontSize: 14.sp, fontWeight: FontWeight.w500, color: MyColors.appPrimaryRed)
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [

                                  ///Favourite / unFavourite buttons
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(100.sp),
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                                      child: Container(
                                        padding: EdgeInsets.all(6.sp),
                                        decoration: BoxDecoration(shape: BoxShape.circle, color: MyColors.naturalWhite.withOpacity(0.3)),
                                        child: Image.asset(
                                          ImageConstants.icHeartFill,
                                          width: 24.sp,
                                          height: 24.sp,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 8.sp, vertical: 4.sp),
                                    decoration: BoxDecoration(color: MyColors.naturalWhite.withOpacity(0.3), borderRadius: BorderRadius.circular(100.sp)),
                                    child: CommonFunctions.customTextView(
                                        text: "AD",
                                        fontSize: 12.sp,
                                        fontFamily: Fonts.poppins,
                                        fontWeight: FontWeight.w600,
                                        color: MyColors.naturalWhite),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            }).toList(),
            options: CarouselOptions(
                height: 200.sp,
                aspectRatio: 16 / 9,
                viewportFraction: 1,
                initialPage: 0,
                enableInfiniteScroll: false,
                reverse: false,
                autoPlay: false,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                onPageChanged: (index, reg) {},
                enlargeFactor: 0.0,
                scrollDirection: Axis.horizontal,
                clipBehavior: Clip.none));
      },
    );
  }
}
