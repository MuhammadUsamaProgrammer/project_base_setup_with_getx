import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:yoked/Constant/AppConfig.dart';
import 'package:yoked/Constant/custom_assets.dart';
import 'package:yoked/Theme/colors.dart';

import '../ViewModel/splash_view_model.dart';

class SplashView extends StatelessWidget {
  SplashView({super.key});

  final splashVM = Get.find<SplashViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.secondaryColor,
        body: SizedBox(
          height: AppConfig(context).height,
          width: AppConfig(context).width,
          child: Center(
              child:
                  SizedBox(height: 160, child: Image.asset(CustomAssets.logo))),
        ));
  }
}
