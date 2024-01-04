import 'package:mashe/business_logic/controllers/dashboard_module_controllers/pages_module/home_page_controller.dart';
import 'package:mashe/core/export_core.dart';

class PopularBrandWidgets extends StatelessWidget {
  const PopularBrandWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<HomePageController>(
      init: HomePageController(),
      builder: (controller) {
        return SizedBox(
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
        );
      },
    );
  }
}
