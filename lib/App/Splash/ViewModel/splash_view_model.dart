import 'dart:async';

import 'package:get/get.dart';

class SplashViewModel extends GetxController {
  Timer? timer;
  @override
  void onInit() {
    super.onInit();
    timer = Timer(const Duration(seconds: 3), () {
      navigateTo();
    });
  }

  navigateTo() async {}

  @override
  void dispose() {
    super.dispose();
    timer!.cancel();
  }
}
