import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static late SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // Set a string
  Future<void> setString(String key, String value) async {
    await _prefs.setString(key, value);
  }

  // Get a string
  String? getString(String key) {
    return _prefs.getString(key);
  }

  // Set a bool
  Future<void> setBool(String key, bool value) async {
    await _prefs.setBool(key, value);
  }

  // Get a bool
  bool? getBool(String key) {
    return _prefs.getBool(key);
  }

  // Remove key
  Future<void> remove(String key) async {
    await _prefs.remove(key);
  }

  // Clear all
  Future<void> clear() async {
    await _prefs.clear();
  }
}
