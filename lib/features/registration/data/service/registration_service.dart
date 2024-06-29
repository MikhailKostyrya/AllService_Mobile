
import 'dart:async';
import 'package:allservice/features/registration/domain/user_registration_request.dart';
import 'package:allservice/token/domain/jwt_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'registration_service.g.dart';

@RestApi()
abstract class RegistrationService {
  factory RegistrationService(
    Dio dio
  ) = _RegistrationService;

  @POST('/users/register/')
  Future<JwtResponse> registerUser({
    @Body() required UserRegistrationRequest request,
  });
}
