import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:skilled_tasker/Models/catalog.dart';
import 'package:skilled_tasker/Models/home_response.dart';
import 'package:skilled_tasker/Models/login_response.dart';
import 'package:skilled_tasker/bloc/api_bloc.dart';
import 'package:skilled_tasker/controller/homepage_controller.dart';
import 'package:skilled_tasker/widgets/HomeListWidgets.dart';
import 'package:skilled_tasker/widgets/drawer.dart';

class HomaPage extends StatefulWidget {
  HomaPage({Key? key}) : super(key: key);
  // final HomePageController controller = Get.put(HomePageController());
  @override
  _HomaPageState createState() => _HomaPageState();
}

void setState(Null Function() param0) {}

class _HomaPageState extends State<HomaPage> {
  final url =
      "http://api.skilledtasker.com.preview.my-hosting-panel.com/api/services/app/TaskService/Get${1013}";
  // getApiData() async {

  //   // var response = await http.get(Uri.https(
  //   //     "api.skilledtasker.com.preview.my-hosting-panel.com/api/",
  //   //     "services/app/TaskService/Get"));
  //   // var jsonData = jsonDecode(response.body);

  // }
  @override
  void initState() {
    super.initState();
    // bloc.getListApi();

    // loadData();
  }

  @override
  Widget build(BuildContext context) {
    //  final dummyList = List.generate(20, (index) => CatalogModel.items[0]);
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        elevation: 0.0,
        title: const Text("Skilled Tasker"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0))),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0)),
                child: HomeListWidgets(),
                // child: ListView.builder(
                //   padding: const EdgeInsets.all(15.0),
                //   itemCount: dummyList.length,
                //   itemBuilder: (context, index) {
                //     return HomeListWidgets(
                //       item: dummyList[index],
                //     );
                //   },
                // ),
              ),
            ),
          ),
        ],
      ),
      drawer: const MyDrawer(),
    );
  }

  void loadData() async {
    // await Future.delayed(const Duration(seconds: 2));
    // var response = await http.get(Uri(host: url));
    // final silledTaskerJson = response.body;
    // final decodedData = jsonDecode(silledTaskerJson);
    // var productsData = decodedData["products"];
    // SkilledModel.items = List.from(productsData)
    //     .map<Result>((item) => Result.fromJson(item))
    //     .toList();
    // setState(() {});
  }
}
