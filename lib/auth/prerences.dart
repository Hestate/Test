
import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static Future<int> getInt(String key, int value) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(key) ?? value;
  }

  static Future<Future<bool>> setInt(String key, int value) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setInt(key, value);
  }

  static Future<Future<bool>> setString(String key, String? value) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString(key, value!);
  }

  static Future<String> getString(String key, String? value) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? value ?? '';
  }

  static Future<Future<bool>> setBool(String key, bool value) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setBool(key, value);
  }

  static Future<bool> getBool(String key, bool value) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key) ?? value;
  }

  static Future<Future<bool>> setDouble(String key, double value) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setDouble(key, value);
  }

  static Future<double> getDouble(String key, double value) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(key) ?? value;
  }

  static Future<bool> remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.remove(key);
  }

  static Future<Future<bool>> clear() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.clear();
  }
}
