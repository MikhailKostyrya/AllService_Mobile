// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_login_request.freezed.dart';
part 'user_login_request.g.dart';

@freezed
class UserLoginRequest with _$UserLoginRequest {
  @JsonSerializable(
    explicitToJson: true,
    includeIfNull: false,
  )
  factory UserLoginRequest({
    required String email,
    required String password,
  }) = _UserLoginRequest;

  factory UserLoginRequest.fromJson(Map<String, dynamic> json) => _$UserLoginRequestFromJson(json);
}