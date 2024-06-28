import 'package:allservice/features/recover_password/data/repository/recover_password_repository.dart';
import 'package:allservice/features/recover_password/domain/reset_password_request/reset_password_request.dart';
import 'package:allservice/router/app_router.dart';
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
        AutoRouter.of(context).push(const AuthorizationRoute());
      } catch (e) {
        _setLoading(false);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed: $e')));
      }
    }
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  String? passwordMatchValidator(String? value) {
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
