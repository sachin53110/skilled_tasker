import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class APICall {
  final apiBaseUri =
      "http://api.skilledtasker.com.preview.my-hosting-panel.com/api/services/app";

  Future<dynamic> getRequest(String endPoint) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString('token');
    var apiUrl = Uri.parse(apiBaseUri + endPoint);
    try {
      final apiResponse =
          await http.get(apiUrl, headers: {'Authorization': 'Bearer $token'});

      if (apiResponse.statusCode == 200) {
        //print('${json.decode(apiResponse.body)}');
        final finalResponse = json.decode(apiResponse.body);
        return finalResponse;
      }
    } catch (error) {
      throw error;
    }
  }

  Future<dynamic> postRequest(String endPoint, dynamic postData) async {
    var apiUrl = Uri.parse(apiBaseUri + endPoint);
    try {
      final apiResponse = await http.post(apiUrl, body: json.encode(postData));

      if (apiResponse.statusCode == 200) {
        print('${json.decode(apiResponse.body)}');
        final finalResponse = json.decode(apiResponse.body);
        return finalResponse;
      }
    } catch (error) {
      Fluttertoast.showToast(msg: "Api Issue service");
      throw error;
    }
  }
}
