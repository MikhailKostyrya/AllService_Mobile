import 'package:allservice/features/recover_password/data/service/recover_password_service.dart';
import 'package:allservice/features/recover_password/domain/message_response/message_response.dart';
import 'package:allservice/features/recover_password/domain/reset_password_request/reset_password_request.dart';
import 'package:allservice/features/recover_password/domain/email_request/email_request.dart';
import 'package:allservice/features/recover_password/domain/verification_code_request/verification_code_request.dart';

class RecoverPasswordRepository {
  final RecoverPasswordService _recoverPasswordService;

  RecoverPasswordRepository(this._recoverPasswordService);

  Future<MessageResponse> sendVerificationEmail({
    required EmailRequest request
  }) async {
    try {
      final result = await _recoverPasswordService.sendEmail(
        request: request,
      );
      return result;
    } catch (e, s) {
      throw Error.throwWithStackTrace(e, s);
    }
  }

  Future<MessageResponse> verify({
    required VerificationCodeRequest request,
  }) async {
    try {
      final result = await _recoverPasswordService.verify(
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
      final result = await _recoverPasswordService.resetPassword(
        request: request,
      );
      return result;
    } catch (e, s) {
      throw Error.throwWithStackTrace(e, s);
    }
  }

}
