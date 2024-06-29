import 'package:allservice/features/registration/data/service/registration_service.dart';
import 'package:allservice/features/registration/domain/user_registration_request.dart';
import 'package:allservice/token/domain/jwt_response.dart';

class RegistrationRepository {
  final RegistrationService _registrarionService;
  
  RegistrationRepository(
    this._registrarionService,
  );

  Future<JwtResponse> register({
    required UserRegistrationRequest request,
  }) async {
    try {
      final result = await _registrarionService.registerUser(
        request: request,
      );
      return result;
    } catch (e, s) {
      throw Error.throwWithStackTrace(e, s);
    }
  }
}