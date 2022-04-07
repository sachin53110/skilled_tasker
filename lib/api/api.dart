import 'dart:convert';

import 'package:http/http.dart' as http;

class CallApi {
  final String _url =
      "http://api.skilledtasker.com.preview.my-hosting-panel.com/api/";

  Future<http.Response> postData(data, apiUrl) async {
    var fullUrl = _url + apiUrl;
    final http.Response response = await http.post(Uri.parse(fullUrl),
        body: jsonEncode(data),
        headers: {"Content-Type": "application/json-path+json"});
    print(response.body);
    return jsonDecode(response.body);
    // return print(response.body);
  }

  _setHearder() => {
        "content-type: application/json-patch+json"
            "accept: text/plain"
      };
}
