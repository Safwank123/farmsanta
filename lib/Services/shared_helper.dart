import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Core/shared_pref.dart';
import '../Models/Common/language.dart';
import '../Widgets/Widgets/custom_text.dart';

class SharedHelper {
  static late Locale locale;
  static late Map<String, dynamic> languageMap;
  static String authToken = ""; //TODO
  static List<LanguageModel> languages = [];
  static int languageId = 1;

  //initizalize required field
  static init() async {
    await SharedPref.init();

    //fetching language from local shared data
    String code = SharedPref.getString(SharedPrefKeys.languageKey);
    locale = Locale(code);
    await loadMap();
  }

  //get selected language code
  static int getSelectedLanguage() {
    return languages
        .indexWhere((element) => element.lang == locale.languageCode);
  }

  //set language received from backend
  static setLanguage(List<LanguageModel> langs) {
    languages = langs;
    languageId = langs[getSelectedLanguage()].id;
  }

  //function to change language
  static changeLanguage(int index) async {
    String code = languages[index].lang;
    locale = Locale(code);
    await loadMap();
    SharedPref.setString(SharedPrefKeys.languageKey, code);
    languageId = languages[index].id;
  }

  //get language map
  static loadMap() async {
    String jsondata = await rootBundle
        .loadString('assets/language/${locale.languageCode}.json');
    languageMap = jsonDecode(jsondata) as Map<String, dynamic>;
  }

  static String getTranslatedText(String key) {
    return languageMap[key] ?? key;
  }
}
