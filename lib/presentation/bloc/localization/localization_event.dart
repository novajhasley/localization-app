import 'package:flutter/material.dart';

abstract class LocalizationEvent {}

class SetLocale extends LocalizationEvent {
  final Locale locale;

  SetLocale(this.locale);
}
