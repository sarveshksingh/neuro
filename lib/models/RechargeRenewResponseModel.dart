import 'dart:convert';

RechargeRenewResponseModel rechargeRenewResponseModelFromJson(String str) => RechargeRenewResponseModel.fromJson(json.decode(str));

String rechargeRenewResponseModelToJson(RechargeRenewResponseModel data) => json.encode(data.toJson());

class RechargeRenewResponseModel {
  RechargeRenewResponseModel({
    this.status,
    this.message,
    this.returnUrl,
  });

  int status;
  String message;
  String returnUrl;

  factory RechargeRenewResponseModel.fromJson(Map<String, dynamic> json) => RechargeRenewResponseModel(
    status: json["status"],
    message: json["message"],
    returnUrl: json["returnUrl"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "returnUrl": returnUrl,
  };
}
