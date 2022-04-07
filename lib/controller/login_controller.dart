// import 'dart:convert';

// import 'package:http/http.dart' as http;

// class LoginController {
//   userLogin(data) async {
//     Map  datas = {"usernameOrEmailAddress": "aa@g.com", "password": "Sachin53@"};
//     final body = json.encode(data);
//     String url =
//         'http://api.skilledtasker.com.preview.my-hosting-panel.com/api/TokenAuth/Login';
//     try {
//       final http.Response response = await http.post(Uri.parse(url),
//           body: body, headers: {"content-type": "application/json-path+json"});
//       print(response.statusCode);
//       return jsonDecode(response.body);
//     } catch (e) {}
//   }
// }
