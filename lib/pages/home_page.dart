import 'package:flutter/material.dart';
import 'package:ninjatrader_interview/classes/language.dart';
import 'package:ninjatrader_interview/classes/language_constants.dart';
import 'package:ninjatrader_interview/main.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(translation(context).homePage),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton<Language>(
              underline: const SizedBox(),
              icon: const Icon(
                Icons.language,
                color: Colors.white,
              ),
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
            ),
          ),
        ],
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            translation(context).helloUser,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          DropdownButton<Language>(
            iconSize: 30,
            hint: Text(translation(context).changeLanguage),
            onChanged: (Language? language) async {
              if (language != null) {
                Locale locale0 = await setLocale(language.languageCode);
                MyApp.setLocale(context, locale0);
              }
            },
            items: Language.languageList()
                .map<DropdownMenuItem<Language>>(
                  (langugage) => DropdownMenuItem<Language>(
                    value: langugage,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text(
                          langugage.flag,
                          style: const TextStyle(fontSize: 30),
                        ),
                        Text(langugage.name)
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      )),
    );
  }
}
