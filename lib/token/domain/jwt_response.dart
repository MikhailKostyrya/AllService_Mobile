// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'jwt_response.g.dart';
part 'jwt_response.freezed.dart';

@freezed
class JwtResponse with _$JwtResponse {
  @JsonSerializable(
    explicitToJson: true,
    includeIfNull: false,
  )
  const factory JwtResponse({
    required String access,
    required String refresh,
  }) = _JwtResponse;

  factory JwtResponse.fromJson(Map<String, dynamic> json) =>
      _$JwtResponseFromJson(json);
}
