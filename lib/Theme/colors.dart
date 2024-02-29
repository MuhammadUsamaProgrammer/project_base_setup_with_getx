import 'package:flutter/material.dart';

class AppColor with ChangeNotifier {
  // ThemeMode _themeMode = ThemeMode.light;
  // ThemeMode get getTheme => _themeMode;
  // setTheme(ThemeMode themeMode) {
  //   LocalHandler.setTheme(themeMode.name);
  //   _themeMode = themeMode;
  //   if (themeMode == ThemeMode.dark) {
  //     darkText = Colors.white;
  //     screenBG = Color(0xff101C24);
  //     white = Color(0xff232D35);
  //     primaryColor = Color(0xff8223ff);
  //     black = Colors.white;
  //     SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  //       statusBarBrightness: Brightness.light,
  //       statusBarColor: screenBG,
  //       statusBarIconBrightness: Brightness.light,
  //       systemNavigationBarDividerColor: white,
  //       systemNavigationBarColor: screenBG,
  //       systemNavigationBarIconBrightness: Brightness.light,
  //     ));
  //   } else {
  //     darkText = Color(0xFF252525);
  //     screenBG = Color(0xffF9F9F9);
  //     primaryColor = Color(0xff400d5f);
  //     white = Colors.white;
  //     black = Color(0xFF000000);
  //     SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  //       statusBarBrightness: Brightness.dark,
  //       statusBarColor: screenBG,
  //       statusBarIconBrightness: Brightness.dark,
  //       systemNavigationBarDividerColor: white,
  //       systemNavigationBarColor: screenBG,
  //       systemNavigationBarIconBrightness: Brightness.dark,
  //     ));
  //   }
  //   notifyListeners();
  // }

  static const Color backgroundColor = Color(0xffFCFCFC);
  static const Color primaryColor = Color(0xff2E4D55);
  static const Color secondaryColor = Color(0xffE4774F);
  static const Color darkText = Color(0xff191919);
  static const Color black = Color(0xff191919);
  static const Color greyText = Color(0xff3A4750);
  static const Color whiteText = Color(0xffFFFFFF);
  static const Color white = Color(0xffFFFFFF);
  static const Color red = Color.fromARGB(255, 241, 100, 100);
  //linear gradient
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: <Color>[
      Color(0xff0EBE7E),
      Color(0xff6BC89C),
    ],
  );
}

class FontWeights {
  static const FontWeight thin = FontWeight.w100;
  static const FontWeight extraLight = FontWeight.w200;
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight extraBold = FontWeight.w800;
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor';
    }
    return int.parse(hexColor, radix: 16);
  }
}
