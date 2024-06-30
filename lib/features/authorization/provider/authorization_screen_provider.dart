// ignore_for_file: use_build_context_synchronously

import 'package:allservice/features/authorization/data/repository/auth_repository.dart';
import 'package:allservice/features/authorization/domain/user_login_request.dart';
import 'package:allservice/router/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class AuthorizationScreenProvider extends ChangeNotifier {
  final AuthRepository _authRepository;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  AuthorizationScreenProvider(this._authRepository);

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> login(BuildContext context) async {
    if (formKey.currentState?.validate() ?? false) {
      _setLoading(true);
      try {
        final request = UserLoginRequest(
          email: emailController.text,
          password: passwordController.text,
        );

        await _authRepository.login(request: request);
        _setLoading(false);
        // AutoRouter.of(context).pushAndPopUntil(const HomeRoute(), predicate: (_) => false);
      } catch (e) {
        _setLoading(false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Login failed: $e'))
        );
      }
    }
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void navigateToRecoverPassword(BuildContext context) {
    AutoRouter.of(context).push(const RecoverPasswordRoute());
  }

  void navigateToRegistration(BuildContext context) {
    AutoRouter.of(context).replace(const RegistrationRoute());
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

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Это поле не может быть пустым';
    }
    if (!RegExp(r'^.{4,}$').hasMatch(value)) {
      return ("Пароль должен быть больше 4 символов");
    }
    return null;
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
