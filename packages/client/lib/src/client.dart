import 'dart:developer';

import 'package:client/models/meta_paginated_response.dart';
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
  }) : http = HttpHandler(token: token);

  /// The authority of the server.
  final String authority;

  /// The handler for the requests.
  late HttpHandler http;

  /// This method is used to log in into the app.
  Future<LoginResponse?> login({
    required String email,
    required String password,
  }) async {
    final uri = Uri.http(authority, '/users/login');

    return http.httpPost<LoginResponse>(
      uri,
      body: <String, dynamic>{
        'email': email,
        'password': password,
      },
      parser: LoginResponse.fromMap,
    );
  }

  /// This method is used to register into the app.
  Future<User?> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    final uri = Uri.http(authority, '/users/register');

    return http.httpPost<User>(
      uri,
      body: <String, dynamic>{
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'password': password,
      },
      parser: User.fromJson,
    );
  }

  /// This method is used to register into the app.
  Future<MetaPaginated<Record>?> getRecords(String organizationId) async {
    final uri = Uri.http(authority, '/records', <String, String>{
      'organizationId': organizationId,
    });

    return http.httpGet<MetaPaginated<Record>>(
      uri,
      parser: (map) => MetaPaginated<Record>.fromJson(
        map,
        itemConstructor: Record.fromJson,
      ),
    );
  }
}
