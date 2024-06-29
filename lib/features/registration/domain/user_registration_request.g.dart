// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_registration_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserRegistrationRequestImpl _$$UserRegistrationRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$UserRegistrationRequestImpl(
      email: json['email'] as String,
      password: json['password'] as String,
      firstName: json['first_name'] as String,
      secondName: json['second_name'] as String,
    );

Map<String, dynamic> _$$UserRegistrationRequestImplToJson(
        _$UserRegistrationRequestImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'first_name': instance.firstName,
      'second_name': instance.secondName,
    };
