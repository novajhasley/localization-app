import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ninjatrader_interview/presentation/utils/translation.dart';

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
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50),
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
                    fontSize: 20,
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
