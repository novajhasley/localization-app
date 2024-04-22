import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ninjatrader_interview/presentation/bloc/theme/theme_bloc.dart';
import 'package:ninjatrader_interview/presentation/bloc/theme/theme_event.dart';
import 'package:ninjatrader_interview/presentation/bloc/theme/theme_state.dart';
import 'package:ninjatrader_interview/presentation/utils/translation.dart';

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
        ImageFiltered(
          imageFilter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
          child: Center(
            child: OverflowBox(
              maxWidth: double.infinity,
              child: Transform.translate(
                offset: const Offset(200, 100),
                child: Image.asset('assets/images/backgrounds/zigzag.png',
                    fit: BoxFit.cover),
              ),
            ),
          ),
        ),
        //CONTENT
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: <Widget>[
              const ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(
                      'assets/your_picture.png'), // TODO: Replace with your picture
                ),
                title: Text(
                  'Nova Hasley',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ), // TODO: Replace with your name
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
                      Text(translation(context).dark),
                      Switch(
                        value: (context.watch<ThemeBloc>().state
                            is ThemeDarkState),
                        onChanged: (value) {
                          context.read<ThemeBloc>().add(
                              value ? ThemeDarkEvent() : ThemeLightEvent());
                        },
                      ),
                      Text(translation(context).light),
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
