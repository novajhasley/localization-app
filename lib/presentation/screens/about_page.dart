import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ninjatrader_interview/presentation/utils/translation.dart';
import 'package:ninjatrader_interview/presentation/widgets/background_image.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          //BACKGROUND IMAGE
          BackgroundImage(),
          //CONTENT
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: ListView(
              children: [
                Text(
                  translation(context).aboutApp,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  translation(context).appDescription,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  translation(context).thePrompt,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  translation(context).promptDescription,
                  style: TextStyle(
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
