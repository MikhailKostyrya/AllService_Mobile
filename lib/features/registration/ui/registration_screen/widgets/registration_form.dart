import 'package:flutter/material.dart';
import 'custom_text_field.dart';
import 'checkbox_with_text.dart';
import 'register_button.dart';
import 'login_link.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({Key? key}) : super(key: key);

  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  bool _isChecked = false;
  String? _emailErrorText;
  String? _passwordErrorText;
  String? _nameErrorText;
  String? _surnameErrorText;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _validateFields() {
    setState(() {
      _nameErrorText = _nameController.text.isEmpty ? 'Обязательное поле' : null;
      _surnameErrorText = _surnameController.text.isEmpty ? 'Обязательное поле' : null;
      _emailErrorText = _emailController.text.isEmpty
          ? 'Обязательное поле'
          : (!_isValidEmail(_emailController.text)
              ? 'Некорректный адрес электронной почты'
              : null);
      _passwordErrorText = _passwordController.text.isEmpty
          ? 'Обязательное поле'
          : (_passwordController.text.length < 6
              ? 'Пароль должен быть больше 6 символов'
              : null);
    });
  }

  bool _isValidEmail(String email) {
    final emailRegex = RegExp(
        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.(com|ru|net|org|edu|gov|mil|biz|info|mobi|name|aero|jobs|museum)$');
    return emailRegex.hasMatch(email);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _surnameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const SizedBox(height: 90.0),
        const Text(
          'Регистрация',
          style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 36.0),
        CustomTextField(
          controller: _nameController,
          label: 'Имя',
          icon: Icons.person_outline,
          errorText: _nameErrorText,
          onChanged: (value) {
            setState(() {
              _nameErrorText = null;
            });
          },
        ),
        const SizedBox(height: 16.0),
        CustomTextField(
          controller: _surnameController,
          label: 'Фамилия',
          icon: Icons.person_outline,
          errorText: _surnameErrorText,
          onChanged: (value) {
            setState(() {
              _surnameErrorText = null;
            });
          },
        ),
        const SizedBox(height: 16.0),
        CustomTextField(
          controller: _emailController,
          label: 'Электронная почта',
          icon: Icons.email_outlined,
          errorText: _emailErrorText,
          onChanged: (value) {
            setState(() {
              _emailErrorText = null;
            });
          },
        ),
        const SizedBox(height: 16.0),
        CustomTextField(
          controller: _passwordController,
          label: 'Пароль',
          icon: Icons.lock_outline,
          obscureText: true,
          errorText: _passwordErrorText,
          onChanged: (value) {
            setState(() {
              _passwordErrorText = null;
            });
          },
        ),
        const SizedBox(height: 32.0),
        CheckboxWithText(
          isChecked: _isChecked,
          onChanged: (bool? value) {
            setState(() {
              _isChecked = value ?? false;
            });
          },
        ),
        const SizedBox(height: 32.0),
        RegisterButton(
          nameController: _nameController,
          surnameController: _surnameController,
          emailController: _emailController,
          passwordController: _passwordController,
          validateFields: _validateFields,
        ),
        const SizedBox(height: 55.0),
        const LoginLink(),
      ],
    );
  }
}
