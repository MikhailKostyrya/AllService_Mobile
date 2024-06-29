// ignore_for_file: use_build_context_synchronously

import 'package:allservice/features/registration/data/repository/registration_repository.dart';
import 'package:allservice/features/registration/domain/user_registration_request.dart';
import 'package:allservice/router/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class RegistrationScreenProvider extends ChangeNotifier {
  final RegistrationRepository _registrationRepository;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController secondNameController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  RegistrationScreenProvider(this._registrationRepository);

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> register(BuildContext context) async {
    if (formKey.currentState?.validate() ?? false) {
      _setLoading(true);
      try {
        final request = UserRegistrationRequest(
          email: emailController.text,
          password: passwordController.text,
          firstName: firstNameController.text,
          secondName: secondNameController.text,
        );

        await _registrationRepository.register(request: request);
        _setLoading(false);
        AutoRouter.of(context).replace(const AuthorizationRoute());
      } catch (e) {
        _setLoading(false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Registration failed: $e'))
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

  String? nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Это поле не может быть пустым';
    }
    if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
      return ("Имя не может иметь символов");
    }
    return null;
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    firstNameController.dispose();
    secondNameController.dispose();
    super.dispose();
  }
}