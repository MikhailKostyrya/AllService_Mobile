// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_refresh_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TokenRefreshRequestImpl _$$TokenRefreshRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$TokenRefreshRequestImpl(
      refresh: json['refresh'] as String?,
    );

Map<String, dynamic> _$$TokenRefreshRequestImplToJson(
    _$TokenRefreshRequestImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('refresh', instance.refresh);
  return val;
}
