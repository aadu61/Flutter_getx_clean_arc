
import 'package:get/get.dart';
import 'package:mashe/business_logic/models/home_page_models.dart';
import 'package:mashe/business_logic/models/selection_radio_model.dart';
import 'package:mashe/core/constants/export_constant.dart';

class HomePageController extends GetxController {
  RxList<HomePageBannerModel> bannerList = RxList<HomePageBannerModel>();
  RxInt bannerCurrentIndex = RxInt(0);
  RxList<Restaurants> popularBrandList = RxList<Restaurants>();
  RxList<SelectionRadioModel> whatInYourMind = RxList<SelectionRadioModel>();
  RxList<SelectionRadioModel> foodType = RxList<SelectionRadioModel>();
  RxString  selectedFoodType = RxString("");
  Rxn<RestaurantModel> restaurantsData = Rxn<RestaurantModel>();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    addDataToBannerList();
    addDataToPopularBrandList();

    restaurantsData.value = RestaurantModel.fromJson(shawarmaDataJson);
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
        title: AppString.all.tr,
        isSelected: true
    ));
    whatInYourMind.add(SelectionRadioModel(
        title: AppString.openNow.tr,
        isSelected: false
    ));
    whatInYourMind.add(SelectionRadioModel(
        title: AppString.nearest.tr,
        isSelected: false
    ));

    foodType.add(SelectionRadioModel(
      title: AppString.grill.tr,
      isSelected: false,
      icon: ImageConstants.grill,
    ));

    foodType.add(SelectionRadioModel(
      title: AppString.burger.tr,
      isSelected: false,
      icon: ImageConstants.burgerFoodType,
    ));

    foodType.add(SelectionRadioModel(
      title: AppString.shawarma.tr,
      isSelected: true,
      icon: ImageConstants.shawarma,
    ));

    foodType.add(SelectionRadioModel(
      title: AppString.pizza.tr,
      isSelected: false,
      icon: ImageConstants.ic_pizza,
    ));

    selectedFoodType.value =  AppString.shawarma.tr;
  }

  void addDataToPopularBrandList() {
    popularBrandList.add(Restaurants(
      backgroundImage: "",
      isOpen: true,
      restaurantIcon: ImageConstants.mcd,
      restaurantName: "McDonald’s",
      status: "",
      deliveryTime: "15 ${AppString.mins.tr}",
    ));
    popularBrandList.add(Restaurants(
      backgroundImage: "",
      isOpen: true,
      restaurantIcon: ImageConstants.japanika,
      restaurantName: "Japanika",
      status: "",
      deliveryTime: "12 ${AppString.mins.tr}",
    ));
    popularBrandList.add(Restaurants(
      backgroundImage: "",
      isOpen: true,
      restaurantIcon: ImageConstants.kfc,
      restaurantName: "KFC",
      status: "",
      deliveryTime: "10 ${AppString.mins.tr}",
    ));
    popularBrandList.add(Restaurants(
      backgroundImage: "",
      isOpen: true,
      restaurantIcon: ImageConstants.pizzaHutRec,
      restaurantName: "Pizza Hut",
      status: "",
      deliveryTime: "05 ${AppString.mins.tr}",
    ));
  }

   getSelectedFoodType() {
    for (var element in foodType) {
      if(element.isSelected!) {
        selectedFoodType.value = element.title ?? "";
      }
    }

    selectedFoodType.refresh();
  }


  var shawarmaDataJson = {
    "advertisement" : [
      {
        "backgroundImage":ImageConstants.imgShawarma,
        "restaurantIcon":"",
        "restaurantName":"Shawarma Club",
        "deliveryTime":"15 ${AppString.mins.tr}",
        "isOpen":true,
        "isFavourite":true,
        "status":""
      },
      {
        "backgroundImage":ImageConstants.imgShawarma,
        "restaurantIcon":"",
        "restaurantName":"Mahse Club",
        "deliveryTime":"15 ${AppString.mins.tr}",
        "isOpen":true,
        "isFavourite":true,
        "status":""
      }

    ],
    "restaurants":[
      {
        "backgroundImage":ImageConstants.imgKebabStation,
        "restaurantIcon":"",
        "restaurantName":"Kebab Station",
        "deliveryTime":"15 ${AppString.mins.tr}",
        "isOpen":true,
        "isFavourite":false,
        "status":AppString.bestSeller.tr
      },
      {
        "backgroundImage":ImageConstants.imgGrilledClub,
        "restaurantIcon":"",
        "restaurantName":"Grilled Club",
        "deliveryTime":"22 ${AppString.mins.tr}",
        "isOpen":true,
        "isFavourite":false,
        "status":AppString.topRated.tr
      },
      {
        "backgroundImage":ImageConstants.imgAoneShawarma,
        "restaurantIcon":"",
        "restaurantName":"Aone Shawarma",
        "deliveryTime":"10 ${AppString.mins.tr}",
        "isOpen":true,
        "isFavourite":false,
        "status":AppString.nearest.tr
      },
      {
        "backgroundImage":ImageConstants.imgAlKhalilCafe,
        "restaurantIcon":"",
        "restaurantName":"Al-Khalil Cafe",
        "deliveryTime":"16 ${AppString.mins.tr}",
        "isOpen":true,
        "isFavourite":false,
        "status":""
      },
      {
        "backgroundImage":ImageConstants.imgShawarmaClub,
        "restaurantIcon":"",
        "restaurantName":"Shawarma Club",
        "deliveryTime":"12 ${AppString.mins.tr}",
        "isOpen":false,
        "isFavourite":false,
        "status":""
      },
      {
        "backgroundImage":ImageConstants.imgMrShawarma,
        "restaurantIcon":"",
        "restaurantName":"Mr. Shawarma",
        "deliveryTime":"18 ${AppString.mins.tr}",
        "isOpen":false,
        "isFavourite":false,
        "status":""
      },
    ]
  };
}

