// ignore_for_file: use_build_context_synchronously

import 'package:allservice/features/recover_password/data/repository/recover_password_repository.dart';
import 'package:allservice/features/recover_password/domain/verification_code_request/verification_code_request.dart';
import 'package:allservice/router/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class VerificationScreenProvider extends ChangeNotifier {
  final RecoverPasswordRepository _recoverPasswordRepository;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController pinController = TextEditingController();

  VerificationScreenProvider(this._recoverPasswordRepository);

  bool _isLoading = false;
  bool _isError = false;

  bool get isLoading => _isLoading;
  bool get isError => _isError;

  Future<void> verify(BuildContext context, String email) async {
    if (formKey.currentState?.validate() ?? false) {
      _setLoading(true);
      try {
        final request = VerificationCodeRequest(
          email: email,
          code: pinController.text
        );
        
        await _recoverPasswordRepository.verify(request: request);

        _setError(false);
        _setLoading(false);
        AutoRouter.of(context).push(NewPasswordRoute(email: email, verificationCode: pinController.text));
      } catch (e) {
        _setError(true);
        _setLoading(false);
        // ScaffoldMessenger.of(context).showSnackBar(
        //   SnackBar(content: Text('Verification failed: $e'))
        // );
      }
    }
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void _setError(bool value) {
    _isError = value;
    notifyListeners();
  }

  @override
  void dispose() {
    pinController.dispose();
    super.dispose();
  }
}
