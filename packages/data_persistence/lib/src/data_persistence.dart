import 'dart:io';
import 'package:hive_flutter/hive_flutter.dart';

/// A class that uses [Hive] for storing and retrieving data.
class DataPersistenceRepository {
  /// The method that initializes the [Hive] instance.
  Future<void> init({bool test = false, String? testFileName}) async {
    if (test) {
      try {
        await Directory.systemTemp.delete();
      } catch (_) {}
      Hive.init(
        '${Directory.systemTemp.path}/${testFileName?.replaceAll('.', '_')}',
      );
    } else {
      await Hive.initFlutter();
    }

    await Future.wait([
      Hive.openBox<dynamic>(DataPersistenceRepository.appSettingsKey),
      Hive.openBox<dynamic>(DataPersistenceRepository.authenticationKey),
    ]);
  }

  /// Get the App Settings box.
  Box<dynamic> get appSettings => Hive.box<dynamic>(appSettingsKey);

  /// Get the Authentication box.
  Box<dynamic> get authentication => Hive.box<dynamic>(authenticationKey);

  /// Get the latest saved token.
  String? get getAccessToken => authentication.get(BoxKeys.accessToken) as String?;

  /// Create a new access token after it's expired.
  String? get getRefreshToken => authentication.get(BoxKeys.refreshToken) as String?;

  /// Get the user First Name.
  String? get getFirstName => authentication.get(BoxKeys.firstName) as String?;

  /// Get the user Last Name.
  String? get getLastName => authentication.get(BoxKeys.lastName) as String?;

  /// Get the latest saved user id.
  String? get getUserId => authentication.get(BoxKeys.userId) as String?;

  /// Set the access token.
  Future<dynamic> setAccessToken(String? value) async => authentication.put(BoxKeys.accessToken, value);

  /// Set the refresh token.
  Future<dynamic> setRefreshToken(String? value) async => authentication.put(BoxKeys.refreshToken, value);

  /// Set the user First Name.
  Future<dynamic> setFirstName(String? value) async => authentication.put(BoxKeys.firstName, value);

  /// Set the user Last Name.
  Future<dynamic> setLastName(String? value) async => authentication.put(BoxKeys.lastName, value);

  /// Set the user id.
  Future<dynamic> setUserId(String? value) async => authentication.put(BoxKeys.userId, value);

  /// Deletes all the saved information in the [authentication] - [Box].
  Future<void> logout() async => authentication.clear();

  /// Clears all the saved information.
  Future<void> deleteAll() async {
    await Future.wait([
      appSettings.clear(),
      authentication.clear(),
    ]);
  }

  /// Key for the [appSettings] - [Box].
  static const appSettingsKey = 'settings';

  /// Key for the [authentication] - [Box].
  static const authenticationKey = 'authentication';
}

/// A class that contains the keys for the [DataPersistenceRepository] - [Box].
class BoxKeys {
  /// Key for the token.
  static const accessToken = 'accessToken';

  /// Key for the token.
  static const refreshToken = 'refreshToken';

  /// Key for the user id.
  static const userId = 'userId';

  /// Key for the firstName.
  static const firstName = 'firstName';

  /// Key for the lastName.
  static const lastName = 'lastName';
}
