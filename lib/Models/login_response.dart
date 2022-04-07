class LoginResponse {
  LoginResponse({
    required this.result,
    this.targetUrl,
    required this.success,
    this.error,
    required this.unAuthorizedRequest,
  });
  late final Result result;
  late final Null targetUrl;
  late final bool success;
  late final Null error;
  late final bool unAuthorizedRequest;
  late final bool _Abp;

  LoginResponse.fromJson(Map<String, dynamic> json) {
    result = Result.fromJson(json['result']);
    targetUrl = null;
    success = json['success'];
    error = null;
    unAuthorizedRequest = json['unAuthorizedRequest'];
    _Abp = json['__abp'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['result'] = result.toJson();
    _data['targetUrl'] = targetUrl;
    _data['success'] = success;
    _data['error'] = error;
    _data['unAuthorizedRequest'] = unAuthorizedRequest;
    _data['__abp'] = _Abp;
    return _data;
  }
}

class Result {
  Result({
    this.message,
    required this.success,
    required this.data,
  });
  late final Null message;
  late final bool success;
  late final Data data;

  Result.fromJson(Map<String, dynamic> json) {
    message = null;
    success = json['success'];
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['message'] = message;
    _data['success'] = success;
    _data['data'] = data.toJson();
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.fullName,
    required this.referalCode,
    required this.earnedPoints,
    required this.phoneNumber,
    required this.emailAddress,
    required this.accessToken,
  });
  late final int id;
  late final String fullName;
  late final String referalCode;
  late final int earnedPoints;
  late final String phoneNumber;
  late final String emailAddress;
  late final String accessToken;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['fullName'];
    referalCode = json['referalCode'];
    earnedPoints = json['earnedPoints'];
    phoneNumber = json['phoneNumber'];
    emailAddress = json['emailAddress'];
    accessToken = json['accessToken'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['fullName'] = fullName;
    _data['referalCode'] = referalCode;
    _data['earnedPoints'] = earnedPoints;
    _data['phoneNumber'] = phoneNumber;
    _data['emailAddress'] = emailAddress;
    _data['accessToken'] = accessToken;
    return _data;
  }
}
