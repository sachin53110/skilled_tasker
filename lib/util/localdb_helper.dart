// import 'package:shared_preferences/shared_preferences.dart';

// class LocaldbHelper {
//   saveToken(String? token) async {
//     SharedPreferences _pref = await SharedPreferences.getInstance();

//     _pref.setString("token", token!);
//   }

//   static Future getToken() async {
//     SharedPreferences _pref = await SharedPreferences.getInstance();
//     if (_pref.containsKey('token')) {
//       return _pref.get('token');
//     }
//     return null;
//   }
// }
