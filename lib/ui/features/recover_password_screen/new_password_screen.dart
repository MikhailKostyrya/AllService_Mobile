import 'package:allservice/res/constants/color_constants.dart';
import 'package:allservice/res/constants/font_constants.dart';
import 'package:allservice/res/icons/all_service_icons.dart';
import 'package:allservice/ui/features/recover_password_screen/validator_provider.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage()
class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key});
  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();

    super.dispose();
  }

  void _submit() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 118, left: 42, right: 42, bottom: 98),
              child: Text(
                "Восстановление пароля",
                style: titleTextStyle,
                textAlign: TextAlign.center,
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(right: 26, left: 26, bottom: 32),
              child: Consumer<Validator>(
                builder: (context, validator, child) {
                  return TextFormField(
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    controller: _confirmPasswordController,
                    decoration: InputDecoration(
                      labelText: 'Новый пароль',
                      labelStyle: hintTextStyle,
                      prefixIcon: const Icon(AllServiceIcons.lock, size: 20),
                    ),
                    onChanged: (value) => validator.updateNewPassword(value),
                  );
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26),
              child: Consumer<Validator>(
                builder: (context, validator, child) {
                  return TextFormField(
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    controller: _newPasswordController,
                    decoration: InputDecoration(
                      errorText: validator.isEqual ? null : 'Пароли не совпадают',
                      labelText: 'Подтвердите пароль',
                      labelStyle: hintTextStyle,
                      prefixIcon: const Icon(AllServiceIcons.lock, size: 20),
                    ),
                    onChanged: (value) => validator.updateConfirmPassword(value),
                  );
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 32, left: 26, right: 26, bottom: 212),
              child: Text(
                'Придумайте новый пароль',
                textAlign: TextAlign.center,
                style: hintTextStyle,
              ),
            ),
            
            ElevatedButton(
                style: const ButtonStyle(fixedSize: WidgetStatePropertyAll(Size.fromWidth(237))),
                onPressed: () {
                  _submit();
                },
                child: const Text('Продолжить')),
          ],
        ),
      ),
    );
  }
}
