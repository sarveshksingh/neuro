// To parse this JSON data, do
//
//     final subsTransactionHistoryResponse = subsTransactionHistoryResponseFromJson(jsonString);

import 'dart:convert';

SubsTransactionHistoryResponse subsTransactionHistoryResponseFromJson(String str) => SubsTransactionHistoryResponse.fromJson(json.decode(str));

String subsTransactionHistoryResponseToJson(SubsTransactionHistoryResponse data) => json.encode(data.toJson());

class SubsTransactionHistoryResponse {
  SubsTransactionHistoryResponse({
    this.status,
    this.msg,
    this.filePath,
    this.transactionInfo,
  });

  int status;
  String msg;
  String filePath;
  TransactionInfo transactionInfo;

  factory SubsTransactionHistoryResponse.fromJson(Map<String, dynamic> json) => SubsTransactionHistoryResponse(
    status: json["status"],
    msg: json["msg"],
    filePath: json["filePath"],
    transactionInfo: TransactionInfo.fromJson(json["transactionInfo"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "filePath": filePath,
    "transactionInfo": transactionInfo.toJson(),
  };
}

class TransactionInfo {
  TransactionInfo({
    this.transactionHistory,
    this.lcoFranchDeviceInfoCommon,
    this.totalCount,
    this.serviceTypeId,
    this.serviceTypeList,
    this.paymentMode,
    this.paymentmodeList,
    this.fromDate,
    this.endDate,
    this.submitType,
  });

  List<TransactionHistory> transactionHistory;
  LcoFranchDeviceInfoCommon lcoFranchDeviceInfoCommon;
  int totalCount;
  int serviceTypeId;
  List<EList> serviceTypeList;
  int paymentMode;
  List<EList> paymentmodeList;
  dynamic fromDate;
  dynamic endDate;
  dynamic submitType;

  factory TransactionInfo.fromJson(Map<String, dynamic> json) => TransactionInfo(
    transactionHistory: List<TransactionHistory>.from(json["transactionHistory"].map((x) => TransactionHistory.fromJson(x))),
    lcoFranchDeviceInfoCommon: LcoFranchDeviceInfoCommon.fromJson(json["lcoFranchDeviceInfoCommon"]),
    totalCount: json["totalCount"],
    serviceTypeId: json["serviceTypeId"],
    serviceTypeList: List<EList>.from(json["serviceTypeList"].map((x) => EList.fromJson(x))),
    paymentMode: json["paymentMode"],
    paymentmodeList: List<EList>.from(json["paymentmodeList"].map((x) => EList.fromJson(x))),
    fromDate: json["fromDate"],
    endDate: json["endDate"],
    submitType: json["submitType"],
  );

  Map<String, dynamic> toJson() => {
    "transactionHistory": List<dynamic>.from(transactionHistory.map((x) => x.toJson())),
    "lcoFranchDeviceInfoCommon": lcoFranchDeviceInfoCommon.toJson(),
    "totalCount": totalCount,
    "serviceTypeId": serviceTypeId,
    "serviceTypeList": List<dynamic>.from(serviceTypeList.map((x) => x.toJson())),
    "paymentMode": paymentMode,
    "paymentmodeList": List<dynamic>.from(paymentmodeList.map((x) => x.toJson())),
    "fromDate": fromDate,
    "endDate": endDate,
    "submitType": submitType,
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
  dynamic vcNumber;
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
  dynamic transactionDate;
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

class EList {
  EList({
    this.item,
    this.value,
  });

  String item;
  String value;

  factory EList.fromJson(Map<String, dynamic> json) => EList(
    item: json["item"],
    value: json["value"],
  );

  Map<String, dynamic> toJson() => {
    "item": item,
    "value": value,
  };
}

class TransactionHistory {
  TransactionHistory({
    this.transactionId,
    this.transactionDate,
    this.serviceName,
    this.paymentMode,
    this.credit,
    this.debit,
    this.description,
    this.paymentAcknowledgedBy,
    this.parentTransactionId,
    this.priceListId,
    this.subscriberDeviceMapId,
    this.totalRowCount,
  });

  int transactionId;
  String transactionDate;
  String serviceName;
  String paymentMode;
  double credit;
  double debit;
  String description;
  String paymentAcknowledgedBy;
  int parentTransactionId;
  int priceListId;
  int subscriberDeviceMapId;
  int totalRowCount;

  factory TransactionHistory.fromJson(Map<String, dynamic> json) => TransactionHistory(
    transactionId: json["transactionId"],
    transactionDate: json["transactionDate"],
    serviceName: json["serviceName"],
    paymentMode: json["paymentMode"],
    credit: json["credit"],
    debit: json["debit"].toDouble(),
    description: json["description"],
    paymentAcknowledgedBy: json["paymentAcknowledgedBy"],
    parentTransactionId: json["parentTransactionId"],
    priceListId: json["priceListId"],
    subscriberDeviceMapId: json["subscriberDeviceMapId"],
    totalRowCount: json["totalRowCount"],
  );

  Map<String, dynamic> toJson() => {
    "transactionId": transactionId,
    "transactionDate": transactionDate,
    "serviceName": serviceName,
    "paymentMode": paymentMode,
    "credit": credit,
    "debit": debit,
    "description": description,
    "paymentAcknowledgedBy": paymentAcknowledgedBy,
    "parentTransactionId": parentTransactionId,
    "priceListId": priceListId,
    "subscriberDeviceMapId": subscriberDeviceMapId,
    "totalRowCount": totalRowCount,
  };
}
