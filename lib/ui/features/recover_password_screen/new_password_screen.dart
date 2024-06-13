import 'package:allservice/res/constants/color_constants.dart';
import 'package:allservice/res/constants/font_constants.dart';
import 'package:allservice/ui/features/recover_password_screen/input_field.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

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
            InputField(
              controller: _newPasswordController,
              hint: "Новый пароль",
            ),
            const SizedBox(
              height: 32,
            ),
            InputField(
              controller: _confirmPasswordController,
              hint: "Подтвердите пароль",
            ),
            Padding(
              padding: const EdgeInsets.only(top: 32, left: 26, right: 26, bottom: 212),
              child: Text(
                'Придумайте новый пароль',
                style: commentStyle,
                textAlign: TextAlign.center,
              ),
            ),
            //ContinueButton(onPressed: _submit),
          ],
        ),
      ),
    );
  }
}
