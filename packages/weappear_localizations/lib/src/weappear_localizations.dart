// ignore_for_file: public_member_api_docs

import 'package:weappear_localizations/src/arb/app_localizations.dart';
import 'package:flutter/widgets.dart';

extension AppLocalizationsX on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}
