// To parse this JSON data, do
//
//     final subscriptionModel = subscriptionModelFromJson(jsonString);

import 'dart:convert';

SubscriptionModel subscriptionModelFromJson(String str) => SubscriptionModel.fromJson(json.decode(str));

String subscriptionModelToJson(SubscriptionModel data) => json.encode(data.toJson());

class SubscriptionModel {
  SubscriptionModel({
    this.status,
    this.msg,
    this.returnUrl,
    this.manualSubsObj,
  });

  num status;
  String msg;
  String returnUrl;
  ManualSubsObj manualSubsObj;

  factory SubscriptionModel.fromJson(Map<String, dynamic> json) => SubscriptionModel(
    status: json["status"],
    msg: json["msg"],
    returnUrl: json["returnUrl"],
    manualSubsObj: ManualSubsObj.fromJson(json["manualSubsObj"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "returnUrl": returnUrl,
    "manualSubsObj": manualSubsObj.toJson(),
  };
}

class ManualSubsObj {
  ManualSubsObj({
    this.tokenId,
    this.subsId,
    this.encdvcId,
    this.basicpackageList,
    this.addOnpackageList,
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
  List<PackageList> basicpackageList;
  List<PackageList> addOnpackageList;
  List<ChannelList> channelList;
  List<dynamic> taxList;
  List<MostRecentSubscriptionList> mostRecentSubscriptionList;
  NewProductInfoObj newProductInfoObj;
  SubscriptionRechargeCalculationObj subscriptionRechargeCalculationObj;
  String pageName;

  factory ManualSubsObj.fromJson(Map<String, dynamic> json) => ManualSubsObj(
    tokenId: json["tokenId"],
    subsId: json["subsId"],
    encdvcId: json["encdvcId"],
    basicpackageList: List<PackageList>.from(json["basicpackageList"].map((x) => PackageList.fromJson(x))),
    addOnpackageList: List<PackageList>.from(json["addOnpackageList"].map((x) => PackageList.fromJson(x))),
    channelList: List<ChannelList>.from(json["channelList"].map((x) => ChannelList.fromJson(x))),
    taxList: List<dynamic>.from(json["taxList"].map((x) => x)),
    mostRecentSubscriptionList: List<MostRecentSubscriptionList>.from(json["mostRecentSubscriptionList"].map((x) => MostRecentSubscriptionList.fromJson(x))),
    newProductInfoObj: NewProductInfoObj.fromJson(json["newProductInfoObj"]),
    subscriptionRechargeCalculationObj: SubscriptionRechargeCalculationObj.fromJson(json["subscriptionRechargeCalculationObj"]),
    pageName: json["pageName"],
  );

  Map<String, dynamic> toJson() => {
    "tokenId": tokenId,
    "subsId": subsId,
    "encdvcId": encdvcId,
    "basicpackageList": List<dynamic>.from(basicpackageList.map((x) => x.toJson())),
    "addOnpackageList": List<dynamic>.from(addOnpackageList.map((x) => x.toJson())),
    "channelList": List<dynamic>.from(channelList.map((x) => x.toJson())),
    "taxList": List<dynamic>.from(taxList.map((x) => x)),
    "mostRecentSubscriptionList": List<dynamic>.from(mostRecentSubscriptionList.map((x) => x.toJson())),
    "newProductInfoObj": newProductInfoObj.toJson(),
    "subscriptionRechargeCalculationObj": subscriptionRechargeCalculationObj.toJson(),
    "pageName": pageName,
  };
}

class PackageList {
  PackageList({
    this.packageId,
    this.ePackageId,
    this.packagePriceSettingId,
    this.packageName,
    this.packagePrice,
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
    this.packageList,
    this.promotionList,
  });

  num packageId;
  dynamic ePackageId;
  num packagePriceSettingId;
  String packageName;
  num packagePrice;
  num broadCasterId;
  String broadCasterName;
  num packageType;
  num subscriptionTypeId;
  dynamic subscriptionTypeName;
  num subscriptionValue;
  bool packageStatus;
  String startDate;
  String endDate;
  num expiryInDays;
  Message message;
  num channelCount;
  bool taxIncluded;
  num choice;
  List<dynamic> packageList;
  List<dynamic> promotionList;

  factory PackageList.fromJson(Map<String, dynamic> json) => PackageList(
    packageId: json["packageId"],
    ePackageId: json["ePackageId"],
    packagePriceSettingId: json["packagePriceSettingId"],
    packageName: json["packageName"],
    packagePrice: json["packagePrice"],
    broadCasterId: json["broadCasterId"],
    broadCasterName: json["broadCasterName"] == null ? null : json["broadCasterName"],
    packageType: json["packageType"],
    subscriptionTypeId: json["subscriptionTypeId"],
    subscriptionTypeName: json["subscriptionTypeName"],
    subscriptionValue: json["subscriptionValue"],
    packageStatus: json["packageStatus"],
    startDate: json["startDate"],
    endDate: json["endDate"],
    expiryInDays: json["expiryInDays"],
    message: messageValues.map[json["message"]],
    channelCount: json["channelCount"],
    taxIncluded: json["taxIncluded"],
    choice: json["choice"],
    packageList: List<dynamic>.from(json["packageList"].map((x) => x)),
    promotionList: List<dynamic>.from(json["promotionList"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "packageId": packageId,
    "ePackageId": ePackageId,
    "packagePriceSettingId": packagePriceSettingId,
    "packageName": packageName,
    "packagePrice": packagePrice,
    "broadCasterId": broadCasterId,
    "broadCasterName": broadCasterName == null ? null : broadCasterName,
    "packageType": packageType,
    "subscriptionTypeId": subscriptionTypeId,
    "subscriptionTypeName": subscriptionTypeName,
    "subscriptionValue": subscriptionValue,
    "packageStatus": packageStatus,
    "startDate": startDate,
    "endDate": endDate,
    "expiryInDays": expiryInDays,
    "message": messageValues.reverse[message],
    "channelCount": channelCount,
    "taxIncluded": taxIncluded,
    "choice": choice,
    "packageList": List<dynamic>.from(packageList.map((x) => x)),
    "promotionList": List<dynamic>.from(promotionList.map((x) => x)),
  };
}

enum Message { EMPTY, YES }

final messageValues = EnumValues({
  "": Message.EMPTY,
  "yes": Message.YES
});

class ChannelList {
  ChannelList({
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
    this.channelList,
    this.promotionList,
  });

  MsoId msoId;
  num channelId;
  dynamic eChannelId;
  num channelPriceSettingId;
  String channelName;
  dynamic channelLanguage;
  num channelMonthlyPrice;
  num broadCasterId;
  BroadcasterName broadCasterName;
  bool isAlaCart;
  String logo;
  dynamic description;
  String startDate;
  String endDate;
  num subscriptionTypeId;
  dynamic subscriptionTypeName;
  num subscriptionValue;
  bool packageStatus;
  num expiryInDays;
  String channelCatName;
  ChannelSignalName channelSignalName;
  Message message;
  bool taxIncluded;
  List<dynamic> channelList;
  List<dynamic> promotionList;

  factory ChannelList.fromJson(Map<String, dynamic> json) => ChannelList(
    msoId: json["msoId"] == null ? null : msoIdValues.map[json["msoId"]],
    channelId: json["channelId"],
    eChannelId: json["eChannelId"],
    channelPriceSettingId: json["channelPriceSettingId"],
    channelName: json["channelName"],
    channelLanguage: json["channelLanguage"],
    channelMonthlyPrice: json["channelMonthlyPrice"],
    broadCasterId: json["broadCasterId"],
    broadCasterName: json["broadCasterName"] == null ? null : broadcasterNameValues.map[json["broadCasterName"]],
    isAlaCart: json["isAlaCart"],
    logo: json["logo"] == null ? null : json["logo"],
    description: json["description"],
    startDate: json["startDate"],
    endDate: json["endDate"],
    subscriptionTypeId: json["subscriptionTypeId"],
    subscriptionTypeName: json["subscriptionTypeName"],
    subscriptionValue: json["subscriptionValue"],
    packageStatus: json["packageStatus"],
    expiryInDays: json["expiryInDays"],
    channelCatName: json["channelCatName"] == null ? null : json["channelCatName"],
    channelSignalName: json["channelSignalName"] == null ? null : channelSignalNameValues.map[json["channelSignalName"]],
    message: messageValues.map[json["message"]],
    taxIncluded: json["taxIncluded"],
    channelList: List<dynamic>.from(json["channelList"].map((x) => x)),
    promotionList: List<dynamic>.from(json["promotionList"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "msoId": msoId == null ? null : msoIdValues.reverse[msoId],
    "channelId": channelId,
    "eChannelId": eChannelId,
    "channelPriceSettingId": channelPriceSettingId,
    "channelName": channelName,
    "channelLanguage": channelLanguage,
    "channelMonthlyPrice": channelMonthlyPrice,
    "broadCasterId": broadCasterId,
    "broadCasterName": broadCasterName == null ? null : broadcasterNameValues.reverse[broadCasterName],
    "isAlaCart": isAlaCart,
    "logo": logo == null ? null : logo,
    "description": description,
    "startDate": startDate,
    "endDate": endDate,
    "subscriptionTypeId": subscriptionTypeId,
    "subscriptionTypeName": subscriptionTypeName,
    "subscriptionValue": subscriptionValue,
    "packageStatus": packageStatus,
    "expiryInDays": expiryInDays,
    "channelCatName": channelCatName == null ? null : channelCatName,
    "channelSignalName": channelSignalName == null ? null : channelSignalNameValues.reverse[channelSignalName],
    "message": messageValues.reverse[message],
    "taxIncluded": taxIncluded,
    "channelList": List<dynamic>.from(channelList.map((x) => x)),
    "promotionList": List<dynamic>.from(promotionList.map((x) => x)),
  };
}

enum BroadcasterName { ZEE_ENTERTAINMENT_ENTERPRISES_LIMITED, TV_TODAY_NETWORK_LTD, DISCOVERY_COMMUNICATIONS_INDIA, IN10_MEDIA_PVT_LTD, BENNETT_COLEMAN_COMPANY_LIMITED, SONY_PICTURES_NETWORKS_INDIA_PRIVATE_LIMITED, FREE_TO_AIR }

final broadcasterNameValues = EnumValues({
  "Bennett, Coleman & Company Limited": BroadcasterName.BENNETT_COLEMAN_COMPANY_LIMITED,
  "Discovery Communications India": BroadcasterName.DISCOVERY_COMMUNICATIONS_INDIA,
  "Free To Air": BroadcasterName.FREE_TO_AIR,
  "IN10 MEDIA PVT.LTD": BroadcasterName.IN10_MEDIA_PVT_LTD,
  "Sony Pictures Networks India Private Limited": BroadcasterName.SONY_PICTURES_NETWORKS_INDIA_PRIVATE_LIMITED,
  "TV Today Network Ltd.": BroadcasterName.TV_TODAY_NETWORK_LTD,
  "Zee Entertainment Enterprises Limited": BroadcasterName.ZEE_ENTERTAINMENT_ENTERPRISES_LIMITED
});

enum ChannelSignalName { SD, HD }

final channelSignalNameValues = EnumValues({
  "HD": ChannelSignalName.HD,
  "SD": ChannelSignalName.SD
});

enum MsoId { THE_00090007 }

final msoIdValues = EnumValues({
  "0009-0007": MsoId.THE_00090007
});

class MostRecentSubscriptionList {
  MostRecentSubscriptionList({
    this.msoId,
    this.productSubscriptionId,
    this.productId,
    this.productName,
    this.broadcasterName,
    this.startDate,
    this.endDate,
    this.packageType,
    this.channelCount,
    this.subsTypeId,
    this.subsVal,
    this.subscriptionTypeName,
    this.price,
    this.monthlyPrice,
    this.logo,
    this.isActive,
    this.taxIncluded,
    this.isProductRefundable,
    this.noOfDaysInMonth,
    this.transactionId,
    this.createdDate,
    this.promotionId,
    this.promotionType,
    this.promotionText,
    this.refundableAmount,
    this.isDiscontinue,
  });

  MsoId msoId;
  num productSubscriptionId;
  num productId;
  String productName;
  BroadcasterName broadcasterName;
  String startDate;
  String endDate;
  num packageType;
  num channelCount;
  num subsTypeId;
  num subsVal;
  String subscriptionTypeName;
  num price;
  num monthlyPrice;
  String logo;
  bool isActive;
  bool taxIncluded;
  bool isProductRefundable;
  num noOfDaysInMonth;
  num transactionId;
  String createdDate;
  num promotionId;
  String promotionType;
  String promotionText;
  num refundableAmount;
  bool isDiscontinue;

  factory MostRecentSubscriptionList.fromJson(Map<String, dynamic> json) => MostRecentSubscriptionList(
    msoId: msoIdValues.map[json["msoId"]],
    productSubscriptionId: json["productSubscriptionId"],
    productId: json["productId"],
    productName: json["productName"],
    broadcasterName: broadcasterNameValues.map[json["broadcasterName"]],
    startDate: json["startDate"],
    endDate: json["endDate"],
    packageType: json["packageType"],
    channelCount: json["channelCount"],
    subsTypeId: json["subsTypeId"],
    subsVal: json["subsVal"],
    subscriptionTypeName: json["subscriptionTypeName"],
    price: json["price"],
    monthlyPrice: json["monthlyPrice"],
    logo: json["logo"],
    isActive: json["isActive"],
    taxIncluded: json["taxIncluded"],
    isProductRefundable: json["isProductRefundable"],
    noOfDaysInMonth: json["noOfDaysInMonth"],
    transactionId: json["transactionId"],
    createdDate: json["createdDate"],
    promotionId: json["promotionId"],
    promotionType: json["promotionType"],
    promotionText: json["promotionText"],
    refundableAmount: json["refundableAmount"],
    isDiscontinue: json["isDiscontinue"],
  );

  Map<String, dynamic> toJson() => {
    "msoId": msoIdValues.reverse[msoId],
    "productSubscriptionId": productSubscriptionId,
    "productId": productId,
    "productName": productName,
    "broadcasterName": broadcasterNameValues.reverse[broadcasterName],
    "startDate": startDate,
    "endDate": endDate,
    "packageType": packageType,
    "channelCount": channelCount,
    "subsTypeId": subsTypeId,
    "subsVal": subsVal,
    "subscriptionTypeName": subscriptionTypeName,
    "price": price,
    "monthlyPrice": monthlyPrice,
    "logo": logo,
    "isActive": isActive,
    "taxIncluded": taxIncluded,
    "isProductRefundable": isProductRefundable,
    "noOfDaysInMonth": noOfDaysInMonth,
    "transactionId": transactionId,
    "createdDate": createdDate,
    "promotionId": promotionId,
    "promotionType": promotionType,
    "promotionText": promotionText,
    "refundableAmount": refundableAmount,
    "isDiscontinue": isDiscontinue,
  };
}

class NewProductInfoObj {
  NewProductInfoObj({
    this.basicpackageSubscriptionList,
    this.addOnpackageSubscriptionList,
    this.channelSubscriptionList,
  });

  List<dynamic> basicpackageSubscriptionList;
  List<dynamic> addOnpackageSubscriptionList;
  List<dynamic> channelSubscriptionList;

  factory NewProductInfoObj.fromJson(Map<String, dynamic> json) => NewProductInfoObj(
    basicpackageSubscriptionList: List<dynamic>.from(json["basicpackageSubscriptionList"].map((x) => x)),
    addOnpackageSubscriptionList: List<dynamic>.from(json["addOnpackageSubscriptionList"].map((x) => x)),
    channelSubscriptionList: List<dynamic>.from(json["channelSubscriptionList"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "basicpackageSubscriptionList": List<dynamic>.from(basicpackageSubscriptionList.map((x) => x)),
    "addOnpackageSubscriptionList": List<dynamic>.from(addOnpackageSubscriptionList.map((x) => x)),
    "channelSubscriptionList": List<dynamic>.from(channelSubscriptionList.map((x) => x)),
  };
}

class SubscriptionRechargeCalculationObj {
  SubscriptionRechargeCalculationObj({
    this.subTotal,
    this.isIgst,
    this.igst,
    this.cgst,
    this.sgst,
    this.refund,
    this.total,
    this.isCreditLimit,
    this.creditLimitAmount,
    this.cashReceived,
    this.walletbalance,
    this.netPayableAmount,
    this.taxList,
  });

  num subTotal;
  bool isIgst;
  num igst;
  num cgst;
  num sgst;
  num refund;
  num total;
  bool isCreditLimit;
  num creditLimitAmount;
  num cashReceived;
  num walletbalance;
  num netPayableAmount;
  List<TaxList> taxList;

  factory SubscriptionRechargeCalculationObj.fromJson(Map<String, dynamic> json) => SubscriptionRechargeCalculationObj(
    subTotal: json["subTotal"],
    isIgst: json["isIGST"],
    igst: json["igst"],
    cgst: json["cgst"],
    sgst: json["sgst"],
    refund: json["refund"],
    total: json["total"],
    isCreditLimit: json["isCreditLimit"],
    creditLimitAmount: json["creditLimitAmount"],
    cashReceived: json["cashReceived"],
    walletbalance: json["walletbalance"],
    netPayableAmount: json["netPayableAmount"],
    taxList: List<TaxList>.from(json["taxList"].map((x) => TaxList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "subTotal": subTotal,
    "isIGST": isIgst,
    "igst": igst,
    "cgst": cgst,
    "sgst": sgst,
    "refund": refund,
    "total": total,
    "isCreditLimit": isCreditLimit,
    "creditLimitAmount": creditLimitAmount,
    "cashReceived": cashReceived,
    "walletbalance": walletbalance,
    "netPayableAmount": netPayableAmount,
    "taxList": List<dynamic>.from(taxList.map((x) => x.toJson())),
  };
}

class TaxList {
  TaxList({
    this.taxCatId,
    this.taxName,
    this.taxValue,
    this.taxAmount,
    this.isPercentage,
    this.totalTaxAmount,
  });

  num taxCatId;
  String taxName;
  num taxValue;
  num taxAmount;
  bool isPercentage;
  num totalTaxAmount;

  factory TaxList.fromJson(Map<String, dynamic> json) => TaxList(
    taxCatId: json["taxCatId"],
    taxName: json["taxName"],
    taxValue: json["taxValue"],
    taxAmount: json["taxAmount"],
    isPercentage: json["isPercentage"],
    totalTaxAmount: json["totalTaxAmount"],
  );

  Map<String, dynamic> toJson() => {
    "taxCatId": taxCatId,
    "taxName": taxName,
    "taxValue": taxValue,
    "taxAmount": taxAmount,
    "isPercentage": isPercentage,
    "totalTaxAmount": totalTaxAmount,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
