import 'package:flutter/material.dart';

abstract class LocalizationState {}

class LocaleUpdated extends LocalizationState {
  final Locale locale;

  LocaleUpdated(this.locale);
}
