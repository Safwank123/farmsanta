import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static late SharedPreferences sharedPreferences;
  static late Map<String, String> languageMap;

  //initilizate sharedpreference
  static Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  //function to get a string
  static String getString(SharedPrefKeys key) {
    return sharedPreferences.getString(key.name) ?? "en";
  }

  //function to store a string
  static Future<bool> setString(SharedPrefKeys key, String value) async {
    return await sharedPreferences.setString(key.name, value);
  }

  //function to get a string
  static bool getBoolean(SharedPrefKeys key) {
    return sharedPreferences.getBool(key.name) ?? false;
  }

  //function to store a string
  static Future<bool> setBool(SharedPrefKeys key, bool value) async {
    return await sharedPreferences.setBool(key.name, value);
  }

  static dynamic getModelData(SharedPrefKeys key, Function fromMap) {
    try {
      if (sharedPreferences.getString(key.name) == null) return null;
      var data =
          jsonDecode(json.encode(sharedPreferences.getString(key.name) ?? ""));
      return data != "" ? fromMap(data) : null;
    } catch (e) {}
    try {
      if (sharedPreferences.getString(key.name) == null) return null;
      var data = jsonDecode((sharedPreferences.getString(key.name) ?? ""));
      return data != "" ? fromMap(data) : null;
    } catch (e) {}

    if (sharedPreferences.getString(key.name) == null) return null;
    var data =
        (sharedPreferences.getString(key.name) ?? "") as Map<String, dynamic>;
    return data != {} ? fromMap(data) : null;
  }

  //SETTING USER DETAILS
  static Future<void> setModelData(dynamic model,SharedPrefKeys key) async {
    await sharedPreferences.setString(
        key.name, jsonEncode(model.toMap()).toString());
  }
}

enum SharedPrefKeys {
  languageKey,
  userLoggedIn,
  authTokenKey,
  refreshToken,
  notification,
  pushToken,
  userDetails,
  farmerDetails,
  isTokenSent,
  isUserProfileCompleted
}
