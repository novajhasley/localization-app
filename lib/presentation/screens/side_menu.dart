import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:ninjatrader_interview/domain/entities/language.dart';
import 'package:ninjatrader_interview/presentation/utils/translation.dart';
import 'package:ninjatrader_interview/presentation/widgets/language_button.dart';

class SideMenu extends StatelessWidget {
  final ZoomDrawerController drawerController;

  const SideMenu({super.key, required this.drawerController});

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
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Wrap(
                      children: [
                        Text(
                          "${translation(context).languagePreference}:",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontFamily: "Inter",
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.4,
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: ListView.builder(
                      itemCount: Language.languageList(context).length,
                      itemBuilder: (context, index) {
                        var language = Language.languageList(context)[index];
                        return Column(
                          children: [
                            //LANGUAGE BUTTON
                            LanguageButton(
                              language: language,
                            ),
                            //DIVIDER
                            if (index !=
                                Language.languageList(context).length -
                                    1) // Check if it's not the last index
                              Divider(
                                color: Colors.white.withOpacity(.6),
                                thickness: 0.5,
                              ),
                          ],
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
