import 'package:allservice/features/recover_password/data/repository/recover_password_repository.dart';
import 'package:allservice/features/recover_password/domain/email_request/email_request.dart';
import 'package:allservice/router/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class RecoverPasswordScreenProvider extends ChangeNotifier {
  final RecoverPasswordRepository _recoverPasswordRepository;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

  RecoverPasswordScreenProvider(this._recoverPasswordRepository);

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> sendEmail(BuildContext context) async {
    if (formKey.currentState?.validate() ?? false) {
      _setLoading(true);
      try {
        final request = EmailRequest(
          email: emailController.text,
        );
        
        await _recoverPasswordRepository.sendVerificationEmail(request: request);

        _setLoading(false);
        AutoRouter.of(context).push(VerificationRoute(email: emailController.text));
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

  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Это поле не может быть пустым';
    }
    if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+\\.[a-z]+").hasMatch(value)) {
      return ("Введена некорректрая почта");
    }
    return null;
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }
}
