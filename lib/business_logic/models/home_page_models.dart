import 'dart:convert';
import 'package:flutter/material.dart';

class HomePageBannerModel {
  String? bannerImage;
  String? bannerTitleText;
  String? bannerDecText;
  String? bannerResIcon;
  Color? color;

  HomePageBannerModel({this.bannerImage, this.bannerTitleText, this.bannerDecText, this.bannerResIcon, this.color});
}

class RestaurantModel {
  List<Restaurants>? restaurants;
  List<Restaurants>? advertisement;

  RestaurantModel({
    this.restaurants,
    this.advertisement,
  });

  RestaurantModel copyWith({
    List<Restaurants>? restaurants,
    List<Restaurants>? advertisement,
  }) =>
      RestaurantModel(
        restaurants: restaurants ?? this.restaurants,
        advertisement: advertisement ?? this.advertisement,
      );

  factory RestaurantModel.fromRawJson(String str) => RestaurantModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RestaurantModel.fromJson(Map<String, dynamic> json) => RestaurantModel(
    restaurants: json["restaurants"] == null ? [] : List<Restaurants>.from(json["restaurants"]!.map((x) => Restaurants.fromJson(x))),
    advertisement: json["advertisement"] == null ? [] : List<Restaurants>.from(json["advertisement"]!.map((x) => Restaurants.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "restaurants": restaurants == null ? [] : List<dynamic>.from(restaurants!.map((x) => x.toJson())),
    "advertisement": advertisement == null ? [] : List<dynamic>.from(advertisement!.map((x) => x.toJson())),
  };
}

class Restaurants {
  String? backgroundImage;
  String? restaurantIcon;
  String? restaurantName;
  String? deliveryTime;
  bool? isOpen;
  bool? isFavourite;
  String? status;

  Restaurants({
    this.backgroundImage,
    this.restaurantIcon,
    this.restaurantName,
    this.deliveryTime,
    this.isOpen,
    this.isFavourite,
    this.status,
  });

  Restaurants copyWith({
    String? backgroundImage,
    String? restaurantIcon,
    String? restaurantName,
    String? deliveryTime,
    bool? isOpen,
    bool? isFavourite,
    String? status,
  }) =>
      Restaurants(
        backgroundImage: backgroundImage ?? this.backgroundImage,
        restaurantIcon: restaurantIcon ?? this.restaurantIcon,
        restaurantName: restaurantName ?? this.restaurantName,
        deliveryTime: deliveryTime ?? this.deliveryTime,
        isOpen: isOpen ?? this.isOpen,
        isFavourite: isFavourite ?? this.isFavourite,
        status: status ?? this.status,
      );

  factory Restaurants.fromRawJson(String str) => Restaurants.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Restaurants.fromJson(Map<String, dynamic> json) => Restaurants(
    backgroundImage: json["backgroundImage"],
    restaurantIcon: json["restaurantIcon"],
    restaurantName: json["restaurantName"],
    deliveryTime: json["deliveryTime"],
    isOpen: json["isOpen"],
    isFavourite: json["isFavourite"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "backgroundImage": backgroundImage,
    "restaurantIcon": restaurantIcon,
    "restaurantName": restaurantName,
    "deliveryTime": deliveryTime,
    "isOpen": isOpen,
    "isFavourite": isFavourite,
    "status": status,
  };
}
