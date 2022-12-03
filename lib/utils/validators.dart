import 'package:client/client.dart';
import 'package:flutter/material.dart';
import 'package:weappear_localizations/weappear_localizations.dart';

/// Provides mail validation
String? validateEmail(String? value, BuildContext context) {
  if (value == null || value.isEmpty) {
    return context.l10n.youHaveToCompleteThisField;
  }

  final _value = value.trim();

  if (!Validators.emailRegExp.hasMatch(_value)) {
    return context.l10n.invalidMail;
  }
  return null;
}

/// Provides mail validation
String? validatePassword(String? value, BuildContext context) {
  if (value == null || value.isEmpty) {
    return context.l10n.youHaveToCompleteThisField;
  }

  if (!Validators.passwordRegExp.hasMatch(value)) {
    return context.l10n.invalidPassword;
  }
  return null;
}
