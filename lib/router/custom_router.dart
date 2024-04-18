import 'package:flutter/material.dart';
import 'package:ninjatrader_interview/pages/home_page.dart';

class CustomRouter {
  static Route<dynamic> generatedRoute(RouteSettings settings) {
    switch (settings.name) {
      default:
        return MaterialPageRoute(builder: (_) => const HomePage());
    }
  }
}
