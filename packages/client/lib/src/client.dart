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

  /// This method is used to send the OTP code to the user email.
  Future<bool?> register(String email) async {
    final uri = Uri.http(authority, '/users/register');

    return http.boolPost(
      uri,
      body: <String, dynamic>{
        'email': email,
      },
    );
  }

  /// This method is used to verify the user's email.
  Future<UserActivation?> verifyEmail({
    required String email,
    required String code,
  }) async {
    final uri = Uri.http(authority, '/users/verify-email');

    return http.httpPost<UserActivation>(
      uri,
      body: <String, dynamic>{
        'email': email,
        'activationCode': code,
      },
      parser: UserActivation.fromJson,
    );
  }

  /// This method is used to register into the app.
  Future<MetaPaginated<Record>?> getRecords(String organizationId) async {
    final uri = Uri.http(authority, '/records', <String, String>{
      'organizationId': organizationId,
    });

    return http.httpGet<MetaPaginated<Record>>(
      uri,
      parser: (map) => MetaPaginated<Record>.fromMap(
        map,
        itemConstructor: Record.fromJson,
      ),
    );
  }

  Future<Record?> clockIn({
    required String organizationId,
  }) async {
    final uri = Uri.http(authority, '/records/clokIn');

    return http.httpPost<Record>(
      uri,
      body: <String, dynamic>{
        'organizationId': organizationId,
      },
      parser: Record.fromJson,
    );
  }

  Future<Record?> clockOut({
    required String organizationId,
  }) async {
    final uri = Uri.http(authority, '/records/clokOut');

    return http.httpPost<Record>(
      uri,
      body: <String, dynamic>{
        'organizationId': organizationId,
      },
      parser: Record.fromJson,
    );
  }

  Future<Organization?> createOrganization({
    required String name,
    required String color,
  }) async {
    final uri = Uri.http(authority, '/organizations');
    return http.httpPost<Organization>(
      uri,
      body: <String, dynamic>{
        'name': name,
        'color': color,
      },
      parser: Organization.fromJson,
    );
  }
}
