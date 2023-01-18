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

  @override
  String get youHaveToCompleteThisField => 'You have to complete this field';

  @override
  String get invalidMail => 'Invalid mail';

  @override
  String get invalidPassword => 'Invalid password';

  @override
  String get signIn => 'Sign In';

  @override
  String get password => 'Password';

  @override
  String get forgotYourPassword => 'Forgot your password?';

  @override
  String get register => 'Register';

  @override
  String get dontHaveAnAccount => 'Don\'t have an account?';

  @override
  String get email => 'Email';

  @override
  String get onboarding0 => 'Count the hours worked on your projects!';

  @override
  String get onboarding1 => 'Create a project and invite others to participate!';

  @override
  String get onboarding2 => 'Join a project and start recording your hours';

  @override
  String get next => 'Next';

  @override
  String get skip => 'Skip';

  @override
  String get invalidCredentials => 'Invalid credentials';

  @override
  String get verificationCode => 'Verification code';

  @override
  String get send => 'Send';

  @override
  String get alreadyHaveAnAccount => 'Already have an account?';

  @override
  String get firstName => 'First Name';

  @override
  String get lastName => 'Last Name';

  @override
  String get finishRegister => 'Finish Register';

  @override
  String get nameTooLong => 'Name too long';

  @override
  String get userRegisteredSuccessfully => 'User registered successfully';

  @override
  String get home => 'Home';

  @override
  String get proyects => 'Proyects';

  @override
  String get homeText => 'Welcome to Weappe.ar! Start using the functions of our app';
}
