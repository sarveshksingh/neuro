// To parse this JSON data, do
//
//     final subscriptionRequestModel = subscriptionRequestModelFromJson(jsonString);

import 'dart:convert';

import 'NewProductInfoObj.dart';
import 'SubscriptionRechargeCalculationObj.dart';

// To parse this JSON data, do
//
//     final subscriptionRequestModel = subscriptionRequestModelFromJson(jsonString);

import 'dart:convert';

SubscriptionRequestModel subscriptionRequestModelFromJson(String str) => SubscriptionRequestModel.fromJson(json.decode(str));

String subscriptionRequestModelToJson(SubscriptionRequestModel data) => json.encode(data.toJson());

class SubscriptionRequestModel {
  SubscriptionRequestModel({
    this.tokenId,
    this.subsId,
    this.encdvcId,
    this.packageList,
    this.channelList,
    this.taxList,
    this.mostRecentSubscriptionList,
    this.newProductInfoObj,
    this.subscriptionRechargeCalculationObj,
    this.pageName,
  });

  String tokenId;
  String subsId;
  String encdvcId;
  List<dynamic> packageList;
  List<dynamic> channelList;
  List<dynamic> taxList;
  List<dynamic> mostRecentSubscriptionList;
  Obj newProductInfoObj;
  Obj subscriptionRechargeCalculationObj;
  String pageName;

  factory SubscriptionRequestModel.fromJson(Map<String, dynamic> json) => SubscriptionRequestModel(
    tokenId: json["tokenId"],
    subsId: json["subsId"],
    encdvcId: json["encdvcId"],
    packageList: List<dynamic>.from(json["packageList"].map((x) => x)),
    channelList: List<dynamic>.from(json["channelList"].map((x) => x)),
    taxList: List<dynamic>.from(json["taxList"].map((x) => x)),
    mostRecentSubscriptionList: List<dynamic>.from(json["mostRecentSubscriptionList"].map((x) => x)),
    newProductInfoObj: Obj.fromJson(json["newProductInfoObj"]),
    subscriptionRechargeCalculationObj: Obj.fromJson(json["subscriptionRechargeCalculationObj"]),
    pageName: json["pageName"],
  );

  Map<String, dynamic> toJson() => {
    "tokenId": tokenId,
    "subsId": subsId,
    "encdvcId": encdvcId,
    "packageList": List<dynamic>.from(packageList.map((x) => x)),
    "channelList": List<dynamic>.from(channelList.map((x) => x)),
    "taxList": List<dynamic>.from(taxList.map((x) => x)),
    "mostRecentSubscriptionList": List<dynamic>.from(mostRecentSubscriptionList.map((x) => x)),
    "newProductInfoObj": newProductInfoObj.toJson(),
    "subscriptionRechargeCalculationObj": subscriptionRechargeCalculationObj.toJson(),
    "pageName": pageName,
  };
}

class Obj {
  Obj();

  factory Obj.fromJson(Map<String, dynamic> json) => Obj(
  );

  Map<String, dynamic> toJson() => {
  };
}
