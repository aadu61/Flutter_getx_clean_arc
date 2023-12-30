import 'dart:ui';

import 'package:get/get.dart';
import 'package:mashe/business_logic/models/selection_radio_model.dart';
import 'package:mashe/core/constants/export_constant.dart';

class HomePageController extends GetxController {
  RxList<HomePageBannerModel> bannerList = RxList<HomePageBannerModel>();
  RxInt bannerCurrentIndex = RxInt(0);
  RxList<RestaurantModel> popularBrandList = RxList<RestaurantModel>();
  RxList<SelectionRadioModel> whatInYourMind = RxList<SelectionRadioModel>();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    addDataToBannerList();
    addDataToPopularBrandList();
  }

  void addDataToBannerList() {
    bannerList.add(HomePageBannerModel(
        bannerDecText: AppString.onOrderAbove999Qr.tr,
        bannerTitleText: AppString.get200Off.tr,
        bannerImage: ImageConstants.blueBanner,
        bannerResIcon: ImageConstants.burger,
        color: MyColors.blueBanner));
    bannerList.add(HomePageBannerModel(
        bannerDecText: AppString.onOrderAbove200Qr.tr,
        bannerTitleText: AppString.getFlatOff.tr,
        bannerImage: ImageConstants.orangeBanner,
        bannerResIcon: ImageConstants.pizza,
        color: MyColors.orangeBanner));
    bannerList.add(HomePageBannerModel(
        bannerDecText: AppString.onOrderAbove999Qr.tr,
        bannerTitleText: AppString.get200Off.tr,
        bannerImage: ImageConstants.voiletBanner,
        bannerResIcon: ImageConstants.subway,
        color: MyColors.voliteBanner));

    whatInYourMind.add(SelectionRadioModel(
      title: "heart",
      isSelected: false
    ));
    whatInYourMind.add(SelectionRadioModel(
        title: "All",
        isSelected: true
    ));
    whatInYourMind.add(SelectionRadioModel(
        title: "Open now",
        isSelected: false
    ));
    whatInYourMind.add(SelectionRadioModel(
        title: "Nearest",
        isSelected: false
    ));
  }

  void addDataToPopularBrandList() {
    popularBrandList.add(RestaurantModel(
      backgroundImage: "",
      isOpen: true,
      restaurantIcon: ImageConstants.mcd,
      restaurantName: "McDonald’s",
      status: "",
      deliveryTime: "15 mins",
    ));
    popularBrandList.add(RestaurantModel(
      backgroundImage: "",
      isOpen: true,
      restaurantIcon: ImageConstants.japanika,
      restaurantName: "Japanika",
      status: "",
      deliveryTime: "12 mins",
    ));
    popularBrandList.add(RestaurantModel(
      backgroundImage: "",
      isOpen: true,
      restaurantIcon: ImageConstants.kfc,
      restaurantName: "KFC",
      status: "",
      deliveryTime: "10 mins",
    ));
    popularBrandList.add(RestaurantModel(
      backgroundImage: "",
      isOpen: true,
      restaurantIcon: ImageConstants.pizzaHutRec,
      restaurantName: "Pizza Hut",
      status: "",
      deliveryTime: "05 mins",
    ));
  }
}

class HomePageBannerModel {
  String? bannerImage;
  String? bannerTitleText;
  String? bannerDecText;
  String? bannerResIcon;
  Color? color;

  HomePageBannerModel({this.bannerImage, this.bannerTitleText, this.bannerDecText, this.bannerResIcon, this.color});
}

class RestaurantModel {
  String? backgroundImage;
  String? restaurantIcon;
  String? restaurantName;
  String? deliveryTime;
  bool? isOpen;
  String? status;

  RestaurantModel({this.backgroundImage, this.restaurantIcon, this.restaurantName, this.deliveryTime, this.isOpen, this.status});
}
