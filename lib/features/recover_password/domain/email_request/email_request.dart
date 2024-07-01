// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'email_request.g.dart';
part 'email_request.freezed.dart';

@freezed
class EmailRequest with _$EmailRequest {
  @JsonSerializable(
    explicitToJson: true,
    includeIfNull: false
  )
  const factory EmailRequest({
    required String email
  }) = _EmailRequest;

  factory EmailRequest.fromJson(Map<String, dynamic> json) =>
      _$EmailRequestFromJson(json);
}
