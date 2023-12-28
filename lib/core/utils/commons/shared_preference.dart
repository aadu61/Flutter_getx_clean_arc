import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';


///*
///* How to use the functions to set data and get data
///* to set the data direct use class name and the function that you want to use and the value of the key
///
///* SecureStorage sharedPreference = locator<SecureStorage>();   declare as a global and use to that particular controller anywhere
///
///* This is how you can set string
///* SharedPreference.setSharedPreferenceString(keyName,valueForThat);
///*
///* This is how you can get the value as its return future value you need to use tha async and await function to get tha data
///   await SharedPreference.getSharedPreferenceString(keyName);
///*/

class SecureStorage {
  ///Declare All the keys you want to store in the SharedPreference
  ///Login Data
  static const isLogin = "isLogin";
  static const loginData = "loginData";
  static const accessTokenAmazon = "accessTokenAmazon";
  static const refreshTokenAmazon = "refreshTokenAmazon";
  static const idTokenAmazon = "refreshTokenAmazon";
  static const token = "token";
  static const customId = "custom:id";
  static const agree = "agree";
  static const subscriptionId = "subscriptionId";
  static const profilePicUrl = "profilePicUrl";
  static const profilePicData = "profilePicData";
  static const prospectId = "prospectId";
  static const portfolioId = "portfolioId";
  static const portfolioData = "portfolioData";
  static const portfolioPerformance = "portfolioPerformance";
  static const riskPercentage = "riskPercentage";
  static const volatilityPercentage = "volatilityPercentage";
  static const searchHistoryStock = "searchHistoryStock";
  static const searchHistoryBond = "searchHistoryBond";
  static const searchHistoryHedge = "searchHistoryHedge";
  static const searchHistoryMutual = "searchHistoryMutual";
  static const isBioMetricShown = "bioMetric";
  static const userName = "userName";
  static const roomDetails = "roomDetail";
  static const notificationSelectedList = "notificationSelectedList";
  // bool currentStateIsSignIn = false;

  ///Other Data


  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );

  IOSOptions _getIOSOptions() => const IOSOptions(
        accessibility: KeychainAccessibility.first_unlock,
      );

  FlutterSecureStorage getStorage() => FlutterSecureStorage(
      aOptions: _getAndroidOptions(), iOptions: _getIOSOptions());


  Future<String> getSecureStorageString(String stringName) async {
    FlutterSecureStorage prefs = getStorage();
    return await prefs.read(
            key: stringName,
            aOptions: _getAndroidOptions(),
            iOptions: _getIOSOptions()) ??
        "";
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    //  return prefs.getString(stringName) ?? "";
  }

  setSecureString(String stringName, String value) async {
    FlutterSecureStorage prefs = getStorage();
    await prefs.write(
        key: stringName,
        value: value,
        aOptions: _getAndroidOptions(),
        iOptions: _getIOSOptions());

    //SharedPreferences prefs = await SharedPreferences.getInstance();
    //  prefs.setString(stringName, value);
  }

  setSecureMapAsString(
      String stringName, Map<String, dynamic> value) async {
    FlutterSecureStorage prefs = getStorage();
    String encodedMap = json.encode(value);
    await prefs.write(
        key: stringName,
        value: encodedMap,
        aOptions: _getAndroidOptions(),
        iOptions: _getIOSOptions());

    // SharedPreferences prefs = await SharedPreferences.getInstance();
    //String encodedMap = json.encode(value);
    //prefs.setString(stringName, encodedMap);
  }

  Future<Map<String, dynamic>> getSecureMap(
    String stringName,
  ) async {
    FlutterSecureStorage prefs = getStorage();
    String? encodedMap = await prefs.read(
            key: stringName,
            aOptions: _getAndroidOptions(),
            iOptions: _getIOSOptions()) ??
        "";

    // SharedPreferences prefs = await SharedPreferences.getInstance();
    //  String? encodedMap = prefs.getString(stringName);
    Map<String, dynamic> decodedMap =
        (encodedMap.isNotEmpty) ? json.decode(encodedMap) : {};
    return decodedMap;
  }

  clearAllSecureStorage() async {
    FlutterSecureStorage prefs = getStorage();
    await prefs.deleteAll(
        aOptions: _getAndroidOptions(), iOptions: _getIOSOptions());
    // SharedPreferences preferences = await SharedPreferences.getInstance();
    //await preferences.clear();
  }

  removeOneKeyFromSecureStorage(
    String stringName,
  ) async {
    FlutterSecureStorage prefs = getStorage();
    await prefs.delete(
        key: stringName,
        aOptions: _getAndroidOptions(),
        iOptions: _getIOSOptions());
    //  SharedPreferences preferences = await SharedPreferences.getInstance();
    //  await preferences.remove(stringName);
  }

/*  // Function for Get Device Information from the device
  getDeviceInfoFromTheDevice() async {
    Console.debug('IN getDeviceInfo function');
    currentProgress.value = 'Getting Device Info';
    deviceToken.value = (await StorageService.getKey(key: StorageConstants.deviceToken) ?? await getUniqueToken()) ?? "NULL";

    if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await getIOSDetails();
      devicePlatform.value = "ios";
      deviceOS.value = iosInfo.systemVersion.toString();
      StorageService.setKey(key: StorageConstants.devicePlatform, value: 'ios');
      deviceType.value = "IOS ${iosInfo.name}";
      deviceInfo = DeviceInfo(
          deviceModel: iosInfo.model ?? '',
          deviceToken: deviceToken.value,
          deviceVersion: iosInfo.utsname.version ?? '',
          isDevicePhysical: iosInfo.isPhysicalDevice,
          deviceId: iosInfo.identifierForVendor ?? '');
    } else if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await getAndroidDetails();
      devicePlatform.value = "android";
      deviceOS.value = androidInfo.version.release.toString();
      StorageService.setKey(key: StorageConstants.devicePlatform, value: 'android');
      deviceType.value = "${androidInfo.brand} ${androidInfo.device}";
      deviceInfo = DeviceInfo(
          deviceModel: androidInfo.model ?? '',
          deviceToken: deviceToken.value,
          deviceVersion: androidInfo.version.release ?? '',
          isDevicePhysical: androidInfo.isPhysicalDevice ?? false,
          deviceId: androidInfo.androidId ?? '');
    }
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    appVersion.value = packageInfo.version;
    deviceId = deviceInfo.deviceId;
    StorageService.setKey(key: StorageConstants.deviceId, value: deviceInfo.deviceId);
    StorageService.setKey(key: StorageConstants.deviceToken, value: deviceToken.value);
  }*/
}



