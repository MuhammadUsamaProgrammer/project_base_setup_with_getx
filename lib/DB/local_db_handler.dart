import 'package:shared_preferences/shared_preferences.dart';

class LocalHandler {
 static setToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

 static setTheme(String theme) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('theme', theme);
  }

 static Future<String> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? action = prefs.getString('token');
    return action ?? "";
  }

  static Future<String> getTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? action = prefs.getString('theme');
    return action ?? "";
  }

 static setLanguage(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', value);
  }

  static Future<String> getLanguage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var result = prefs.getString('language');
    return result ?? "";
  }

 static setEmail(String email) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', email);
  }

 static removeCache() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(
      'email',
    );
    await prefs.remove(
      'language',
    );
    await prefs.remove(
      'token',
    );
    await prefs.remove(
      'theme',
    );
  }

 static Future<String> getEmail() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? action = prefs.getString('email');
    return action ?? "";
  }
}
