import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefServices {
  static SharedPreferences prefs;

  static void saveUsertoSharedPrefs(String mobile, String password) async {
    prefs = await SharedPreferences.getInstance();

    prefs.setString('mobile', mobile);
    prefs.setString('password', password);
  }

  static void clearUserFromSharedPrefs() async {
    prefs = await SharedPreferences.getInstance();
    prefs.setString('mobile', null);
    prefs.setString('password', null);
  }

  static Future<Map<String, String>> getUserFromSharedPrefs() async {
    prefs = await SharedPreferences.getInstance();
    return {
      "mobile": prefs.getString('mobile'),
      "password": prefs.getString('password'),
    };
  }
}
