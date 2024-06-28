import 'package:allservice/features/recover_password/data/service/recover_password_service.dart';
import 'package:allservice/features/recover_password/domain/message_response/message_response.dart';
import 'package:allservice/features/recover_password/domain/reset_password_request/reset_password_request.dart';
import 'package:allservice/features/recover_password/domain/email_request/email_request.dart';
import 'package:allservice/features/recover_password/domain/verification_code_request/verification_code_request.dart';
import 'package:flutter/foundation.dart';

class RecoverPasswordRepository {
  final RecoverPasswordService _forgotPasswordService;

  RecoverPasswordRepository(this._forgotPasswordService);

  Future<MessageResponse> sendVerificationEmail({
    required EmailRequest request
  }) async {
    try {
      final result = await _forgotPasswordService.sendEmail(
        request: request,
      );
      return result;
    } catch (e, s) {
      debugPrint('Failed to send activation email: $e');
      throw Error.throwWithStackTrace(e, s);
    }
  }

  Future<MessageResponse> verify({
    required VerificationCodeRequest request,
  }) async {
    try {
      final result = await _forgotPasswordService.verify(
        request: request,
      );
      return result;
    } catch (e, s) {
      throw Error.throwWithStackTrace(e, s);
    }
  }

  Future<MessageResponse> resetPassword({
    required ResetPasswordRequest request,
  }) async {
    try {
      final result = await _forgotPasswordService.resetPassword(
        request: request,
      );
      return result;
    } catch (e, s) {
      throw Error.throwWithStackTrace(e, s);
    }
  }

}
