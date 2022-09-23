import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get counterAppBarTitle => 'Counter';

  @override
  String get loginTitle => 'Log in to your account';

  @override
  String get invalidCode => 'Invalid code!';

  @override
  String get invalidCodeSubtitle => 'The code is invalid, please try again so we can validate your session.';

  @override
  String get accept => 'Accept';

  @override
  String get timeOut => 'Time out!';

  @override
  String get timeOutSubtitle => 'The default time of this code has expired, please generate a new one so that we can validate your session.';

  @override
  String get signOff => 'Sign off';

  @override
  String get signOffSubtitle => 'Are you sure you want to log out?';

  @override
  String get cancel => 'Cancel';
}
