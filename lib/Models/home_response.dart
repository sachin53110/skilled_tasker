class HomeGetList {
  HomeGetList({
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

  HomeGetList.fromJson(Map<String, dynamic> json) {
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
    required this.message,
    required this.success,
    required this.data,
  });
  late final String message;
  late final bool success;
  late final Data data;

  Result.fromJson(Map<String, dynamic> json) {
    message = json['message'];
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
    required this.totalCount,
    required this.items,
  });
  late final int totalCount;
  late final Items items;

  Data.fromJson(Map<String, dynamic> json) {
    totalCount = json['totalCount'];
    items = Items.fromJson(json['items']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['totalCount'] = totalCount;
    _data['items'] = items.toJson();
    return _data;
  }
}

class Items {
  Items({
    required this.items,
  });
  late final List<Items> items;

  Items.fromJson(Map<String, dynamic> json) {
    items = List.from(json['items']).map((e) => Items.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['items'] = items.map((e) => e.toJson()).toList();
    return _data;
  }
}
