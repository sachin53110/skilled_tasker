import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skilled_tasker/controller/homepage_controller.dart';
import 'package:skilled_tasker/resources/api_provider.dart';

class HomeListWidgets extends StatelessWidget {
  // Item item;
  final HomePageController controller = Get.put(HomePageController());
  HomeListWidgets({Key? key}) : super(key: key);
  //List<ListItems> hell = [];
//  Map<String, String> v = Map();
  //const HomeListWidgets({Key? key}) : super(key: key);
  // @override
  // void initState() {
  //   // bloc.getlist.listen((event) {
  //   //   // setState() {
  //   //   //   hell.addAll(event.result!.data!.items?.items);

  //   //   //   print(hell);
  //   //   // }

  //   //   print(hell);
  //   // });
  // }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(
      builder: (controller) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return Container(
              child: GestureDetector(
                onTap: () {},
                child: Card(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                        color: Theme.of(context).primaryColor, width: 1),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  elevation: 5,
                  child: Column(
                    children: [
                      Text(
                        controller.productData[index].taskName.toString(),
                        style: TextStyle(color: Colors.black, height: 50),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
          itemCount: controller.productData.length,
        );
      },
    );
  }
}
