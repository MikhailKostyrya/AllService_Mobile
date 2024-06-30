// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_registration_request.freezed.dart';
part 'user_registration_request.g.dart';

@freezed
class UserRegistrationRequest with _$UserRegistrationRequest {
  @JsonSerializable(
    explicitToJson: true,
    includeIfNull: false,
    fieldRename: FieldRename.snake
  )
  factory UserRegistrationRequest({
    required String email,
    required String password,
    required String firstName,
    required String secondName
  }) = _UserRegistrationRequest;

  factory UserRegistrationRequest.fromJson(Map<String, dynamic> json)
      => _$UserRegistrationRequestFromJson(json);
}