// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'verification_code_request.g.dart';
part 'verification_code_request.freezed.dart';

@freezed
class VerificationCodeRequest with _$VerificationCodeRequest {
  @JsonSerializable(
    explicitToJson: true,
    includeIfNull: false
  )
  const factory VerificationCodeRequest({
    required String email,
    required String code
  }) = _VerificationCodeRequest;

  factory VerificationCodeRequest.fromJson(Map<String, dynamic> json) =>
      _$VerificationCodeRequestFromJson(json);
}
