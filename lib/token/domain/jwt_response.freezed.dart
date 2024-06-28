// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'jwt_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

JwtResponse _$JwtResponseFromJson(Map<String, dynamic> json) {
  return _JwtResponse.fromJson(json);
}

/// @nodoc
mixin _$JwtResponse {
  String get access => throw _privateConstructorUsedError;
  String get refresh => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $JwtResponseCopyWith<JwtResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JwtResponseCopyWith<$Res> {
  factory $JwtResponseCopyWith(
          JwtResponse value, $Res Function(JwtResponse) then) =
      _$JwtResponseCopyWithImpl<$Res, JwtResponse>;
  @useResult
  $Res call({String access, String refresh});
}

/// @nodoc
class _$JwtResponseCopyWithImpl<$Res, $Val extends JwtResponse>
    implements $JwtResponseCopyWith<$Res> {
  _$JwtResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? access = null,
    Object? refresh = null,
  }) {
    return _then(_value.copyWith(
      access: null == access
          ? _value.access
          : access // ignore: cast_nullable_to_non_nullable
              as String,
      refresh: null == refresh
          ? _value.refresh
          : refresh // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$JwtResponseImplCopyWith<$Res>
    implements $JwtResponseCopyWith<$Res> {
  factory _$$JwtResponseImplCopyWith(
          _$JwtResponseImpl value, $Res Function(_$JwtResponseImpl) then) =
      __$$JwtResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String access, String refresh});
}

/// @nodoc
class __$$JwtResponseImplCopyWithImpl<$Res>
    extends _$JwtResponseCopyWithImpl<$Res, _$JwtResponseImpl>
    implements _$$JwtResponseImplCopyWith<$Res> {
  __$$JwtResponseImplCopyWithImpl(
      _$JwtResponseImpl _value, $Res Function(_$JwtResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? access = null,
    Object? refresh = null,
  }) {
    return _then(_$JwtResponseImpl(
      access: null == access
          ? _value.access
          : access // ignore: cast_nullable_to_non_nullable
              as String,
      refresh: null == refresh
          ? _value.refresh
          : refresh // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class _$JwtResponseImpl implements _JwtResponse {
  const _$JwtResponseImpl({required this.access, required this.refresh});

  factory _$JwtResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$JwtResponseImplFromJson(json);

  @override
  final String access;
  @override
  final String refresh;

  @override
  String toString() {
    return 'JwtResponse(access: $access, refresh: $refresh)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JwtResponseImpl &&
            (identical(other.access, access) || other.access == access) &&
            (identical(other.refresh, refresh) || other.refresh == refresh));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, access, refresh);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$JwtResponseImplCopyWith<_$JwtResponseImpl> get copyWith =>
      __$$JwtResponseImplCopyWithImpl<_$JwtResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$JwtResponseImplToJson(
      this,
    );
  }
}

abstract class _JwtResponse implements JwtResponse {
  const factory _JwtResponse(
      {required final String access,
      required final String refresh}) = _$JwtResponseImpl;

  factory _JwtResponse.fromJson(Map<String, dynamic> json) =
      _$JwtResponseImpl.fromJson;

  @override
  String get access;
  @override
  String get refresh;
  @override
  @JsonKey(ignore: true)
  _$$JwtResponseImplCopyWith<_$JwtResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
