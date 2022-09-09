import 'package:auth_repository/src/models/token_response_model.dart';
import 'package:http_handler/http_handler.dart';
import 'package:meta/meta.dart';

/// {@template AuthRepository}
/// A Dart class which exposes methods to implement authentication
/// functionality.
/// {@endtemplate}
class AuthRepository {
  /// {@macro auth_repository}
  AuthRepository(
    String? token,
  ) : _httpClient = HttpHandler(token: token);

  /// The host URL used for all API requests.
  ///
  /// Only exposed for testing purposes. Do not use directly.
  @visibleForTesting
  static const authority = 'dev.weappe.ar';

  final HttpHandler _httpClient;

  /// Returns the Login Credentials ([LoginResponse]).
  ///
  Future<LoginResponse> login(String email, String password) async {
    final uri = Uri.https(authority, '/user/login');
    final body = <String, String>{
      'email': email,
      'password': password,
    };
    final response = await _httpClient.httpPost<JSON>(uri, body: body);
    return LoginResponse.fromJson(response);
  }
}
