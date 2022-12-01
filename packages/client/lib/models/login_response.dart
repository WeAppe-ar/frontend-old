import 'package:weappear_backend/weappear.dart';

/// {@template login_response}
/// The response we get from the login endpoint.
/// {@endtemplate}
class LoginResponse {
  /// {@macro login_response}
  const LoginResponse({
    required this.refreshToken,
    required this.accessToken,
    required this.user,
  });

  /// Creates a new instance of the [LoginResponse] class from a [Map].
  factory LoginResponse.fromMap(Map<String, dynamic> map) {
    return LoginResponse(
      refreshToken: map['refreshToken'] as String,
      accessToken: map['accessToken'] as String,
      user: User.fromJson((map['user'] as Map).cast<String, dynamic>()),
    );
  }

  /// The refresh token.
  final String refreshToken;

  /// The access token.
  final String accessToken;

  /// The user.
  final User user;
}
