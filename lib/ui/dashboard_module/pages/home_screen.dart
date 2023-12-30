import 'dart:ffi';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:mashe/business_logic/controllers/dashboard_module_controllers/pages_module/home_page_controller.dart';
import 'package:mashe/core/export_core.dart';
import 'package:sticky_headers/sticky_headers.dart';

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

                ///Home and Search button
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.sp),
                  child: Row(
                    children: [
                      Expanded(child: CommonFunctions.customEditText(hintText: "Search", prefixIcon: ImageConstants.search)),
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
                            CommonFunctions.customTextView(text: "Home", fontSize: 14.sp, fontFamily: Fonts.poppins, fontWeight: FontWeight.w500, color: MyColors.appBlackColor),
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
                ),
                Expanded(
                  child: SingleChildScrollView(
                      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                    child: Column(
                      children: [
                        CustomSize.verticalSpace(16.sp),
                        ///banners
                        CarouselSlider(
                            items: controller.bannerList.map((element) {
                              return Container(
                                decoration: BoxDecoration(color: MyColors.naturalWhite, borderRadius: BorderRadius.circular(24.sp)),
                                child: Stack(
                                  children: [
                                    CommonFunctions.imageLoading(filePath: element.bannerImage ?? "", height: 200.sp, borderRadius: BorderRadius.circular(24.sp)),
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
                              autoPlay: false,
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
                            )),

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
                        ),
                        CustomSize.verticalSpace(16.sp),

                        ///Popular brand
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.sp),
                          child: CommonFunctions.customTextView(text: AppString.popularBrand.tr, fontWeight: FontWeight.w600, fontSize: 24.sp, color: MyColors.appBlackColor),
                        ),
                        SizedBox(
                          height: 140.sp,
                          child: MediaQuery.removePadding(
                            context: context,
                            removeTop: true,
                            removeBottom: true,
                            child: ListView.separated(
                              itemCount: controller.popularBrandList.length,
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              padding: EdgeInsets.symmetric(horizontal: 16.sp),
                              itemBuilder: (context, index) {
                                var popularBrandObject = controller.popularBrandList[index];
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(8.sp),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16.sp),
                                        color: MyColors.appCardBackGround,
                                      ),
                                      child: CommonFunctions.imageLoading(
                                          filePath: popularBrandObject.restaurantIcon ?? "", width: 72.sp, height: 72.sp, borderRadius: BorderRadius.circular(8.sp)),
                                    ),
                                    CustomSize.verticalSpace(8.sp),
                                    CommonFunctions.customTextView(
                                        text: popularBrandObject.restaurantName ?? "", fontSize: 12.sp, fontWeight: FontWeight.w600, color: MyColors.appBlackColor),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          ImageConstants.scooter,
                                          width: 14.sp,
                                          height: 14.sp,
                                          color: MyColors.darkGrey,
                                        ),
                                        CustomSize.horizontalSpace(2.sp),
                                        CommonFunctions.customTextView(text: popularBrandObject.deliveryTime ?? "", fontSize: 12.sp, fontWeight: FontWeight.w500, color: MyColors.darkGrey)
                                      ],
                                    )
                                  ],
                                );
                              },
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  width: 12.sp,
                                );
                              },
                            ),
                          ),
                        ),

                        ///What’s in your mind?
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.sp),
                          child: CommonFunctions.customTextView(text: AppString.whatInYourMind.tr, fontWeight: FontWeight.w600, fontSize: 24.sp, color: MyColors.appBlackColor),
                        ),
                        CustomSize.verticalSpace(16.sp),

                        StickyHeader(
                          header: Container(
                            height: 60.sp,
                            padding: EdgeInsets.symmetric(vertical:12.sp),
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
                                itemBuilder: (context,index) {
                                  var whatInYourMindObject = controller.whatInYourMind[index];
                                  return GestureDetector(
                                    behavior: HitTestBehavior.opaque,
                                    onTap: (){
                                      for(int i =0 ; i<controller.whatInYourMind.length;i++){
                                        if(index == i){
                                          controller.whatInYourMind[index].isSelected = true;
                                        }else{
                                          controller.whatInYourMind[i].isSelected = false;
                                        }
                                      }
                                      controller.whatInYourMind.refresh();
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.symmetric(vertical: 8.sp, horizontal: 20.sp),
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(100.sp), color:  whatInYourMindObject.isSelected! ? MyColors.appPrimaryRed.withOpacity(0.2):MyColors.naturalWhite, border: Border.all(color: whatInYourMindObject.isSelected! ? MyColors.appPrimaryRed: MyColors.appLineGrey)),
                                      child: CommonFunctions.customTextView(text: whatInYourMindObject.title ?? "", fontWeight: FontWeight.w500, fontSize: 14.sp, color: whatInYourMindObject.isSelected! ? MyColors.appPrimaryRed: MyColors.appBlackColor),
                                    ),
                                  );
                                },
                                separatorBuilder: (context,index){
                                  return SizedBox(width: 8.sp,);
                                },
                              ),
                            ),
                          ),
                          content: Column(
                            children: [
                              Container(
                                height: 500.sp,
                                color: MyColors.appPrimaryRed,
                              ),
                              Container(
                                height: 500.sp,
                                color: MyColors.appPrimaryRed,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )

              ],
            ),
          );
        },
      ),
    );
  }
}
