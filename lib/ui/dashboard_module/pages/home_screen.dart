import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:mashe/business_logic/controllers/dashboard_module_controllers/pages_module/home_page_controller.dart';
import 'package:mashe/business_logic/models/home_page_models.dart';
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
                CustomSize.verticalSpace(16.sp),
                Expanded(
                  child: SingleChildScrollView(
                    keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                                          CommonFunctions.customTextView(
                                              text: element.bannerTitleText ?? "", fontWeight: FontWeight.w700, fontSize: 24.sp, color: MyColors.naturalWhite),
                                          CommonFunctions.customTextView(
                                              text: element.bannerDecText ?? "", fontWeight: FontWeight.w500, fontSize: 12.sp, color: MyColors.naturalWhite),
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
                                        CommonFunctions.customTextView(
                                            text: popularBrandObject.deliveryTime ?? "", fontSize: 12.sp, fontWeight: FontWeight.w500, color: MyColors.darkGrey)
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
                              ),
                            ),
                          ),
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ///Food Type
                              Container(
                                height: 150.sp,
                                alignment: Alignment.centerLeft,
                                child: MediaQuery.removePadding(
                                  context: context,
                                  removeBottom: true,
                                  removeTop: true,
                                  child: ListView.separated(
                                    shrinkWrap: true,
                                    padding: EdgeInsets.symmetric(horizontal: 16.sp),
                                    itemCount: controller.foodType.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      var foodTypeObject = controller.foodType[index];
                                      return GestureDetector(
                                        onTap: () {
                                          for (int i = 0; i < controller.foodType.length; i++) {
                                            if (index == i) {
                                              controller.foodType[index].isSelected = true;
                                            } else {
                                              controller.foodType[i].isSelected = false;
                                            }
                                          }
                                          controller.foodType.refresh();
                                          controller.getSelectedFoodType();
                                        },
                                        child: Column(
                                          children: [
                                            CommonFunctions.imageLoading(
                                                filePath: foodTypeObject.icon ?? "",
                                                width: 88.sp,
                                                height: 88.sp,
                                                onTap: () {
                                                  for (int i = 0; i < controller.foodType.length; i++) {
                                                    if (index == i) {
                                                      controller.foodType[index].isSelected = true;
                                                    } else {
                                                      controller.foodType[i].isSelected = false;
                                                    }
                                                  }
                                                  controller.foodType.refresh();
                                                  controller.getSelectedFoodType();
                                                }),
                                            CustomSize.verticalSpace(8.sp),
                                            Container(
                                              padding: EdgeInsets.all(8.sp),
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(100.sp), color: foodTypeObject.isSelected! ? MyColors.appPrimaryRed : Colors.transparent),
                                              child: CommonFunctions.customTextView(
                                                  text: foodTypeObject.title ?? "",
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w600,
                                                  color: foodTypeObject.isSelected! ? MyColors.naturalWhite : MyColors.appBlackColor),
                                            )
                                          ],
                                        ),
                                      );
                                    },
                                    separatorBuilder: (context, index) {
                                      return CustomSize.horizontalSpace(16.sp);
                                    },
                                  ),
                                ),
                              ),

                              ///Selected Food Type
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16.sp),
                                child: CommonFunctions.customTextView(
                                    text: controller.selectedFoodType.value, fontWeight: FontWeight.w600, fontSize: 24.sp, color: MyColors.appBlackColor),
                              ),
                              CustomSize.verticalSpace(10.sp),
                              ///Ad place
                              CarouselSlider(
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
                                                              text: "AD", fontSize: 12.sp, fontFamily: Fonts.poppins, fontWeight: FontWeight.w600, color: MyColors.naturalWhite),
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
                                      clipBehavior: Clip.none)),

                              ///Grid
                              GridView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: controller.restaurantsData.value?.restaurants?.length,
                                  shrinkWrap: true,
                                  padding: EdgeInsets.symmetric(horizontal: 16.sp,vertical: 20.sp),
                                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2, // number of items in each row
                                      mainAxisSpacing: 8.0, // spacing between rows
                                      crossAxisSpacing: 8.0, //// spacing between columns
                                      childAspectRatio: 0.8),
                                  itemBuilder: (context, index) {
                                    Restaurants? restaurantObjet = controller.restaurantsData.value?.restaurants?[index];
                                    return Stack(
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(20.sp),
                                          child: ColorFiltered(
                                            colorFilter: ColorFilter.mode(
                                              restaurantObjet!.isOpen! ? Colors.transparent : MyColors.appCardBackGround,
                                              BlendMode.saturation,
                                            ),
                                            child: Column(
                                              children: [
                                                Expanded(
                                                  flex: 1,
                                                  child: CommonFunctions.imageLoading(
                                                      width: MediaQuery.of(context).size.width * 0.5,
                                                      filePath: restaurantObjet.backgroundImage ?? "",
                                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(20.sp), topRight: Radius.circular(20.sp)),
                                                      fit: BoxFit.cover),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: Container(
                                                    width: MediaQuery.of(context).size.width * 0.5,
                                                    decoration: BoxDecoration(
                                                      border: Border.all(color: MyColors.darkGrey),
                                                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20.sp), bottomRight: Radius.circular(20.sp)),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),

                                        ///Likes and status
                                        Padding(
                                          padding: EdgeInsets.only(top: 8.sp, bottom: 16.sp, left: 8.sp, right: 8.sp),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              restaurantObjet.status!.isEmpty || restaurantObjet.status == null
                                                  ? const SizedBox.shrink()
                                                  : Container(
                                                      padding: EdgeInsets.symmetric(horizontal: 12.sp, vertical: 8.sp),
                                                      decoration: BoxDecoration(color: MyColors.naturalWhite, borderRadius: BorderRadius.circular(100.sp)),
                                                      child: CommonFunctions.customTextView(
                                                          text: restaurantObjet.status ?? "",
                                                          fontSize: 12.sp,
                                                          fontFamily: Fonts.poppins,
                                                          fontWeight: FontWeight.w500,
                                                          color: MyColors.warningColor),
                                                    ),
                                              ClipRRect(
                                                borderRadius: BorderRadius.circular(100.sp),
                                                child: BackdropFilter(
                                                  filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                                                  child: Container(
                                                    padding: EdgeInsets.all(6.sp),
                                                    decoration: BoxDecoration(shape: BoxShape.circle, color: MyColors.naturalWhite.withOpacity(0.3)),
                                                    child: Image.asset(
                                                      restaurantObjet.isFavourite! ? ImageConstants.icHeartFill : ImageConstants.icUnHeartFill,
                                                      width: 24.sp,
                                                      height: 24.sp,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),

                                        ///restaurants Name and delivery time
                                        Positioned(
                                          bottom: 16.sp,
                                          left: 8.sp,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              CommonFunctions.customTextView(
                                                  text: restaurantObjet.restaurantName ?? "",
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily: Fonts.poppins,
                                                  color: MyColors.appBlackColor),
                                              CustomSize.verticalSpace(8.sp),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  ColorFiltered(
                                                    colorFilter: ColorFilter.mode(
                                                      restaurantObjet.isOpen! ? Colors.transparent : MyColors.appCardBackGround,
                                                      BlendMode.saturation,
                                                    ),
                                                    child: Container(
                                                      padding: EdgeInsets.symmetric(horizontal: 8.sp, vertical: 4.sp),
                                                      decoration: BoxDecoration(color: MyColors.appCardBackGround, borderRadius: BorderRadius.circular(100.sp)),
                                                      child: CommonFunctions.customTextView(
                                                          text: restaurantObjet.isOpen! ? "Open" : "Closed",
                                                          fontSize: restaurantObjet.isOpen! ? 14.sp : 12.sp,
                                                          fontWeight: FontWeight.w500,
                                                          color: MyColors.appPrimaryRed),
                                                    ),
                                                  ),
                                                  CustomSize.horizontalSpace(8.sp),
                                                  Container(
                                                    padding: EdgeInsets.symmetric(horizontal: 12.5.sp, vertical: 4.sp),
                                                    decoration: BoxDecoration(color: MyColors.appCardBackGround, borderRadius: BorderRadius.circular(100.sp)),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      mainAxisSize: MainAxisSize.min,
                                                      children: [
                                                        Image.asset(
                                                          ImageConstants.scooter,
                                                          width: 16.sp,
                                                          height: 16.sp,
                                                          color: restaurantObjet.isOpen! ? MyColors.appPrimaryRed : MyColors.darkGrey,
                                                        ),
                                                        CustomSize.horizontalSpace(2.sp),
                                                        CommonFunctions.customTextView(
                                                          text: restaurantObjet.deliveryTime ?? "",
                                                          fontSize: 14.sp,
                                                          fontWeight: FontWeight.w500,
                                                          color: restaurantObjet.isOpen! ? MyColors.appPrimaryRed : MyColors.darkGrey,
                                                        )
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),

                                        ///RestaurantIcons
                                        Align(
                                          alignment: Alignment.center,
                                          child: restaurantObjet.restaurantIcon == null || restaurantObjet.restaurantIcon!.isEmpty
                                              ? CommonFunctions.customRestaurantIcon(title: restaurantObjet.restaurantName)
                                              : Container(
                                                  height: 48.sp,
                                                  width: 48.sp,
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle, border: Border.all(color: MyColors.naturalWhite, width: 2.sp), color: MyColors.appPrimaryRed),
                                                  child: CommonFunctions.imageLoading(
                                                      filePath: restaurantObjet.restaurantIcon ?? "", width: 48.sp, height: 48.sp, borderRadius: BorderRadius.circular(100.sp)),
                                                ),
                                        ),
                                      ],
                                    );
                                  })
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
