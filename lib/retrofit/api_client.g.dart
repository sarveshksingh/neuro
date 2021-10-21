// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _ApiClient implements ApiClient {
  _ApiClient(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'http://www.neurosms.in:9090/api/';
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<MsoResponse> msoDetails(subDomain) async {
    ArgumentError.checkNotNull(subDomain, 'subDomain');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = {'subDomain': subDomain};
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>('Home/msoDetails',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            contentType: 'application/x-www-form-urlencoded',
            baseUrl: baseUrl),
        data: _data);
    final value = MsoResponse.fromJson(_result.data);
    return value;
  }

  @override
  Future<Login> loginUser(user_ID, password) async {
    ArgumentError.checkNotNull(user_ID, 'user_ID');
    ArgumentError.checkNotNull(password, 'password');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = {'email': user_ID, 'password': password};
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>('Home/Login',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            contentType: 'application/x-www-form-urlencoded',
            baseUrl: baseUrl),
        data: _data);
    final value = Login.fromJson(_result.data);
    return value;
  }

  @override
  Future<ForgotPassword> forgotPassword(emailId) async {
    ArgumentError.checkNotNull(emailId, 'emailId');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = {'emailId': emailId};
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>(
        'Home/userforgotPassword',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            contentType: 'application/x-www-form-urlencoded',
            baseUrl: baseUrl),
        data: _data);
    final value = ForgotPassword.fromJson(_result.data);
    return value;
  }

  @override
  Future<SubsDashboardResponse> getSubsDashboard(tokenId) async {
    ArgumentError.checkNotNull(tokenId, 'tokenId');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = {'tokenId': tokenId};
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>(
        'Home/subsDashboard',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            contentType: 'application/x-www-form-urlencoded',
            baseUrl: baseUrl),
        data: _data);
    final value = SubsDashboardResponse.fromJson(_result.data);
    return value;
  }

  @override
  Future<SubsTransactionHistoryResponse> getSubsTransactnHistory(
      tokenId,
      subsWalletId,
      pageid,
      submitType,
      vcNumber,
      transactionTypeId,
      serviceTypeId,
      paymentMode,
      fromDate,
      endDate) async {
    ArgumentError.checkNotNull(tokenId, 'tokenId');
    ArgumentError.checkNotNull(subsWalletId, 'subsWalletId');
    ArgumentError.checkNotNull(pageid, 'pageid');
    ArgumentError.checkNotNull(submitType, 'submitType');
    ArgumentError.checkNotNull(vcNumber, 'vcNumber');
    ArgumentError.checkNotNull(transactionTypeId, 'transactionTypeId');
    ArgumentError.checkNotNull(serviceTypeId, 'serviceTypeId');
    ArgumentError.checkNotNull(paymentMode, 'paymentMode');
    ArgumentError.checkNotNull(fromDate, 'fromDate');
    ArgumentError.checkNotNull(endDate, 'endDate');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = {
      'tokenId': tokenId,
      'subsWalletId': subsWalletId,
      'pageid': pageid,
      'submitType': submitType,
      'vcNumber': vcNumber,
      'transactionTypeId': transactionTypeId,
      'serviceTypeId': serviceTypeId,
      'paymentMode': paymentMode,
      'fromDate': fromDate,
      'endDate': endDate
    };
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>(
        'Home/subsTransactnHistory',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            contentType: 'application/x-www-form-urlencoded',
            baseUrl: baseUrl),
        data: _data);
    final value = SubsTransactionHistoryResponse.fromJson(_result.data);
    return value;
  }

  @override
  Future<QuickRechargeResponse> getQuickRechargeData(
      tokenId, subsId, encdvcId) async {
    ArgumentError.checkNotNull(tokenId, 'tokenId');
    ArgumentError.checkNotNull(subsId, 'subsId');
    ArgumentError.checkNotNull(encdvcId, 'encdvcId');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = {'tokenId': tokenId, 'subsId': subsId, 'encdvcId': encdvcId};
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>(
        'Home/quickRecharge',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            contentType: 'application/x-www-form-urlencoded',
            baseUrl: baseUrl),
        data: _data);
    final value = QuickRechargeResponse.fromJson(_result.data);
    return value;
  }

  @override
  Future<RechargeRenewResponseModel> rechargeRenew(dataJson) async {
    //ArgumentError.checkNotNull(queryParameters, 'queryParameters');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = dataJson;
    final _result = await _dio.request<Map<String, dynamic>>(
        Apis.rechargeRenew,
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            contentType: 'application/json',
            baseUrl: baseUrl),
        data: _data);
    final value = RechargeRenewResponseModel.fromJson(_result.data);
    return value;
  }

  @override
  Future<ChangePasswordResponse> getChangePassword(
      tokenId, password, confpassword) async {
    ArgumentError.checkNotNull(tokenId, 'tokenId');
    ArgumentError.checkNotNull(password, 'password');
    ArgumentError.checkNotNull(confpassword, 'confpassword');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = {
      'tokenId': tokenId,
      'password': password,
      'confpassword': confpassword
    };
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>(
        'Home/resetPassword',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            contentType: 'application/x-www-form-urlencoded',
            baseUrl: baseUrl),
        data: _data);
    final value = ChangePasswordResponse.fromJson(_result.data);
    return value;
  }
}
