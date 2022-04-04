import 'package:auth_repository/src/models/user_model.dart';
import 'package:equatable/equatable.dart';

/// A class representing a login response.
class LoginResponse extends Equatable {
  /// Constructor of the [LoginResponse] class.
  const LoginResponse({
    this.user,
    this.accessToken,
    this.refreshToken,
  });

  /// [LoginResponse] from JSON.
  factory LoginResponse.fromJson(Map<String, dynamic> map) {
    return LoginResponse(
      user: User.fromJson(map['user'] as Map<String, dynamic>),
      accessToken: map['accessToken'] as String?,
      refreshToken: map['refreshToken'] as String?,
    );
  }

  /// The user.
  final User? user;

  /// The access token.
  final String? accessToken;

  /// The refresh token.
  final String? refreshToken;

  @override
  List<Object?> get props => [user, accessToken, refreshToken];
}
