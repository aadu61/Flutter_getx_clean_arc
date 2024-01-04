import 'package:mashe/business_logic/controllers/dashboard_module_controllers/pages_module/home_page_controller.dart';
import 'package:mashe/core/export_core.dart';

class FoodTypeCategoryList extends StatelessWidget {
  const FoodTypeCategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<HomePageController>(
      init: HomePageController(),
      builder: (controller) {
        return Container(
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
        );
      },
    );
  }
}
