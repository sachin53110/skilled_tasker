import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skilled_tasker/pages/home_page.dart';
import 'package:skilled_tasker/pages/login_page.dart';
import 'package:skilled_tasker/util/shar_prefreances.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => const LoginPage(),
      },
    );
  }
}
