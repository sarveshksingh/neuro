import 'dart:convert';

Login loginFromJson(String str) => Login.fromJson(json.decode(str));

String loginToJson(Login data) => json.encode(data.toJson());

class Login {
  Login({
    this.status,
    this.msg,
    this.userId,
    this.tokenId,
    this.url,
    this.userType,
  });

  int status;
  String msg;
  String userId;
  String tokenId;
  String url;
  int userType;

  factory Login.fromJson(Map<String, dynamic> json) => Login(
    status: json["status"],
    msg: json["msg"],
    userId: json["userId"],
    tokenId: json["tokenId"],
    url: json["url"],
    userType: json["userType"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "userId": userId,
    "tokenId": tokenId,
    "url": url,
    "userType": userType,
  };
}
