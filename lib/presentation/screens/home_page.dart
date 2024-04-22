import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:ninjatrader_interview/presentation/utils/translation.dart';
import 'package:ninjatrader_interview/presentation/widgets/background_image.dart';

class HomePage extends StatefulWidget {
  final ZoomDrawerController drawerController;

  const HomePage({super.key, required this.drawerController});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading:
            false, // This line prevents the back button from being shown
      ),
      body: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            //BACKGROUND IMAGE
            BackgroundImage(),
            //CONTENT
            Positioned(
              left: 20,
              top: 80,
              child: Text(
                translation(context).helloUser,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
              ),
            ),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(.5), 
                  borderRadius:
                      BorderRadius.circular(30), 
                ),
                child: TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20), 
                  ),
                  onPressed: () => widget.drawerController.toggle!(),
                  child: Text(
                    translation(context).changeLanguage,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
