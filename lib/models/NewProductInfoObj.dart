import 'dart:convert';

class NewProductInfoObj {
  NewProductInfoObj({
    this.basicpackageSubscriptionList,
    this.addOnpackageSubscriptionList,
    this.channelSubscriptionList,
  });

  List<BasicpackageSubscriptionList> basicpackageSubscriptionList;
  List<dynamic> addOnpackageSubscriptionList;
  List<ChannelSubscriptionList> channelSubscriptionList;

  factory NewProductInfoObj.fromJson(Map<String, dynamic> json) => NewProductInfoObj(
    basicpackageSubscriptionList: List<BasicpackageSubscriptionList>.from(json["basicpackageSubscriptionList"].map((x) => BasicpackageSubscriptionList.fromJson(x))),
    addOnpackageSubscriptionList: List<dynamic>.from(json["addOnpackageSubscriptionList"].map((x) => x)),
    channelSubscriptionList: List<ChannelSubscriptionList>.from(json["channelSubscriptionList"].map((x) => ChannelSubscriptionList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "basicpackageSubscriptionList": List<dynamic>.from(basicpackageSubscriptionList.map((x) => x.toJson())),
    "addOnpackageSubscriptionList": List<dynamic>.from(addOnpackageSubscriptionList.map((x) => x)),
    "channelSubscriptionList": List<dynamic>.from(channelSubscriptionList.map((x) => x.toJson())),
  };
}
class BasicpackageSubscriptionList {
  BasicpackageSubscriptionList({
    this.packageId,
    this.packageName,
    this.packageMonthlyPrice,
    this.packageSubscriptionPrice,
    this.broadCasterId,
    this.broadCasterName,
    this.packageType,
    this.subscriptionTypeId,
    this.subscriptionTypeName,
    this.subscriptionValue,
    this.packageStatus,
    this.startDate,
    this.endDate,
    this.expiryInDays,
    this.message,
    this.channelCount,
    this.taxIncluded,
    this.choice,
  });

  int packageId;
  String packageName;
  int packageMonthlyPrice;
  int packageSubscriptionPrice;
  int broadCasterId;
  String broadCasterName;
  int packageType;
  int subscriptionTypeId;
  String subscriptionTypeName;
  int subscriptionValue;
  bool packageStatus;
  DateTime startDate;
  DateTime endDate;
  int expiryInDays;
  dynamic message;
  int channelCount;
  bool taxIncluded;
  int choice;

  factory BasicpackageSubscriptionList.fromJson(Map<String, dynamic> json) => BasicpackageSubscriptionList(
    packageId: json["packageId"],
    packageName: json["packageName"],
    packageMonthlyPrice: json["packageMonthlyPrice"],
    packageSubscriptionPrice: json["packageSubscriptionPrice"],
    broadCasterId: json["broadCasterId"],
    broadCasterName: json["broadCasterName"],
    packageType: json["packageType"],
    subscriptionTypeId: json["subscriptionTypeId"],
    subscriptionTypeName: json["subscriptionTypeName"],
    subscriptionValue: json["subscriptionValue"],
    packageStatus: json["packageStatus"],
    startDate: DateTime.parse(json["startDate"]),
    endDate: DateTime.parse(json["endDate"]),
    expiryInDays: json["expiryInDays"],
    message: json["message"],
    channelCount: json["channelCount"],
    taxIncluded: json["taxIncluded"],
    choice: json["choice"],
  );

  Map<String, dynamic> toJson() => {
    "packageId": packageId,
    "packageName": packageName,
    "packageMonthlyPrice": packageMonthlyPrice,
    "packageSubscriptionPrice": packageSubscriptionPrice,
    "broadCasterId": broadCasterId,
    "broadCasterName": broadCasterName,
    "packageType": packageType,
    "subscriptionTypeId": subscriptionTypeId,
    "subscriptionTypeName": subscriptionTypeName,
    "subscriptionValue": subscriptionValue,
    "packageStatus": packageStatus,
    "startDate": startDate.toIso8601String(),
    "endDate": endDate.toIso8601String(),
    "expiryInDays": expiryInDays,
    "message": message,
    "channelCount": channelCount,
    "taxIncluded": taxIncluded,
    "choice": choice,
  };
}

class ChannelSubscriptionList {
  ChannelSubscriptionList({
    this.msoId,
    this.channelId,
    this.eChannelId,
    this.channelPriceSettingId,
    this.channelName,
    this.channelLanguage,
    this.channelMonthlyPrice,
    this.broadCasterId,
    this.broadCasterName,
    this.isAlaCart,
    this.logo,
    this.description,
    this.startDate,
    this.endDate,
    this.subscriptionTypeId,
    this.subscriptionTypeName,
    this.subscriptionValue,
    this.packageStatus,
    this.expiryInDays,
    this.channelCatName,
    this.channelSignalName,
    this.message,
    this.taxIncluded,
  });

  String msoId;
  int channelId;
  String eChannelId;
  int channelPriceSettingId;
  String channelName;
  String channelLanguage;
  int channelMonthlyPrice;
  int broadCasterId;
  String broadCasterName;
  bool isAlaCart;
  String logo;
  String description;
  DateTime startDate;
  DateTime endDate;
  int subscriptionTypeId;
  String subscriptionTypeName;
  int subscriptionValue;
  bool packageStatus;
  int expiryInDays;
  String channelCatName;
  String channelSignalName;
  String message;
  bool taxIncluded;

  factory ChannelSubscriptionList.fromJson(Map<String, dynamic> json) => ChannelSubscriptionList(
    msoId: json["msoId"],
    channelId: json["channelId"],
    eChannelId: json["eChannelId"],
    channelPriceSettingId: json["channelPriceSettingId"],
    channelName: json["channelName"],
    channelLanguage: json["channelLanguage"],
    channelMonthlyPrice: json["channelMonthlyPrice"],
    broadCasterId: json["broadCasterId"],
    broadCasterName: json["broadCasterName"],
    isAlaCart: json["isAlaCart"],
    logo: json["logo"],
    description: json["description"],
    startDate: DateTime.parse(json["startDate"]),
    endDate: DateTime.parse(json["endDate"]),
    subscriptionTypeId: json["subscriptionTypeId"],
    subscriptionTypeName: json["subscriptionTypeName"],
    subscriptionValue: json["subscriptionValue"],
    packageStatus: json["packageStatus"],
    expiryInDays: json["expiryInDays"],
    channelCatName: json["channelCatName"],
    channelSignalName: json["channelSignalName"],
    message: json["message"],
    taxIncluded: json["taxIncluded"],
  );

  Map<String, dynamic> toJson() => {
    "msoId": msoId,
    "channelId": channelId,
    "eChannelId": eChannelId,
    "channelPriceSettingId": channelPriceSettingId,
    "channelName": channelName,
    "channelLanguage": channelLanguage,
    "channelMonthlyPrice": channelMonthlyPrice,
    "broadCasterId": broadCasterId,
    "broadCasterName": broadCasterName,
    "isAlaCart": isAlaCart,
    "logo": logo,
    "description": description,
    "startDate": startDate.toIso8601String(),
    "endDate": endDate.toIso8601String(),
    "subscriptionTypeId": subscriptionTypeId,
    "subscriptionTypeName": subscriptionTypeName,
    "subscriptionValue": subscriptionValue,
    "packageStatus": packageStatus,
    "expiryInDays": expiryInDays,
    "channelCatName": channelCatName,
    "channelSignalName": channelSignalName,
    "message": message,
    "taxIncluded": taxIncluded,
  };
}