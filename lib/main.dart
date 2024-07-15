import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:yoked/Localization/translation_message.dart';
import 'package:yoked/Routes/app_pages.dart';
import 'package:yoked/Routes/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: GetMaterialApp(
        title: 'Truber',
        getPages: AppPages.routes,
        initialRoute: AppRoutes.splashView,

        ///It contains the all the string used in app
        translations: Translation(),
        supportedLocales: const [
          Locale("en", "US"), // English, no country code
          Locale("ar", "AE"), // Spanish, no country code
        ],
      ),
    );
  }
}

// comands for localization and key filder

// flutter pub run easy_localization:generate --source-dir ./assets/localization --output-dir ./lib/localization/keys

// flutter pub run easy_localization:generate --source-dir ./assets/localization --output-dir ./lib/localization -f keys

// flutter pub run easy_localization:generate -h
