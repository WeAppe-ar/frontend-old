import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(explicitToJson: true)

/// A class representing a user.
class User {
  /// Constructor of the [User] class.
  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    this.country,
    this.city,
    this.photo,
  }) : super();

  /// Serializer to JSON.
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  /// Id of the user.
  String id;

  /// First name of the user.
  String firstName;

  /// Last name of the user.
  String lastName;

  /// Email of the user.
  String email;

  /// Country of the user.
  String? country;

  /// City of the user.
  String? city;

  /// Photo of the user.
  String? photo;

  /// Helper to JSON.
  Map<String, dynamic> toJson({bool showPassword = true}) =>
      _$UserToJson(this, showPassword);

  /// Helper from Json.
  User fromJson(Map<String, dynamic> json) => User.fromJson(json);
}
