import 'package:allservice/features/registration/data/repository/registration_repository.dart';
import 'package:allservice/features/registration/domain/user_registration_request.dart';
import 'package:allservice/res/constants/color_constants.dart';
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
  bool _isCheck = false;
  Color _checkColor = kIconColor;
  Color _checkTextColor = kGreyColor1;
  
  bool get isLoading => _isLoading;
  bool get isCheck => _isCheck;
  Color get checkColor => _checkColor;
  Color get checkTextColor => _checkTextColor;

  Future<void> register(BuildContext context) async {
    if ((formKey.currentState?.validate() ?? false) && _isCheck) {
      _setLoading(true);
      try {
        final request = UserRegistrationRequest(
          email: emailController.text,
          password: passwordController.text,
          firstName: firstNameController.text,
          secondName: secondNameController.text,
        );

        await _registrationRepository.register(request: request);
        _changeTextColor();
        _setLoading(false);
        navigateToAuthorization(context);
      } catch (e) {
        _changeTextColor();
        _setLoading(false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Registration failed: $e'))
        );
      }
    }
    _changeTextColor();
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void navigateToAuthorization(BuildContext context) {
    AutoRouter.of(context).replace(const AuthorizationRoute());
  }

  void changeIsCheck() {
    _isCheck = !_isCheck;
    notifyListeners();
  }

  void _changeTextColor() {
    if (_isCheck) {
      _checkColor = kIconColor;
      _checkTextColor = kGreyColor1;
    } else {
      _checkColor = kErrorColor;
      _checkTextColor = kErrorColor;
    }
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
    if (!RegExp(r'^\p{L}+$', unicode: true).hasMatch(value)) {
      return ("Имя не может иметь символов");
    }
    return null;
  }

  void reset() {
    _isCheck = false;
    _checkColor = kIconColor;
    _checkTextColor = kGreyColor1;
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
