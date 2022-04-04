// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['_id'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String,
      country: json['country'] as String?,
      city: json['city'] as String?,
      photo: json['photo'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance, [bool showPassword = true]) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('_id', instance.id);
  writeNotNull('firstName', instance.firstName);
  writeNotNull('lastName', instance.lastName);
  writeNotNull('email', instance.email);
  writeNotNull('country', instance.country);
  writeNotNull('city', instance.city);
  writeNotNull('photo', instance.photo);
  return val;
}
