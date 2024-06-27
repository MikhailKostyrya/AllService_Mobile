import 'package:allservice/features/recover_password/providers/new_password_screen_provider.dart';
import 'package:allservice/res/constants/color_constants.dart';
import 'package:allservice/res/constants/font_constants.dart';
import 'package:allservice/res/icons/all_service_icons.dart';
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
  bool _newPasswordVisible = true;
  bool _confirmPasswordVisible = true;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NewPasswordScreenProvider>(context);
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Form(
        key: provider.formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 190,
              ),
              Text(
                "Восстановление пароля",
                style: titleTextStyle,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 60),
              (provider.isLoading)
                  ? const Align(
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                        height: 190,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    )
                  : Column(
                      children: [
                        SizedBox(
                          height: 85,
                          child: TextFormField(
                            obscureText: _newPasswordVisible,
                            controller: provider.newPasswordController,
                            decoration: InputDecoration(
                              labelText: 'Новый пароль',
                              labelStyle: hintTextStyle,
                              prefixIcon: const Icon(AllServiceIcons.lock, size: 20),
                              suffixIcon: _buildSuffixIconNewPass(),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 85,
                          child: TextFormField(
                            obscureText: _confirmPasswordVisible,
                            controller: provider.confirmPasswordController,
                            decoration: InputDecoration(
                              labelText: 'Подтвердите пароль',
                              labelStyle: hintTextStyle,
                              prefixIcon: const Icon(AllServiceIcons.lock, size: 20),
                              suffixIcon: _buildSuffixIconConfirmPass(),
                            ),
                            validator: provider.passwordMatchValidator,
                          ),
                        ),
                        Text(
                          'Придумайте новый пароль',
                          textAlign: TextAlign.center,
                          style: hintTextStyle,
                        ),
                        const SizedBox(height: 170),
                        ElevatedButton(
                          style: const ButtonStyle(fixedSize: WidgetStatePropertyAll(Size.fromWidth(237))),
                          onPressed: () {
                            provider.sendNewPassword(context);
                          },
                          child: const Text('Продолжить'),
                        ),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSuffixIconNewPass() {
    return IconButton(
      icon: Icon(
        _newPasswordVisible ? Icons.visibility_off : Icons.visibility,
      ),
      style: const ButtonStyle(overlayColor: WidgetStatePropertyAll(Colors.transparent), iconColor: WidgetStatePropertyAll(kIconColor)),
      onPressed: () {
        setState(() {
          _newPasswordVisible = !_newPasswordVisible;
        });
      },
    );
  }

  Widget _buildSuffixIconConfirmPass() {
    return IconButton(
      icon: Icon(
        _confirmPasswordVisible ? Icons.visibility_off : Icons.visibility,
      ),
      style: const ButtonStyle(overlayColor: WidgetStatePropertyAll(Colors.transparent), iconColor: WidgetStatePropertyAll(kIconColor)),
      onPressed: () {
        setState(() {
          _confirmPasswordVisible = !_confirmPasswordVisible;
        });
      },
    );
  }
}
