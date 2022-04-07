import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:skilled_tasker/Models/GetTasKListModel.dart';
import 'package:skilled_tasker/controller/comman_dailog.dart';
import 'package:skilled_tasker/services/services.dart';

class HomePageController extends GetxController {
  List<GetList> productData = [];
  Map productDetails = {}.obs;

  @override
  void onReady() {
    super.onReady();
    fatchProductData();
  }

  Future<void> fatchProductData() async {
    final List<GetList> loadedProduct = [];
    CommanDialog.showLoading();
    try {
      final response = await APICall().getRequest('/TaskService/GetList');
      CommanDialog.hideLoading();
      if (response['code'] == 200) {
        response['result']['data']['items']['getitems'].forEach(
          (productData) {
            loadedProduct.add(
              GetList(
                id: int.parse(productData['id']),
                taskName: productData['taskName'],
                description: productData["description"],
                points: productData['points'],
                startDate: productData['startDate'],
                duration: productData['duration'],
                dueDate: productData['dueDate'],
                activeUser: productData['activeUser'],
              ),
            );
          },
        );
        productData.assignAll(loadedProduct);
        // print(productData);
        update();
      } else if (response['code'] == 400) {
        Fluttertoast.showToast(msg: "400");
      } else {}
    } catch (error) {
      CommanDialog.hideLoading();
      CommanDialog.showErrorDialog();
      Fluttertoast.showToast(msg: "Api Issue");
      print("ERROR11 $error");
    }
  }
}
