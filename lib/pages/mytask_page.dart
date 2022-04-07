// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:skilled_tasker/Models/catalog.dart';
import 'package:skilled_tasker/widgets/HomeListWidgets.dart';
import 'package:skilled_tasker/widgets/drawer.dart';

class MyTaskPage extends StatefulWidget {
  const MyTaskPage({Key? key}) : super(key: key);

  @override
  _MyTaskPageState createState() => _MyTaskPageState();
}

class _MyTaskPageState extends State<MyTaskPage> {
  @override
  Widget build(BuildContext context) {
    //final dummyList = List.generate(20, (index) => CatalogModel.items[0]);
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        elevation: 0.0,
        title: const Text("MyProfile"),
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
                child: ListView.builder(
                  padding: const EdgeInsets.all(15.0),
                  //  itemCount: dummyList.length,
                  itemBuilder: (context, index) {
                    return HomeListWidgets(
                        // item: dummyList[index],
                        );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
      drawer: const MyDrawer(),
    );
  }
}
