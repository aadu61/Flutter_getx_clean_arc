import 'package:carousel_slider/carousel_slider.dart';
import 'package:mashe/business_logic/controllers/dashboard_module_controllers/pages_module/home_page_controller.dart';
import 'package:mashe/core/export_core.dart';
import 'dart:math' as math; // import this

class BannersOffersWidgets extends StatelessWidget {
  const BannersOffersWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<HomePageController>(
      init: HomePageController(),
      initState: (_) {},
      builder: (controller) {
        print(Get.locale?.countryCode);
        return CarouselSlider(
            items: controller.bannerList.map((element) {
              return Container(
                decoration: BoxDecoration(color: MyColors.naturalWhite, borderRadius: BorderRadius.circular(24.sp)),
                child: Stack(
                  children: [
                    Transform.scale(
                      scale: Get.locale?.countryCode == "en" ? 1 : -1,
                      child: CommonFunctions.imageLoading(filePath: element.bannerImage ?? "", height: 200.sp, borderRadius: BorderRadius.circular(24.sp)),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.sp, vertical: 24.sp),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CommonFunctions.imageLoading(filePath: element.bannerResIcon ?? "", width: 24.sp, height: 24.sp),
                          CommonFunctions.customTextView(text: AppString.get.tr, fontWeight: FontWeight.w700, fontSize: 24.sp, color: MyColors.naturalWhite),
                          CommonFunctions.customTextView(text: element.bannerTitleText ?? "", fontWeight: FontWeight.w700, fontSize: 24.sp, color: MyColors.naturalWhite),
                          CommonFunctions.customTextView(text: element.bannerDecText ?? "", fontWeight: FontWeight.w500, fontSize: 12.sp, color: MyColors.naturalWhite),
                          CustomSize.verticalSpace(16.sp),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 4.sp),
                            decoration: BoxDecoration(
                              color: MyColors.naturalWhite,
                              borderRadius: BorderRadius.circular(8.sp),
                            ),
                            child: CommonFunctions.customTextView(text: AppString.orderNow.tr, fontSize: 16.sp, fontWeight: FontWeight.w600, color: element.color),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
            options: CarouselOptions(
              height: 220.sp,
              aspectRatio: 16 / 9,
              viewportFraction: 0.8,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              onPageChanged: (index, reg) {
                // print(index);
                // print(reg);
                controller.bannerCurrentIndex.value = index;
              },
              enlargeFactor: 0.1,
              scrollDirection: Axis.horizontal,
            ));
      },
    );
  }
}
