import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skilled_tasker/Models/home_response.dart';
import 'package:skilled_tasker/Models/login_response.dart';

class ApiProvider {
  final baseUrl =
      'http://api.skilledtasker.com.preview.my-hosting-panel.com/api/';

  /// All api
  Future<LoginResponse> login(Map<String, dynamic> queryParameters) async {
    final response = await http.post(
        Uri.parse(
          baseUrl + "TokenAuth/Login",
        ),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(queryParameters));

    return LoginResponse.fromJson(jsonDecode(response.body));
  }

  List<HomeGetList> data = [];
  // Future<Results> getList() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   var token = preferences.getString('token');
  //   final response = await http.get(
  //     Uri.parse(
  //       baseUrl + "TaskService/GetList",
  //     ),
  //     headers: {
  //       'Content-Type': 'application/json; charset=UTF-8',
  //       'Content-Type': 'application/json-patch+json',
  //       'Accept': 'application/json',
  //       'Authorization': 'Bearer $token',
  //     },
  //     //body: jsonEncode(queryParameters)
  //   );
  //   print(response.body);
  //   return Results.fromJson(jsonDecode(response.body));
  // }
}

class Results {
  Result? result;
  Null? targetUrl;
  bool? success;
  Null? error;
  bool? unAuthorizedRequest;
  bool? bAbp;

  Results(
      {this.result,
      this.targetUrl,
      this.success,
      this.error,
      this.unAuthorizedRequest,
      this.bAbp});

  Results.fromJson(Map<String, dynamic> json) {
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
  List<ListItems>? items;

  Items({this.items});

  Items.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <ListItems>[];
      json['items'].forEach((v) {
        items!.add(new ListItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ListItems {
  int? id;
  String? taskName;
  String? description;
  int? points;
  String? startDate;
  String? dueDate;
  String? duration;
  int? activeUser;

  ListItems(
      {this.id,
      this.taskName,
      this.description,
      this.points,
      this.startDate,
      this.dueDate,
      this.duration,
      this.activeUser});

  ListItems.fromJson(Map<String, dynamic> json) {
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
