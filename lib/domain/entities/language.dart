import 'package:flutter/material.dart';
import 'package:ninjatrader_interview/presentation/utils/translation.dart';

class Language {
  final int id;
  final String name;
  final String languageCode;
  final String localizedName;

  Language(this.id, this.name, this.languageCode, this.localizedName);

  static List<Language> languageList(BuildContext context) {
    return <Language>[
      Language(1, "English", "en", translation(context).english),
      Language(2, "Spanish", "es", translation(context).spanish),
    ];
  }
}
