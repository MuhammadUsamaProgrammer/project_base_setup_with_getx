import 'dart:async';

import 'package:get/get.dart';
import 'package:yoked/Routes/app_routes.dart';

class SplashViewModel extends GetxController {
  Timer? timer;
  @override
  void onInit() {
    super.onInit();
    timer = Timer(const Duration(seconds: 3), () {
      navigateTo();
    });
  }

  navigateTo() async {
    Get.offAllNamed(AppRoutes.homeView);
  }

  @override
  void dispose() {
    super.dispose();
    timer!.cancel();
  }
}
