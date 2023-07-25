import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/state_manager.dart';
import 'package:shop/models/products.dart';
import 'package:shop/services/remote.dart';

class ProductController extends GetxController {
  RxList<Welcome> productList = RxList<Welcome>([]);
  bool isLoading = true;

  @override
  void onInit() {
    fetctProduct();
    super.onInit();
  }

  void fetctProduct() async {
    try {
      var prod = await RemoteServices.fetchProduct();

      if (prod != null) {
        productList.value = prod;
        isLoading = false;
      } else {
        // Show an error dialog box or toast message
        // In this example, we'll use a toast message
        Fluttertoast.showToast(
          msg: "Failed to fetch data from the API.",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 10,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        isLoading = false;
      }
    } catch (e) {
      // Show an error dialog box or toast message
      // In this example, we'll use a toast message
      Fluttertoast.showToast(
        msg: "An error occurred. Please try again later.",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 10,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      isLoading = false;
    } finally {
      // Ensure that the loading indicator is hidden even if there's an error
      isLoading = false;
    }
  }
}
