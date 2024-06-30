import 'package:allservice/features/recover_password/domain/message_response/message_response.dart';
import 'package:allservice/features/registration/data/service/registration_service.dart';
import 'package:allservice/features/registration/domain/user_registration_request.dart';

class RegistrationRepository {
  final RegistrationService _registrationService;
  
  RegistrationRepository(
    this._registrationService,
  );

  Future<MessageResponse> register({
    required UserRegistrationRequest request,
  }) async {
    try {
      final result = await _registrationService.registerUser(
        request: request,
      );
      return result;
    } catch (e, s) {
      throw Error.throwWithStackTrace(e, s);
    }
  }
}