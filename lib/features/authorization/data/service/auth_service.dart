import 'dart:async';
import 'package:allservice/features/authorization/domain/user_login_request.dart';
import 'package:allservice/token/domain/jwt_response/jwt_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'auth_service.g.dart';

@RestApi()
abstract class AuthService {
  factory AuthService(
    Dio dio
  ) = _AuthService;

  @POST('/users/login/')
  Future<JwtResponse> loginUser({
    @Body() required UserLoginRequest request,
  });
}
