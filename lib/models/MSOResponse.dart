import 'dart:convert';

MsoResponse msoResponseModelFromJson(String str) =>
    MsoResponse.fromJson(json.decode(str));

String msoResponseModelToJson(MsoResponse data) =>
    json.encode(data.toJson());

class MsoResponse {
  MsoResponse({
    this.status,
    this.msg,
    this.logoPath,
    this.msoDetails,
  });

  int status;
  String msg;
  String logoPath;
  MsoDetails msoDetails;

  factory MsoResponse.fromJson(Map<String, dynamic> json) =>
      MsoResponse(
        status: json["status"],
        msg: json["msg"],
        logoPath: json["logoPath"],
        msoDetails: MsoDetails.fromJson(json["msoDetails"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "logoPath": logoPath,
        "msoDetails": msoDetails.toJson(),
      };
}

class MsoDetails {
  MsoDetails({
    this.userId,
    this.parentId,
    this.accountId,
    this.accountNo,
    this.accountName,
    this.contactPerson,
    this.mobileno,
    this.addressLine1,
    this.addressLine2,
    this.addressLine3,
    this.emailId,
    this.password,
    this.confirmPassword,
    this.countryId,
    this.stateId,
    this.zoneId,
    this.cityId,
    this.areaId,
    this.postcode,
    this.documentTypeId,
    this.documentNumber,
    this.gstNo,
    this.businessLogo,
    this.phoneNo,
    this.gender,
    this.profilePic,
    this.status,
    this.remark,
    this.hasEmail,
    this.countriesList,
    this.stateList,
    this.cityList,
    this.documentTypeList,
    this.emailConfirmed,
    this.phoneNumberConfirmed,
  });

  String userId;
  String parentId;
  int accountId;
  String accountNo;
  String accountName;
  String contactPerson;
  String mobileno;
  String addressLine1;
  dynamic addressLine2;
  dynamic addressLine3;
  String emailId;
  dynamic password;
  dynamic confirmPassword;
  int countryId;
  int stateId;
  int zoneId;
  int cityId;
  int areaId;
  String postcode;
  int documentTypeId;
  dynamic documentNumber;
  String gstNo;
  String businessLogo;
  dynamic phoneNo;
  int gender;
  String profilePic;
  int status;
  dynamic remark;
  bool hasEmail;
  List<dynamic> countriesList;
  List<dynamic> stateList;
  List<dynamic> cityList;
  dynamic documentTypeList;
  bool emailConfirmed;
  bool phoneNumberConfirmed;

  factory MsoDetails.fromJson(Map<String, dynamic> json) => MsoDetails(
        userId: json["userId"],
        parentId: json["parentId"],
        accountId: json["accountId"],
        accountNo: json["accountNo"],
        accountName: json["accountName"],
        contactPerson: json["contactPerson"],
        mobileno: json["mobileno"],
        addressLine1: json["addressLine1"],
        addressLine2: json["addressLine2"],
        addressLine3: json["addressLine3"],
        emailId: json["emailId"],
        password: json["password"],
        confirmPassword: json["confirmPassword"],
        countryId: json["countryId"],
        stateId: json["stateId"],
        zoneId: json["zoneId"],
        cityId: json["cityId"],
        areaId: json["areaId"],
        postcode: json["postcode"],
        documentTypeId: json["documentTypeId"],
        documentNumber: json["documentNumber"],
        gstNo: json["gstNo"],
        businessLogo: json["businessLogo"],
        phoneNo: json["phoneNo"],
        gender: json["gender"],
        profilePic: json["profilePic"],
        status: json["status"],
        remark: json["remark"],
        hasEmail: json["hasEmail"],
        countriesList: List<dynamic>.from(json["countriesList"].map((x) => x)),
        stateList: List<dynamic>.from(json["stateList"].map((x) => x)),
        cityList: List<dynamic>.from(json["cityList"].map((x) => x)),
        documentTypeList: json["documentTypeList"],
        emailConfirmed: json["emailConfirmed"],
        phoneNumberConfirmed: json["phoneNumberConfirmed"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "parentId": parentId,
        "accountId": accountId,
        "accountNo": accountNo,
        "accountName": accountName,
        "contactPerson": contactPerson,
        "mobileno": mobileno,
        "addressLine1": addressLine1,
        "addressLine2": addressLine2,
        "addressLine3": addressLine3,
        "emailId": emailId,
        "password": password,
        "confirmPassword": confirmPassword,
        "countryId": countryId,
        "stateId": stateId,
        "zoneId": zoneId,
        "cityId": cityId,
        "areaId": areaId,
        "postcode": postcode,
        "documentTypeId": documentTypeId,
        "documentNumber": documentNumber,
        "gstNo": gstNo,
        "businessLogo": businessLogo,
        "phoneNo": phoneNo,
        "gender": gender,
        "profilePic": profilePic,
        "status": status,
        "remark": remark,
        "hasEmail": hasEmail,
        "countriesList": List<dynamic>.from(countriesList.map((x) => x)),
        "stateList": List<dynamic>.from(stateList.map((x) => x)),
        "cityList": List<dynamic>.from(cityList.map((x) => x)),
        "documentTypeList": documentTypeList,
        "emailConfirmed": emailConfirmed,
        "phoneNumberConfirmed": phoneNumberConfirmed,
      };
}
