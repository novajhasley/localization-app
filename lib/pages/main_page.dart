import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ninjatrader_interview/pages/about_page.dart';
import 'package:ninjatrader_interview/pages/home_page.dart';
import 'package:ninjatrader_interview/pages/settings_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 1;
  final _pages = [const AboutPage(), const HomePage(), const SettingsPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                icon: Icon(Icons.more_horiz),
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
              }
            },
            showSelectedLabels: false, // Do not show labels for selected items
            showUnselectedLabels:
                false, // Do not show labels for unselected items
          ),
        ),
      ),
    );
  }
}
