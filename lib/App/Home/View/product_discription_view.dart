import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yoked/App/Home/Model/product_model.dart';
import 'package:yoked/Common/AppText/AppTextView.dart';
import 'package:yoked/Constant/AppConfig.dart';
import 'package:yoked/Theme/colors.dart';

class ProductDiscriptionView extends StatelessWidget {
  ProductDiscriptionView({super.key});
  ProductsModel product = Get.arguments[0];
  int index = Get.arguments[1];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        color: Colors.blueGrey,
        child: SafeArea(
          child: Container(
            width: AppConfig(context).width,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: AppColor.white),
                      child: Icon(Icons.arrow_back_ios_new_rounded),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Gap.h20(),
                          CustomText(title: index.toString()),
                          Gap.h20(),
                          CustomText(title: product.title),
                          Gap.h50(),
                          CustomText(title: product.description.toString()),
                          Gap.h50(),
                          Image.network(product.image),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
