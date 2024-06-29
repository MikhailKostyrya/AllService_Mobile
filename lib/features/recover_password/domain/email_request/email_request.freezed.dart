// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'email_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EmailRequest _$EmailRequestFromJson(Map<String, dynamic> json) {
  return _EmailRequest.fromJson(json);
}

/// @nodoc
mixin _$EmailRequest {
  String get email => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EmailRequestCopyWith<EmailRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmailRequestCopyWith<$Res> {
  factory $EmailRequestCopyWith(
          EmailRequest value, $Res Function(EmailRequest) then) =
      _$EmailRequestCopyWithImpl<$Res, EmailRequest>;
  @useResult
  $Res call({String email});
}

/// @nodoc
class _$EmailRequestCopyWithImpl<$Res, $Val extends EmailRequest>
    implements $EmailRequestCopyWith<$Res> {
  _$EmailRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EmailRequestImplCopyWith<$Res>
    implements $EmailRequestCopyWith<$Res> {
  factory _$$EmailRequestImplCopyWith(
          _$EmailRequestImpl value, $Res Function(_$EmailRequestImpl) then) =
      __$$EmailRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email});
}

/// @nodoc
class __$$EmailRequestImplCopyWithImpl<$Res>
    extends _$EmailRequestCopyWithImpl<$Res, _$EmailRequestImpl>
    implements _$$EmailRequestImplCopyWith<$Res> {
  __$$EmailRequestImplCopyWithImpl(
      _$EmailRequestImpl _value, $Res Function(_$EmailRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_$EmailRequestImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class _$EmailRequestImpl implements _EmailRequest {
  const _$EmailRequestImpl({required this.email});

  factory _$EmailRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$EmailRequestImplFromJson(json);

  @override
  final String email;

  @override
  String toString() {
    return 'EmailRequest(email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmailRequestImpl &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EmailRequestImplCopyWith<_$EmailRequestImpl> get copyWith =>
      __$$EmailRequestImplCopyWithImpl<_$EmailRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EmailRequestImplToJson(
      this,
    );
  }
}

abstract class _EmailRequest implements EmailRequest {
  const factory _EmailRequest({required final String email}) =
      _$EmailRequestImpl;

  factory _EmailRequest.fromJson(Map<String, dynamic> json) =
      _$EmailRequestImpl.fromJson;

  @override
  String get email;
  @override
  @JsonKey(ignore: true)
  _$$EmailRequestImplCopyWith<_$EmailRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
