// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'token_refresh_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TokenRefreshRequest _$TokenRefreshRequestFromJson(Map<String, dynamic> json) {
  return _TokenRefreshRequest.fromJson(json);
}

/// @nodoc
mixin _$TokenRefreshRequest {
  String? get refresh => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TokenRefreshRequestCopyWith<TokenRefreshRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TokenRefreshRequestCopyWith<$Res> {
  factory $TokenRefreshRequestCopyWith(
          TokenRefreshRequest value, $Res Function(TokenRefreshRequest) then) =
      _$TokenRefreshRequestCopyWithImpl<$Res, TokenRefreshRequest>;
  @useResult
  $Res call({String? refresh});
}

/// @nodoc
class _$TokenRefreshRequestCopyWithImpl<$Res, $Val extends TokenRefreshRequest>
    implements $TokenRefreshRequestCopyWith<$Res> {
  _$TokenRefreshRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? refresh = freezed,
  }) {
    return _then(_value.copyWith(
      refresh: freezed == refresh
          ? _value.refresh
          : refresh // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TokenRefreshRequestImplCopyWith<$Res>
    implements $TokenRefreshRequestCopyWith<$Res> {
  factory _$$TokenRefreshRequestImplCopyWith(_$TokenRefreshRequestImpl value,
          $Res Function(_$TokenRefreshRequestImpl) then) =
      __$$TokenRefreshRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? refresh});
}

/// @nodoc
class __$$TokenRefreshRequestImplCopyWithImpl<$Res>
    extends _$TokenRefreshRequestCopyWithImpl<$Res, _$TokenRefreshRequestImpl>
    implements _$$TokenRefreshRequestImplCopyWith<$Res> {
  __$$TokenRefreshRequestImplCopyWithImpl(_$TokenRefreshRequestImpl _value,
      $Res Function(_$TokenRefreshRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? refresh = freezed,
  }) {
    return _then(_$TokenRefreshRequestImpl(
      refresh: freezed == refresh
          ? _value.refresh
          : refresh // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class _$TokenRefreshRequestImpl implements _TokenRefreshRequest {
  const _$TokenRefreshRequestImpl({this.refresh});

  factory _$TokenRefreshRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$TokenRefreshRequestImplFromJson(json);

  @override
  final String? refresh;

  @override
  String toString() {
    return 'TokenRefreshRequest(refresh: $refresh)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TokenRefreshRequestImpl &&
            (identical(other.refresh, refresh) || other.refresh == refresh));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, refresh);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TokenRefreshRequestImplCopyWith<_$TokenRefreshRequestImpl> get copyWith =>
      __$$TokenRefreshRequestImplCopyWithImpl<_$TokenRefreshRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TokenRefreshRequestImplToJson(
      this,
    );
  }
}

abstract class _TokenRefreshRequest implements TokenRefreshRequest {
  const factory _TokenRefreshRequest({final String? refresh}) =
      _$TokenRefreshRequestImpl;

  factory _TokenRefreshRequest.fromJson(Map<String, dynamic> json) =
      _$TokenRefreshRequestImpl.fromJson;

  @override
  String? get refresh;
  @override
  @JsonKey(ignore: true)
  _$$TokenRefreshRequestImplCopyWith<_$TokenRefreshRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
