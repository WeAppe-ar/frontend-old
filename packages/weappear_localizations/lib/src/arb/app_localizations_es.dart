import 'app_localizations.dart';

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get counterAppBarTitle => 'Contador';

  @override
  String get loginTitle => 'Entra a tu cuenta';

  @override
  String get invalidCode => 'Código inválido';

  @override
  String get invalidCodeSubtitle => 'El código no es válido, por favor, intentalo nuevamente para que podamos validar tu sesión.';

  @override
  String get accept => 'Aceptar';

  @override
  String get timeOut => '¡Tiempo agotado!';

  @override
  String get timeOutSubtitle => 'Ha finalizado el tiempo predeterminado de este código, por favor, genera uno nuevo para que podamos validar tu sesión.';

  @override
  String get signOff => 'Cerrar sesión';

  @override
  String get signOffSubtitle => '¿Estás seguro que quieres cerrar sesión?';

  @override
  String get cancel => 'Cancelar';

  @override
  String get youHaveToCompleteThisField => 'tienes que completar este campo';

  @override
  String get invalidMail => 'Mail invalido';

  @override
  String get signIn => 'Iniciar Sesión';

  @override
  String get password => 'Constraseña';

  @override
  String get forgotYourPassword => '¿Olvidaste tu constraseña?';

  @override
  String get register => 'Regístrate';

  @override
  String get dontHaveAnAccount => '¿No tienes cuenta?';

  @override
  String get email => 'Correo Electrónico';

  @override
  String get onboarding0 => '¡Contabilizá las horas trabajadas en tus proyectos!';

  @override
  String get onboarding1 => '¡Crea un proyecto e invitá a otros a participar!';

  @override
  String get onboarding2 => 'Unite a un proyecto y empieza a registrar tus horas';

  @override
  String get next => 'Siguiente';

  @override
  String get skip => 'Omitir';

  @override
  String get invalidCredentials => 'Credenciales inválidas';
}
