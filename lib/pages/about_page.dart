import 'dart:ui';

import 'package:flutter/material.dart';

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
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50),
                Text(
                  'About the App',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black.withOpacity(.7)),
                ),
                const SizedBox(height: 20),
                const Text(
                  'This app was created to showcase the following prompt. I hope you find it enjoyable. I had a great time developing it.',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                const SizedBox(height: 30),
                Text(
                  'The Prompt',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black.withOpacity(.7)),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Please create a simple Flutter mobile application that demonstrates the Flutter localization functionality. It should be just one welcome screen with the label “Hello, user!” and a dropdown with two languages - “English” and “Spanish”. Switching the language should apply the selected language to the app.',
                  style: TextStyle(
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                      color: Colors.black),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
