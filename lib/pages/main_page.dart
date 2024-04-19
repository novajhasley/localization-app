import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:ninjatrader_interview/pages/about_page.dart';
import 'package:ninjatrader_interview/pages/home_page.dart';
import 'package:ninjatrader_interview/pages/settings_page.dart';
import 'package:ninjatrader_interview/pages/side_menu.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 1;
  final _pages = [const AboutPage(), const HomePage(), const SettingsPage()];
  final _drawerController = ZoomDrawerController();



  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      controller: _drawerController,
      borderRadius: 50,
      angle: 0.0,
      openCurve: Curves.fastOutSlowIn,
      mainScreenTapClose: true,
      duration: const Duration(milliseconds: 500),
      menuScreenTapClose: true,
      menuScreen: const SideMenu(),
      mainScreen: Scaffold(
        body: _pages[_selectedIndex],
        bottomNavigationBar: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: BottomNavigationBar(
              backgroundColor: Colors.white.withOpacity(0.7),
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.info),
                  label: 'About',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: 'Settings',
                ),
              ],
              currentIndex: _selectedIndex,
              selectedItemColor: Colors.amber[800],
              onTap: (index) {
                if (_selectedIndex != index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                  if (_selectedIndex == 2) {
                    _drawerController.toggle!();
                  }
                }
              },
              showSelectedLabels:
                  false, // Do not show labels for selected items
              showUnselectedLabels:
                  false, // Do not show labels for unselected items
            ),
          ),
        ),
      ),
    );
  }
}
