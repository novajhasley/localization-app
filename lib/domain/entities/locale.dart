import 'package:flutter/material.dart';

const String languageCodeString = 'languageCode';

//languages code
const String english = 'en';
const String spanish = 'es';

Locale locale(String languageCode) {
  switch (languageCode) {
    case english:
      return const Locale(english, '');
    case spanish:
      return const Locale(spanish, '');
    default:
      return const Locale(english, '');
  }
}