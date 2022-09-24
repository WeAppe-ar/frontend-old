


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
}
