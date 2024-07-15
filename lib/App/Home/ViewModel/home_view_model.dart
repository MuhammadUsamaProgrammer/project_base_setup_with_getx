import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yoked/App/Home/Model/product_model.dart';
import 'package:yoked/App/Home/Service/home_service.dart';
import 'package:yoked/Utils/loader.dart';

class HomeViewModel extends GetxController with HomeService {
  RxList<ProductsModel> productsList = <ProductsModel>[].obs;

  Future<bool> getProductsAPI(BuildContext context) async {
    showLoadingIndicator(context: context);
    bool success = false;
    List<ProductsModel> result = await getProductsService();
    hideOpenDialog(context: context);
    if (result.isNotEmpty) {
      productsList.value = result;
      productsList.refresh();
      log(result.length.toString());
      success = true;
    }
    return success;
  }
}
