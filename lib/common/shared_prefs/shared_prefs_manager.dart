import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'user_model.dart';

class PreferencesManager {
  static const _userKey = 'user';

  static Future<void> saveUser(UserModel user) async {
    final prefs = await SharedPreferences.getInstance();
    final userJson = json.encode(user.toJson());
    await prefs.setString(_userKey, userJson);
  }

  static Future<UserModel?> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_userKey);
    if (jsonString == null) return null;
    final jsonData = json.decode(jsonString);
    return UserModel.fromJson(jsonData);
  }

  static Future<void> clearUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userKey);
  }
}
