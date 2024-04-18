import 'package:flutter/material.dart';
import 'package:ninjatrader_interview/classes/language.dart';
import 'package:ninjatrader_interview/classes/language_constants.dart';
import 'package:ninjatrader_interview/main.dart';

class LanguageDropDownMenu extends StatelessWidget {
  const LanguageDropDownMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: DropdownButton<Language>(
      iconSize: 30,
      hint: Text(translation(context).changeLanguage),
      onChanged: (Language? language) async {
        if (language != null) {
          Locale locale = await setLocale(language.languageCode);
          MyApp.setLocale(context, locale);
        }
      },
      items: Language.languageList()
          .map<DropdownMenuItem<Language>>(
            (e) => DropdownMenuItem<Language>(
              value: e,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    e.flag,
                    style: const TextStyle(fontSize: 30),
                  ),
                  Text(e.name)
                ],
              ),
            ),
          )
          .toList(),
    ));
  }
}
