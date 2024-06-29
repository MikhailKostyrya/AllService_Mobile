// ignore_for_file: use_build_context_synchronously

import 'package:allservice/features/recover_password/data/repository/recover_password_repository.dart';
import 'package:allservice/features/recover_password/domain/reset_password_request/reset_password_request.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class NewPasswordScreenProvider extends ChangeNotifier {
  final RecoverPasswordRepository _recoverPasswordRepository;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  NewPasswordScreenProvider(this._recoverPasswordRepository);

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> sendNewPassword(BuildContext context, String email, String verificationCode) async {
    if (formKey.currentState?.validate() ?? false) {
      _setLoading(true);
      try {
        final request = ResetPasswordRequest(
          email: email,
          code: verificationCode,
          newPassword: newPasswordController.text
        );
        
        await _recoverPasswordRepository.resetPassword(request: request);

        _setLoading(false);
        AutoRouter.of(context).popUntilRoot();
      } catch (e) {
        _setLoading(false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Recover password failed: $e'))
        );
      }
    }
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Это поле не может быть пустым';
    }
    if (!RegExp(r'^.{4,}$').hasMatch(value)) {
      return ("Пароль должен быть больше 4 символов");
    }
    return null;
  }

  String? passwordMatchValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Это поле не может быть пустым';
    }
    if (value != newPasswordController.text) {
      return 'Пароли не совпадают';
    }
    return null;
  }

  @override
  void dispose() {
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}
