


// To parse this JSON data, do
//
//     final quickRechargeResponse = quickRechargeResponseFromJson(jsonString);

import 'dart:convert';

QuickRechargeResponse quickRechargeResponseFromJson(String str) => QuickRechargeResponse.fromJson(json.decode(str));

String quickRechargeResponseToJson(QuickRechargeResponse data) => json.encode(data.toJson());

class QuickRechargeResponse {
  QuickRechargeResponse({
    this.status,
    this.msg,
    this.returnUrl,
    this.encdvcId,
    this.rechargeInfo,
  });

  int status;
  String msg;
  String returnUrl;
  String encdvcId;
  RechargeInfo rechargeInfo;

  factory QuickRechargeResponse.fromJson(Map<String, dynamic> json) => QuickRechargeResponse(
    status: json["status"],
    msg: json["msg"],
    returnUrl: json["returnUrl"],
    encdvcId: json["encdvcId"],
    rechargeInfo: RechargeInfo.fromJson(json["rechargeInfo"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "returnUrl": returnUrl,
    "encdvcId": encdvcId,
    "rechargeInfo": rechargeInfo.toJson(),
  };
}

class RechargeInfo {
  RechargeInfo({
    this.msoId,
    this.currentUserRoleId,
    this.subscriberId,
    this.encsubsDeviceMapId,
    this.rechargeBasics,
    this.lcoFranchDeviceInfoCommon,
    this.mostRecentQuickRechargeSubscriptionList,
    this.productInfoQuickRechargeSubscription,
    this.subscriberInfoQuickRechargeSubscription,
    this.taxInfo,
  });

  String msoId;
  String currentUserRoleId;
  String subscriberId;
  String encsubsDeviceMapId;
  RechargeBasics rechargeBasics;
  LcoFranchDeviceInfoCommon lcoFranchDeviceInfoCommon;
  List<MostRecentQuickRechargeSubscriptionList> mostRecentQuickRechargeSubscriptionList;
  List<MostRecentQuickRechargeSubscriptionList> productInfoQuickRechargeSubscription;
  List<SubscriberInfoQuickRechargeSubscription> subscriberInfoQuickRechargeSubscription;
  List<TaxInfo> taxInfo;

  factory RechargeInfo.fromJson(Map<String, dynamic> json) => RechargeInfo(
    msoId: json["msoId"],
    currentUserRoleId: json["currentUserRoleId"],
    subscriberId: json["subscriberId"],
    encsubsDeviceMapId: json["encsubsDeviceMapId"],
    rechargeBasics: RechargeBasics.fromJson(json["rechargeBasics"]),
    lcoFranchDeviceInfoCommon: LcoFranchDeviceInfoCommon.fromJson(json["lcoFranchDeviceInfoCommon"]),
    mostRecentQuickRechargeSubscriptionList: List<MostRecentQuickRechargeSubscriptionList>.from(json["mostRecentQuickRechargeSubscriptionList"].map((x) => MostRecentQuickRechargeSubscriptionList.fromJson(x))),
    productInfoQuickRechargeSubscription: List<MostRecentQuickRechargeSubscriptionList>.from(json["productInfoQuickRechargeSubscription"].map((x) => MostRecentQuickRechargeSubscriptionList.fromJson(x))),
    subscriberInfoQuickRechargeSubscription: List<SubscriberInfoQuickRechargeSubscription>.from(json["subscriberInfoQuickRechargeSubscription"].map((x) => SubscriberInfoQuickRechargeSubscription.fromJson(x))),
    taxInfo: List<TaxInfo>.from(json["taxInfo"].map((x) => TaxInfo.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "msoId": msoId,
    "currentUserRoleId": currentUserRoleId,
    "subscriberId": subscriberId,
    "encsubsDeviceMapId": encsubsDeviceMapId,
    "rechargeBasics": rechargeBasics.toJson(),
    "lcoFranchDeviceInfoCommon": lcoFranchDeviceInfoCommon.toJson(),
    "mostRecentQuickRechargeSubscriptionList": List<dynamic>.from(mostRecentQuickRechargeSubscriptionList.map((x) => x.toJson())),
    "productInfoQuickRechargeSubscription": List<dynamic>.from(productInfoQuickRechargeSubscription.map((x) => x.toJson())),
    "subscriberInfoQuickRechargeSubscription": List<dynamic>.from(subscriberInfoQuickRechargeSubscription.map((x) => x.toJson())),
    "taxInfo": List<dynamic>.from(taxInfo.map((x) => x.toJson())),
  };
}

class LcoFranchDeviceInfoCommon {
  LcoFranchDeviceInfoCommon({
    this.walletId,
    this.vcNumber,
    this.displayAccountStatus,
    this.displayUserWallet,
    this.displayDeviceStatus,
    this.displayFranchiseeWallet,
    this.addAmount,
    this.displayAddAmount,
    this.subsDeviceMapId,
  });

  String walletId;
  String vcNumber;
  bool displayAccountStatus;
  bool displayUserWallet;
  bool displayDeviceStatus;
  bool displayFranchiseeWallet;
  AddAmount addAmount;
  bool displayAddAmount;
  int subsDeviceMapId;

  factory LcoFranchDeviceInfoCommon.fromJson(Map<String, dynamic> json) => LcoFranchDeviceInfoCommon(
    walletId: json["walletId"],
    vcNumber: json["vcNumber"],
    displayAccountStatus: json["displayAccountStatus"],
    displayUserWallet: json["displayUserWallet"],
    displayDeviceStatus: json["displayDeviceStatus"],
    displayFranchiseeWallet: json["displayFranchiseeWallet"],
    addAmount: AddAmount.fromJson(json["addAmount"]),
    displayAddAmount: json["displayAddAmount"],
    subsDeviceMapId: json["subsDeviceMapId"],
  );

  Map<String, dynamic> toJson() => {
    "walletId": walletId,
    "vcNumber": vcNumber,
    "displayAccountStatus": displayAccountStatus,
    "displayUserWallet": displayUserWallet,
    "displayDeviceStatus": displayDeviceStatus,
    "displayFranchiseeWallet": displayFranchiseeWallet,
    "addAmount": addAmount.toJson(),
    "displayAddAmount": displayAddAmount,
    "subsDeviceMapId": subsDeviceMapId,
  };
}

class AddAmount {
  AddAmount({
    this.userId,
    this.loggedInUserId,
    this.transactionInitiatorUserId,
    this.walletId,
    this.transactionDate,
    this.paymentModeId,
    this.amount,
    this.remark,
    this.reference,
    this.paymentModes,
    this.serviceTypeId,
    this.isAuthEnabled,
  });

  dynamic userId;
  dynamic loggedInUserId;
  dynamic transactionInitiatorUserId;
  dynamic walletId;
  String transactionDate;
  int paymentModeId;
  int amount;
  dynamic remark;
  dynamic reference;
  List<dynamic> paymentModes;
  int serviceTypeId;
  bool isAuthEnabled;

  factory AddAmount.fromJson(Map<String, dynamic> json) => AddAmount(
    userId: json["userId"],
    loggedInUserId: json["loggedInUserId"],
    transactionInitiatorUserId: json["transactionInitiatorUserId"],
    walletId: json["walletId"],
    transactionDate: json["transactionDate"],
    paymentModeId: json["paymentModeId"],
    amount: json["amount"],
    remark: json["remark"],
    reference: json["reference"],
    paymentModes: List<dynamic>.from(json["paymentModes"].map((x) => x)),
    serviceTypeId: json["serviceTypeId"],
    isAuthEnabled: json["isAuthEnabled"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "loggedInUserId": loggedInUserId,
    "transactionInitiatorUserId": transactionInitiatorUserId,
    "walletId": walletId,
    "transactionDate": transactionDate,
    "paymentModeId": paymentModeId,
    "amount": amount,
    "remark": remark,
    "reference": reference,
    "paymentModes": List<dynamic>.from(paymentModes.map((x) => x)),
    "serviceTypeId": serviceTypeId,
    "isAuthEnabled": isAuthEnabled,
  };
}

class MostRecentQuickRechargeSubscriptionList {
  MostRecentQuickRechargeSubscriptionList({
    this.productId,
    this.productName,
    this.broadcasterName,
    this.startDate,
    this.endDate,
    this.productTypeId,
    this.productType,
    this.productSubscriptionId,
    this.subsTypeId,
    this.subsVal,
    this.subscriptionTypeName,
    this.price,
    this.logo,
    this.isActive,
    this.monthlyPrice,
    this.isTaxIncluded,
    this.daysLeft,
    this.refundAmount,
    this.promotionId,
    this.promotionType,
    this.promotionText,
    this.expDaysVal,
    this.isIgst,
    this.igst,
    this.cgst,
    this.sgst,
  });

  int productId;
  String productName;
  String broadcasterName;
  String startDate;
  String endDate;
  int productTypeId;
  String productType;
  int productSubscriptionId =0;
  int subsTypeId;
  int subsVal;
  String subscriptionTypeName;
  double price;
  String logo;
  bool isActive;
  double monthlyPrice;
  bool isTaxIncluded;
  String daysLeft;
  double refundAmount;
  int promotionId;
  String promotionType;
  String promotionText;
  int expDaysVal;
  bool isIgst;
  double igst;
  double cgst;
  double sgst;

  factory MostRecentQuickRechargeSubscriptionList.fromJson(Map<String, dynamic> json) => MostRecentQuickRechargeSubscriptionList(
    productId: json["productId"],
    productName: json["productName"],
    broadcasterName: json["broadcasterName"],
    startDate: json["startDate"],
    endDate: json["endDate"],
    productTypeId: json["productTypeId"],
    productType: json["productType"],
    productSubscriptionId: json["productSubscriptionId"] == null ? null : json["productSubscriptionId"],
    subsTypeId: json["subsTypeId"],
    subsVal: json["subsVal"],
    subscriptionTypeName: json["subscriptionTypeName"],
    price: json["price"].toDouble(),
    logo: json["logo"],
    isActive: json["isActive"] == null ? null : json["isActive"],
    monthlyPrice: json["monthlyPrice"].toDouble(),
    isTaxIncluded: json["isTaxIncluded"],
    daysLeft: json["daysLeft"],
    refundAmount: json["refundAmount"] == null ? null : json["refundAmount"],
    promotionId: json["promotionId"],
    promotionType: json["promotionType"],
    promotionText: json["promotionText"],
    expDaysVal: json["expDaysVal"] == null ? null : json["expDaysVal"],
    isIgst: json["isIGST"] == null ? null : json["isIGST"],
    igst: json["igst"] == null ? null : json["igst"],
    cgst: json["cgst"] == null ? null : json["cgst"].toDouble(),
    sgst: json["sgst"] == null ? null : json["sgst"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "productId": productId,
    "productName": productName,
    "broadcasterName": broadcasterName,
    "startDate": startDate,
    "endDate": endDate,
    "productTypeId": productTypeId,
    "productType": productType,
    "productSubscriptionId": productSubscriptionId == null ? null : productSubscriptionId,
    "subsTypeId": subsTypeId,
    "subsVal": subsVal,
    "subscriptionTypeName": subscriptionTypeName,
    "price": price,
    "logo": logo,
    "isActive": isActive == null ? null : isActive,
    "monthlyPrice": monthlyPrice,
    "isTaxIncluded": isTaxIncluded,
    "daysLeft": daysLeft,
    "refundAmount": refundAmount == null ? null : refundAmount,
    "promotionId": promotionId,
    "promotionType": promotionType,
    "promotionText": promotionText,
    "expDaysVal": expDaysVal == null ? null : expDaysVal,
    "isIGST": isIgst == null ? null : isIgst,
    "igst": igst == null ? null : igst,
    "cgst": cgst == null ? null : cgst,
    "sgst": sgst == null ? null : sgst,
  };
}
/*
enum DaysLeft { EXPIRES_IN_7_DAY_S, EXPIRES_IN_37_DAY_S }

final daysLeftValues = EnumValues({
  "Expires In 37 Day(s)": DaysLeft.EXPIRES_IN_37_DAY_S,
  "Expires In 7 Day(s)": DaysLeft.EXPIRES_IN_7_DAY_S
});

enum Logo { EMPTY, CNBCTV18_JPG }

final logoValues = EnumValues({
  "CNBCTV18.jpg": Logo.CNBCTV18_JPG,
  "": Logo.EMPTY
});

enum ProductType { BASIC, ADD_ON_PACKAGE, A_LA_CARTE }

final productTypeValues = EnumValues({
  "Add-On Package": ProductType.ADD_ON_PACKAGE,
  "A-La-Carte": ProductType.A_LA_CARTE,
  "Basic": ProductType.BASIC
});

enum SubscriptionTypeName { MONTHLY_1 }

final subscriptionTypeNameValues = EnumValues({
  "Monthly @ 1": SubscriptionTypeName.MONTHLY_1
});
*/
class RechargeBasics {
  RechargeBasics({
    this.subscriberId,
    this.encDeviceMapId,
    this.contactPersonName,
    this.lcoName,
    this.subscriberAccountNo,
    this.subscriberAddress,
    this.subscriberArea,
    this.subscriberCity,
    this.subscriberAccountStatus,
    this.subscriberAccountStatusValue,
    this.subscriberDeviceStatus,
    this.subscriberDeviceStatusValue,
    this.stbNo,
    this.vcNo,
    this.subscriberWalletBalance,
    this.subscriberCreditLimit,
    this.franchiseeName,
    this.franchiseeWalletBalance,
    this.totalSubscriptionCost,
    this.subscriptionExpiry,
    this.subscriptionTypeId,
    this.subscriptionTypeValue,
    this.noOfDaysInMonth,
    this.lockingPeriod,
    this.isBasicPackMandatory,
    this.nextStartDate,
    this.subscriptionDdl,
    this.fullRefundDuration,
    this.subwalletId,
    this.loggedInUserRoleId,
    this.serverDateTime,
  });

  dynamic subscriberId;
  dynamic encDeviceMapId;
  String contactPersonName;
  String lcoName;
  String subscriberAccountNo;
  String subscriberAddress;
  String subscriberArea;
  String subscriberCity;
  int subscriberAccountStatus;
  String subscriberAccountStatusValue;
  int subscriberDeviceStatus;
  String subscriberDeviceStatusValue;
  String stbNo;
  String vcNo;
  double subscriberWalletBalance;
  double subscriberCreditLimit;
  String franchiseeName;
  double franchiseeWalletBalance;
  int totalSubscriptionCost;
  DateTime subscriptionExpiry;
  int subscriptionTypeId;
  dynamic subscriptionTypeValue;
  int noOfDaysInMonth;
  int lockingPeriod;
  bool isBasicPackMandatory;
  DateTime nextStartDate;
  List<dynamic> subscriptionDdl;
  int fullRefundDuration;
  String subwalletId;
  String loggedInUserRoleId;
  DateTime serverDateTime;

  factory RechargeBasics.fromJson(Map<String, dynamic> json) => RechargeBasics(
    subscriberId: json["subscriberId"],
    encDeviceMapId: json["encDeviceMapId"],
    contactPersonName: json["contactPersonName"],
    lcoName: json["lcoName"],
    subscriberAccountNo: json["subscriberAccountNo"],
    subscriberAddress: json["subscriberAddress"],
    subscriberArea: json["subscriberArea"],
    subscriberCity: json["subscriberCity"],
    subscriberAccountStatus: json["subscriberAccountStatus"],
    subscriberAccountStatusValue: json["subscriberAccountStatusValue"],
    subscriberDeviceStatus: json["subscriberDeviceStatus"],
    subscriberDeviceStatusValue: json["subscriberDeviceStatusValue"],
    stbNo: json["stbNo"],
    vcNo: json["vcNo"],
    subscriberWalletBalance: json["subscriberWalletBalance"].toDouble(),
    subscriberCreditLimit: json["subscriberCreditLimit"],
    franchiseeName: json["franchiseeName"],
    franchiseeWalletBalance: json["franchiseeWalletBalance"].toDouble(),
    totalSubscriptionCost: json["totalSubscriptionCost"],
    subscriptionExpiry: DateTime.parse(json["subscriptionExpiry"]),
    subscriptionTypeId: json["subscriptionTypeId"],
    subscriptionTypeValue: json["subscriptionTypeValue"],
    noOfDaysInMonth: json["noOfDaysInMonth"],
    lockingPeriod: json["lockingPeriod"],
    isBasicPackMandatory: json["isBasicPackMandatory"],
    nextStartDate: DateTime.parse(json["nextStartDate"]),
    subscriptionDdl: List<dynamic>.from(json["subscriptionDdl"].map((x) => x)),
    fullRefundDuration: json["fullRefundDuration"],
    subwalletId: json["subwalletID"],
    loggedInUserRoleId: json["loggedInUserRoleId"],
    serverDateTime: DateTime.parse(json["serverDateTime"]),
  );

  Map<String, dynamic> toJson() => {
    "subscriberId": subscriberId,
    "encDeviceMapId": encDeviceMapId,
    "contactPersonName": contactPersonName,
    "lcoName": lcoName,
    "subscriberAccountNo": subscriberAccountNo,
    "subscriberAddress": subscriberAddress,
    "subscriberArea": subscriberArea,
    "subscriberCity": subscriberCity,
    "subscriberAccountStatus": subscriberAccountStatus,
    "subscriberAccountStatusValue": subscriberAccountStatusValue,
    "subscriberDeviceStatus": subscriberDeviceStatus,
    "subscriberDeviceStatusValue": subscriberDeviceStatusValue,
    "stbNo": stbNo,
    "vcNo": vcNo,
    "subscriberWalletBalance": subscriberWalletBalance,
    "subscriberCreditLimit": subscriberCreditLimit,
    "franchiseeName": franchiseeName,
    "franchiseeWalletBalance": franchiseeWalletBalance,
    "totalSubscriptionCost": totalSubscriptionCost,
    "subscriptionExpiry": subscriptionExpiry.toIso8601String(),
    "subscriptionTypeId": subscriptionTypeId,
    "subscriptionTypeValue": subscriptionTypeValue,
    "noOfDaysInMonth": noOfDaysInMonth,
    "lockingPeriod": lockingPeriod,
    "isBasicPackMandatory": isBasicPackMandatory,
    "nextStartDate": nextStartDate.toIso8601String(),
    "subscriptionDdl": List<dynamic>.from(subscriptionDdl.map((x) => x)),
    "fullRefundDuration": fullRefundDuration,
    "subwalletID": subwalletId,
    "loggedInUserRoleId": loggedInUserRoleId,
    "serverDateTime": serverDateTime.toIso8601String(),
  };
}

class SubscriberInfoQuickRechargeSubscription {
  SubscriberInfoQuickRechargeSubscription({
    this.subscriberWalletBalance,
    this.subscriberCreditLimitLeft,
  });

  double subscriberWalletBalance;
  double subscriberCreditLimitLeft;

  factory SubscriberInfoQuickRechargeSubscription.fromJson(Map<String, dynamic> json) => SubscriberInfoQuickRechargeSubscription(
    subscriberWalletBalance: json["subscriberWalletBalance"].toDouble(),
    subscriberCreditLimitLeft: json["subscriberCreditLimitLeft"],
  );

  Map<String, dynamic> toJson() => {
    "subscriberWalletBalance": subscriberWalletBalance,
    "subscriberCreditLimitLeft": subscriberCreditLimitLeft,
  };
}

class TaxInfo {
  TaxInfo({
    this.taxCatId,
    this.taxName,
    this.taxValue,
  });

  int taxCatId;
  String taxName;
  double taxValue;

  factory TaxInfo.fromJson(Map<String, dynamic> json) => TaxInfo(
    taxCatId: json["taxCatId"],
    taxName: json["taxName"],
    taxValue: json["taxValue"],
  );

  Map<String, dynamic> toJson() => {
    "taxCatId": taxCatId,
    "taxName": taxName,
    "taxValue": taxValue,
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
