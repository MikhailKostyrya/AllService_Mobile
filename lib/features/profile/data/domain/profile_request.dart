// ignore_for_file: invalid_annotation_target
import 'package:allservice/features/profile/data/model/executor.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_request.freezed.dart';
part 'profile_request.g.dart';

@freezed
class ProfileRequest with _$ProfileRequest {
  @JsonSerializable(
    explicitToJson: true,
    includeIfNull: false,
  )
  factory ProfileRequest() = _ProfileRequest;

  factory ProfileRequest.fromJson(Map<String, dynamic> json) => _$ProfileRequestFromJson(json);
}

@freezed
class ProfileUpdateRequest with _$ProfileUpdateRequest {
  @JsonSerializable(
    explicitToJson: true,
    includeIfNull: false,
  )
  factory ProfileUpdateRequest({
    required String firstName,
    required String secondName,
    required String email,
    required String contact,
    required bool? isExecutor,
    @ExecutorConverter() required Executor? executor,
  }) = _ProfileUpdateRequest;

  factory ProfileUpdateRequest.fromJson(Map<String, dynamic> json) => _$ProfileUpdateRequestFromJson(json);
}

class ExecutorConverter implements JsonConverter<Executor, Map<String, dynamic>> {
  const ExecutorConverter();

  @override
  Executor fromJson(Map<String, dynamic> json) {
    return Executor.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(Executor executor) {
    return executor.toJson();
  }
}
