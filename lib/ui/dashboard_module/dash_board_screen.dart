import 'package:mashe/business_logic/controllers/dashboard_module_controllers/dashboard_screen_controller.dart';

import '../../core/export_core.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<DashboardController>(
      init: DashboardController(),
      builder: (controller) {
        return Scaffold(
          body: controller.pages[controller.selectedNavItem.value],
          bottomNavigationBar: Container(
            color: MyColors.naturalWhite,
            padding: EdgeInsets.symmetric(horizontal: 16.sp),
            height: 88.sp,
            child: Row(
              children: [
                Expanded(
                    child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    controller.selectedNavItem.value = 0;
                  },
                  child: Column(
                    children: [
                      Divider(
                        color: controller.selectedNavItem.value == 0 ? MyColors.appPrimaryRed : MyColors.naturalWhite,
                        thickness: 4,
                      ),
                      CustomSize.verticalSpace(10.sp),
                      Image.asset(
                        controller.selectedNavItem.value == 0 ? ImageConstants.selectedHome : ImageConstants.unselectedHome,
                        width: 20.sp,
                        height: 20.sp,
                      ),
                      CustomSize.verticalSpace(8.sp),
                      CommonFunctions.customTextView(
                          text: AppString.home.tr,
                          fontWeight: FontWeight.w500,
                          fontFamily: Fonts.poppins,
                          fontSize: 12.sp,
                          color: controller.selectedNavItem.value == 0 ? MyColors.appPrimaryRed : MyColors.fontGrey),
                    ],
                  ),
                )),
                Expanded(
                    child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    controller.selectedNavItem.value = 1;
                  },
                  child: Column(
                    children: [
                      Divider(
                        color: controller.selectedNavItem.value == 1 ? MyColors.appPrimaryRed : MyColors.naturalWhite,
                        thickness: 4,
                      ),
                      CustomSize.verticalSpace(10.sp),
                      Image.asset(
                        controller.selectedNavItem.value == 1 ? ImageConstants.selectedGrocery : ImageConstants.unselectedGrocery,
                        width: 20.sp,
                        height: 20.sp,
                      ),
                      CustomSize.verticalSpace(8.sp),
                      CommonFunctions.customTextView(
                          text: AppString.grocery.tr,
                          fontWeight: FontWeight.w500,
                          fontFamily: Fonts.poppins,
                          fontSize: 12.sp,
                          color: controller.selectedNavItem.value == 1 ? MyColors.appPrimaryRed : MyColors.fontGrey),
                    ],
                  ),
                )),
                Expanded(
                    child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    controller.selectedNavItem.value = 2;
                  },
                  child: Column(
                    children: [
                      Divider(
                        color: controller.selectedNavItem.value == 2 ? MyColors.appPrimaryRed : MyColors.naturalWhite,
                        thickness: 4,
                      ),
                      CustomSize.verticalSpace(10.sp),
                      Image.asset(
                        controller.selectedNavItem.value == 2 ? ImageConstants.selectedGroup : ImageConstants.unselectedGroup,
                        width: 20.sp,
                        height: 20.sp,
                      ),
                      CustomSize.verticalSpace(8.sp),
                      CommonFunctions.customTextView(
                          text: AppString.group.tr,
                          fontWeight: FontWeight.w500,
                          fontFamily: Fonts.poppins,
                          fontSize: 12.sp,
                          color: controller.selectedNavItem.value == 2 ? MyColors.appPrimaryRed : MyColors.fontGrey),
                    ],
                  ),
                )),
                Expanded(
                    child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    controller.selectedNavItem.value = 3;
                  },
                  child: Column(
                    children: [
                      Divider(
                        color: controller.selectedNavItem.value == 3 ? MyColors.appPrimaryRed : MyColors.naturalWhite,
                        thickness: 4,
                      ),
                      CustomSize.verticalSpace(10.sp),
                      Image.asset(
                        controller.selectedNavItem.value == 3 ? ImageConstants.selectedWallet : ImageConstants.unselectedWallet,
                        width: 20.sp,
                        height: 20.sp,
                      ),
                      CustomSize.verticalSpace(8.sp),
                      CommonFunctions.customTextView(
                          text: AppString.wallet.tr,
                          fontWeight: FontWeight.w500,
                          fontFamily: Fonts.poppins,
                          fontSize: 12.sp,
                          color: controller.selectedNavItem.value == 3 ? MyColors.appPrimaryRed : MyColors.fontGrey),
                    ],
                  ),
                )),
                Expanded(
                    child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    controller.selectedNavItem.value = 4;
                  },
                  child: Column(
                    children: [
                      Divider(
                        color: controller.selectedNavItem.value == 4 ? MyColors.appPrimaryRed : MyColors.naturalWhite,
                        thickness: 4,
                      ),
                      CustomSize.verticalSpace(10.sp),
                      Image.asset(
                        controller.selectedNavItem.value == 4 ? ImageConstants.selectedProfile : ImageConstants.unselectedProfile,
                        width: 20.sp,
                        height: 20.sp,
                      ),
                      CustomSize.verticalSpace(8.sp),
                      CommonFunctions.customTextView(
                          text: AppString.profile.tr,
                          fontWeight: FontWeight.w500,
                          fontFamily: Fonts.poppins,
                          fontSize: 12.sp,
                          color: controller.selectedNavItem.value == 4 ? MyColors.appPrimaryRed : MyColors.fontGrey),
                    ],
                  ),
                )),
              ],
            ),
          ),
        );
      },
    );
  }
}
