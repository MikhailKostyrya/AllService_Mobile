// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'token_refresh_request.g.dart';
part 'token_refresh_request.freezed.dart';

@freezed
class TokenRefreshRequest with _$TokenRefreshRequest {
  @JsonSerializable(
    explicitToJson: true,
    includeIfNull: false
  )
  const factory TokenRefreshRequest({
    String? refresh,
  }) = _TokenRefreshRequest;

  factory TokenRefreshRequest.fromJson(Map<String, dynamic> json) =>
      _$TokenRefreshRequestFromJson(json);
}