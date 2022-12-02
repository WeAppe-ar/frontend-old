import 'dart:developer';

import 'package:client/models/models.dart';
import 'package:http_handler/http_handler.dart';
import 'package:weappear_backend/weappear.dart';

/// {@template client}
/// The client in which we make all the requests to the server.
/// {@endtemplate}
class Client {
  /// {@macro client}
  Client({
    String? token,
    required this.authority,
  }) : _token = token;

  /// The token used to authenticate the user.
  final String? _token;

  /// The authority of the server.
  final String authority;

  /// The handler for the requests.
  final http = HttpHandler();

  /// This method is used to log in into the app.
  Future<LoginResponse?> login({
    required String email,
    required String password,
  }) async {
    final uri = Uri.http(authority, '/users/login');
    Map<String, dynamic> response;

    try {
      response = await http.httpPost<JSON>(
        uri,
        body: <String, dynamic>{
          'email': email,
          'password': password,
        },
      );
    } catch (e) {
      log('Error while making the request: ${e.toString()}');
      return null;
    }
    try {
      return LoginResponse.fromMap(response);
    } catch (e) {
      log('Error while parsing the response: ${e.toString()}');
      return null;
    }
  }

  /// This method is used to register into the app.
  Future<User?> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    final uri = Uri.http(authority, '/users/register');
    Map<String, dynamic> response;

    try {
      response = await http.httpPost<JSON>(
        uri,
        body: <String, dynamic>{
          'firstName': firstName,
          'lastName': lastName,
          'email': email,
          'password': password,
        },
      );
    } catch (e) {
      log('Error while making the request: ${e.toString()}');
      return null;
    }
    try {
      return User.fromJson(response);
    } catch (e) {
      log('Error while parsing the response: ${e.toString()}');
      return null;
    }
  }
}
