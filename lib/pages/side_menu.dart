import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:ninjatrader_interview/classes/language.dart';
import 'package:ninjatrader_interview/classes/language_constants.dart';
import 'package:ninjatrader_interview/main.dart';

class SideMenu extends StatefulWidget {
  final ZoomDrawerController drawerController;

  const SideMenu({super.key, required this.drawerController});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
          child: Row(
            children: [
              const SizedBox(width: 8),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Current Language",
                    style: TextStyle(
                        color: Colors.white, fontSize: 17, fontFamily: "Inter"),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    "English",
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.7),
                        fontSize: 15,
                        fontFamily: "Inter"),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: ListView.builder(
                      itemCount: Language.languageList().length,
                      itemBuilder: (context, index) {
                        var language = Language.languageList()[index];
                        return ListTile(
                          onTap: () async {
                            Locale locale =
                                await setLocale(language.languageCode);
                            MyApp.setLocale(context, locale);
                            widget.drawerController.toggle!();
                          },
                          title: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Text(
                                language.flag,
                                style: const TextStyle(fontSize: 30),
                              ),
                              Text(language.name)
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
