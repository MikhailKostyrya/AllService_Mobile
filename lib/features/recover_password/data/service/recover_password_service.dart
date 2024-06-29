import 'dart:async';
import 'package:allservice/features/recover_password/domain/message_response/message_response.dart';
import 'package:allservice/features/recover_password/domain/reset_password_request/reset_password_request.dart';
import 'package:allservice/features/recover_password/domain/email_request/email_request.dart';
import 'package:allservice/features/recover_password/domain/verification_code_request/verification_code_request.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'recover_password_service.g.dart';

@RestApi()
abstract class RecoverPasswordService {
  factory RecoverPasswordService(Dio dio) = _RecoverPasswordService;

  @POST('/users/send-activation/')
  Future<MessageResponse> sendEmail({
    @Body() required EmailRequest request,
  });

  @POST('/users/verify/')
  Future<MessageResponse> verify({
    @Body() required VerificationCodeRequest request,
  });

  @POST('/users/reset-password/')
  Future<MessageResponse> resetPassword({
    @Body() required ResetPasswordRequest request,
  });

}
