// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfileRequestImpl _$$ProfileRequestImplFromJson(Map<String, dynamic> json) =>
    _$ProfileRequestImpl();

Map<String, dynamic> _$$ProfileRequestImplToJson(
        _$ProfileRequestImpl instance) =>
    <String, dynamic>{};

_$ProfileUpdateRequestImpl _$$ProfileUpdateRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$ProfileUpdateRequestImpl(
      firstName: json['firstName'] as String,
      secondName: json['secondName'] as String,
      email: json['email'] as String,
      contact: json['contact'] as String,
      isExecutor: json['isExecutor'] as bool?,
      executor: _$JsonConverterFromJson<Map<String, dynamic>, Executor>(
          json['executor'], const ExecutorConverter().fromJson),
    );

Map<String, dynamic> _$$ProfileUpdateRequestImplToJson(
    _$ProfileUpdateRequestImpl instance) {
  final val = <String, dynamic>{
    'firstName': instance.firstName,
    'secondName': instance.secondName,
    'email': instance.email,
    'contact': instance.contact,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('isExecutor', instance.isExecutor);
  writeNotNull(
      'executor',
      _$JsonConverterToJson<Map<String, dynamic>, Executor>(
          instance.executor, const ExecutorConverter().toJson));
  return val;
}

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
