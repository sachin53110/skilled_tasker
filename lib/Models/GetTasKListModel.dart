class GetTaskListModel {
  Result? result;
  Null? targetUrl;
  bool? success;
  Null? error;
  bool? unAuthorizedRequest;
  bool? bAbp;

  GetTaskListModel(
      {this.result,
      this.targetUrl,
      this.success,
      this.error,
      this.unAuthorizedRequest,
      this.bAbp});

  GetTaskListModel.fromJson(Map<String, dynamic> json) {
    result =
        json['result'] != null ? new Result.fromJson(json['result']) : null;
    targetUrl = json['targetUrl'];
    success = json['success'];
    error = json['error'];
    unAuthorizedRequest = json['unAuthorizedRequest'];
    bAbp = json['__abp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    data['targetUrl'] = this.targetUrl;
    data['success'] = this.success;
    data['error'] = this.error;
    data['unAuthorizedRequest'] = this.unAuthorizedRequest;
    data['__abp'] = this.bAbp;
    return data;
  }
}

class Result {
  String? message;
  bool? success;
  Data? data;

  Result({this.message, this.success, this.data});

  Result.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? totalCount;
  Items? items;

  Data({this.totalCount, this.items});

  Data.fromJson(Map<String, dynamic> json) {
    totalCount = json['totalCount'];
    items = json['items'] != null ? new Items.fromJson(json['items']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalCount'] = this.totalCount;
    if (this.items != null) {
      data['items'] = this.items!.toJson();
    }
    return data;
  }
}

class Items {
  List<GetList>? getitems;

  Items({this.getitems});

  Items.fromJson(Map<String, dynamic> json) {
    if (json['getitems'] != null) {
      getitems = <GetList>[];
      json['getitems'].forEach((v) {
        getitems!.add(new GetList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.getitems != null) {
      data['getitems'] = this.getitems!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GetList {
  int? id;
  String? taskName;
  String? description;
  int? points;
  String? startDate;
  String? dueDate;
  String? duration;
  int? activeUser;

  GetList(
      {this.id,
      this.taskName,
      this.description,
      this.points,
      this.startDate,
      this.dueDate,
      this.duration,
      this.activeUser});

  GetList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    taskName = json['taskName'];
    description = json['description'];
    points = json['points'];
    startDate = json['startDate'];
    dueDate = json['dueDate'];
    duration = json['duration'];
    activeUser = json['activeUser'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['taskName'] = this.taskName;
    data['description'] = this.description;
    data['points'] = this.points;
    data['startDate'] = this.startDate;
    data['dueDate'] = this.dueDate;
    data['duration'] = this.duration;
    data['activeUser'] = this.activeUser;
    return data;
  }
}
