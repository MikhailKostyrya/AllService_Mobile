// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_login_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserLoginRequestImpl _$$UserLoginRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$UserLoginRequestImpl(
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$$UserLoginRequestImplToJson(
        _$UserLoginRequestImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };
