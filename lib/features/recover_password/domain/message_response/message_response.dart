// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_response.g.dart';
part 'message_response.freezed.dart';

@freezed
class MessageResponse with _$MessageResponse {
  @JsonSerializable(
    explicitToJson: true,
    includeIfNull: false
  )
  const factory MessageResponse({
    required String message,
  }) = _MessageResponse;

  factory MessageResponse.fromJson(Map<String, dynamic> json) =>
      _$MessageResponseFromJson(json);
}
