import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ninjatrader_interview/domain/entities/locale.dart';

class LocaleLocalDataSource {
  Future<Locale> setLocale(String languageCode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(languageCodeString, languageCode);
    return locale(languageCode);
  }

  Future<Locale> getLocale() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String languageCode = prefs.getString(languageCodeString) ?? english;
    return locale(languageCode);
  }
}
