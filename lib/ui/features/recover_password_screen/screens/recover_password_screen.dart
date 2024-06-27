import 'package:allservice/res/constants/color_constants.dart';
import 'package:allservice/res/constants/font_constants.dart';
import 'package:allservice/res/icons/all_service_icons.dart';
import 'package:allservice/ui/features/recover_password_screen/provider/recover_password_screen_provider.dart';
import 'package:allservice/ui/features/verification_screen/screens/verification_screen.dart';
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
    final emailValidator = Provider.of<RecoverPasswordScreenProvider>(context, listen: false);

    if (emailValidator.isValid) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const VerificationScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<RecoverPasswordScreenProvider>(context);
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Form(
        key: provider.formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 127, bottom: 66),
                child: Text(
                  "Восстановление пароля",
                  style: titleTextStyle,
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 26),
                child: Consumer<RecoverPasswordScreenProvider>(
                  builder: (context, validator, child) {
                    return TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        errorText: validator.isValid ? null : 'Введена некорректрая почта',
                        labelText: 'Электронная почта',
                        labelStyle: hintTextStyle,
                        prefixIcon: const Icon(AllServiceIcons.email, size: 20),
                      ),
                      onChanged: (value) => validator.updateEmail(value),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 32, left: 26, right: 26, bottom: 223),
                child: Text(
                  'На указанную электронную почту придет код верификации для восстановления пароля',
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
      ),
    );
  }
}
