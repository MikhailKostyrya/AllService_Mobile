// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jwt_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$JwtResponseImpl _$$JwtResponseImplFromJson(Map<String, dynamic> json) =>
    _$JwtResponseImpl(
      access: json['access'] as String,
      refresh: json['refresh'] as String,
    );

Map<String, dynamic> _$$JwtResponseImplToJson(_$JwtResponseImpl instance) =>
    <String, dynamic>{
      'access': instance.access,
      'refresh': instance.refresh,
    };
