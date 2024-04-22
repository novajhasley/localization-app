import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ninjatrader_interview/presentation/bloc/theme/theme_bloc.dart';
import 'package:ninjatrader_interview/presentation/bloc/theme/theme_event.dart';
import 'package:ninjatrader_interview/presentation/bloc/theme/theme_state.dart';
import 'package:ninjatrader_interview/presentation/utils/translation.dart';
import 'package:ninjatrader_interview/presentation/widgets/background_image.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    final List<String> content = [
      translation(context).aboutMe,
      translation(context).technicalProficiency,
      translation(context).languages,
      translation(context).databases,
      translation(context).toolsTechnologies,
      translation(context).dataAnalysis,
      translation(context).projectManagement,
      translation(context).contact,
    ];

    return Stack(
      children: [
        //BACKGROUND IMAGE
        BackgroundImage(),
        //CONTENT
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: ListView(
            children: <Widget>[
              const ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/nova_hasley.jpg'),
                ),
                title: Text(
                  'Nova Hasley',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('${translation(context).theme}:',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(translation(context).light),
                      Switch(
                        value: (context.watch<ThemeBloc>().state
                            is ThemeDarkState),
                        onChanged: (value) {
                          context.read<ThemeBloc>().add(
                              value ? ThemeDarkEvent() : ThemeLightEvent());
                        },
                      ),
                      Text(translation(context).dark),
                    ],
                  ),
                ],
              ),
              const Divider(),
              ...content.map((text) => Text(
                    text,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  )),
            ],
          ),
        ),
      ],
    );
  }
}
