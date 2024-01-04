import 'dart:ui';

import 'package:mashe/business_logic/controllers/dashboard_module_controllers/pages_module/home_page_controller.dart';
import 'package:mashe/business_logic/models/home_page_models.dart';
import 'package:mashe/core/export_core.dart';

class RestaurantGridList extends StatelessWidget {
  const RestaurantGridList({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<HomePageController>(
      init: HomePageController(),
      builder: (controller) {
        return GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.restaurantsData.value?.restaurants?.length,
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 20.sp),
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
                                    text: restaurantObjet.status ?? "", fontSize: 12.sp, fontFamily: Fonts.poppins, fontWeight: FontWeight.w500, color: MyColors.warningColor),
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
                    left: Get.locale?.countryCode == "en" ? 8.sp : 0,
                    right: Get.locale?.countryCode == "en" ? 8.sp : 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CommonFunctions.customTextView(
                            text: restaurantObjet.restaurantName ?? "", fontSize: 16.sp, fontWeight: FontWeight.w600, fontFamily: Fonts.poppins, color: MyColors.appBlackColor),
                        CustomSize.verticalSpace(8.sp),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(100.sp),
                              child: ColorFiltered(
                                colorFilter: ColorFilter.mode(
                                  restaurantObjet.isOpen! ? Colors.transparent : MyColors.appCardBackGround,
                                  BlendMode.saturation,
                                ),
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 8.sp, vertical: 4.sp),
                                  decoration: BoxDecoration(color: MyColors.appCardBackGround, borderRadius: BorderRadius.circular(100.sp)),
                                  child: CommonFunctions.customTextView(
                                      text: restaurantObjet.isOpen! ? AppString.open.tr : AppString.closed.tr,
                                      fontSize: restaurantObjet.isOpen! ? 14.sp : 12.sp,
                                      fontWeight: FontWeight.w500,
                                      color: MyColors.appPrimaryRed),
                                ),
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
                            decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: MyColors.naturalWhite, width: 2.sp), color: MyColors.appPrimaryRed),
                            child: CommonFunctions.imageLoading(
                                filePath: restaurantObjet.restaurantIcon ?? "", width: 48.sp, height: 48.sp, borderRadius: BorderRadius.circular(100.sp)),
                          ),
                  ),
                ],
              );
            });
      },
    );
  }
}
