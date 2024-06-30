
import 'dart:async';
import 'package:allservice/features/recover_password/domain/message_response/message_response.dart';
import 'package:allservice/features/registration/domain/user_registration_request.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'registration_service.g.dart';

@RestApi()
abstract class RegistrationService {
  factory RegistrationService(
    Dio dio
  ) = _RegistrationService;

  @POST('/users/register/')
  Future<MessageResponse> registerUser({
    @Body() required UserRegistrationRequest request,
  });
}
