import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:ninjatrader_interview/presentation/bloc/localization/localization_bloc.dart';
import 'package:ninjatrader_interview/presentation/bloc/localization/localization_event.dart';
import 'package:ninjatrader_interview/domain/entities/language.dart';
import 'package:ninjatrader_interview/presentation/utils/translation.dart';

class SideMenu extends StatefulWidget {
  final ZoomDrawerController drawerController;

  const SideMenu({super.key, required this.drawerController});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    String selectedLanguage = Localizations.localeOf(context).languageCode;

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
                      itemCount: Language.languageList().length,
                      itemBuilder: (context, index) {
                        var language = Language.languageList()[index];
                        return Column(
                          children: [
                            //LANGUAGE BUTTON
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedLanguage = language.languageCode;
                                });
                                BlocProvider.of<LocalizationBloc>(context).add(
                                    SetLocale(Locale(language.languageCode)));
                                widget.drawerController.toggle!();
                              },
                              child: Container(
                                margin: const EdgeInsets.symmetric(vertical: 5),
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color:
                                      selectedLanguage == language.languageCode
                                          ? Colors.blue
                                          : Colors.transparent,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  children: <Widget>[
                                    const Icon(
                                        IconData(0xf017b,
                                            fontFamily: 'MaterialIcons'),
                                        color: Colors.white),
                                    const SizedBox(width: 10),
                                    Text(language.name,
                                        style: const TextStyle(
                                            fontSize: 15,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600)),
                                  ],
                                ),
                              ),
                            ),
                            //DIVIDER
                            if (index !=
                                Language.languageList().length -
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
