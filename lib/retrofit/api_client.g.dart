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
    final _result = await _dio.request<Map<String, dynamic>>(Apis.msoDetails,
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
    final _result = await _dio.request<Map<String, dynamic>>(Apis.login,
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
        Apis.forgotPassword,
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
        Apis.subsDashboard,
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
    ArgumentError.checkNotNull(fromDate, 'fromDate');
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
        Apis.subsTransactnHistory,
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
      tokenId,
      subsId,
      encdvcId,
      ) async {
    ArgumentError.checkNotNull(tokenId, 'tokenId');
    ArgumentError.checkNotNull(subsId, 'subsId');
    ArgumentError.checkNotNull(encdvcId, 'encdvcId');

    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = {
      'tokenId': tokenId,
      'subsId': subsId,
      'encdvcId': encdvcId,

    };
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>(
        Apis.quickRecharge,
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







/*@override
  Future<MsoResponse> msoDetails(subDomain) async {
    ArgumentError.checkNotNull(subDomain, 'subDomain');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = {'subDomain': subDomain};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        Apis.msoDetails,
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{"Accept": "application/json",
              "content-type":"application/json"},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = MsoResponse.fromJson(_result.data);
    return Future.value(value);
  }

  @override
  loginUser(email, password) async {
    ArgumentError.checkNotNull(email, 'email');
    ArgumentError.checkNotNull(password, 'password');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = {'email': email, 'Password': password};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        Apis.login,
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Login.fromJson(_result.data);
    return Future.value(value);
  }

  @override
  forgotPassword(emailId) async {
    ArgumentError.checkNotNull(emailId, 'emailId');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = {'emailId': emailId};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        Apis.msoDetails,
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = ForgotPassword.fromJson(_result.data);
    return Future.value(value);
  }*/
}
