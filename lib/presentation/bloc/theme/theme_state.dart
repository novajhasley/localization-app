import 'package:flutter/material.dart';

abstract class ThemeState {
  ThemeData get themeData;
}

class ThemeLightState extends ThemeState {
  @override
  ThemeData get themeData => ThemeData.light();
}

class ThemeDarkState extends ThemeState {
  @override
  ThemeData get themeData => ThemeData.dark();
}
