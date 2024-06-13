import 'package:allservice/res/constants/color_constants.dart';
import 'package:allservice/res/constants/font_constants.dart';
import 'package:allservice/ui/features/recover_password_screen/continue_button.dart';
import 'package:allservice/ui/features/recover_password_screen/input_field.dart';
import 'package:allservice/ui/features/recover_password_screen/email_validator.dart';
import 'package:allservice/ui/features/verification_screen/verification_screen.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage()
class RecoverPasswordScreen extends StatefulWidget {
  const RecoverPasswordScreen({super.key});
  @override
  State<RecoverPasswordScreen> createState() => _RecoverPasswordScreenState();
}

class _RecoverPasswordScreenState extends State<RecoverPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _submit() {
    final emailValidator = Provider.of<EmailValidator>(context, listen: false);

    if (emailValidator.isValid) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const VerificationScreen()),
      );
    } else {}
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
              controller: _emailController,
              hint: 'Электронная почта',
            ),
            Padding(
              padding: const EdgeInsets.only(top: 32, left: 26, right: 26, bottom: 212),
              child: Text(
                'На указанную электронную почту придет код для восстановления пароля',
                style: commentStyle,
                textAlign: TextAlign.center,
              ),
            ),
            ContinueButton(onPressed: _submit),
          ],
        ),
      ),
    );
  }
}
