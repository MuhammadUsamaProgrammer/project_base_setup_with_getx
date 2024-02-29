import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:yoked/DB/local_db_handler.dart';

class TranslationViewModel extends GetxController {
  RxString currentLanguage = "en".obs;
  RxString selectedLanguage = "en".obs;
  onSelectLangaueg(String lan) {
    selectedLanguage.value = lan;
  }

  checkCurrentLanguage() async {
    String lange = "en";
    lange = await LocalHandler.getLanguage();
    print("lange");
    print(lange);
    if (lange.isNotEmpty) {
      currentLanguage.value = lange;
      selectedLanguage.value = lange;
      changeLanguage(currentLanguage.value);
    } else {
      changeLanguage("en");
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    checkCurrentLanguage();
  }

  // final box = GetStorage();
  void changeLanguage(String selectedLanguage) async {
    switch (selectedLanguage) {
      case 'en':
        await LocalHandler.setLanguage(selectedLanguage);
        Get.updateLocale(const Locale('en', 'US'));
        currentLanguage.value = "en";
        print("language changed to English");
        break;
      case 'ar':
        LocalHandler.setLanguage(selectedLanguage);
        await Get.updateLocale(const Locale('ar', 'AE'));
        currentLanguage.value = "ar";
        print("language changed to Arabic");
        break;
    }
  }
}
