import 'package:allservice/ui/features/recover_password_screen/new_password_screen.dart';
import 'package:allservice/ui/features/verification_screen/pinput_theme.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class OptTextField extends StatefulWidget {
  const OptTextField({super.key});

  @override
  State<OptTextField> createState() => _OptTextFieldState();
}

class _OptTextFieldState extends State<OptTextField> {
  bool validPin = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1),
      child: Pinput(
        length: 4,
        defaultPinTheme: defaultPinTheme,
        submittedPinTheme: submittedPinTheme,
        onCompleted: (pin) {
          if (pin == '3333') {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const NewPasswordScreen()),
            );
          }
        },
        validator: (pin) {
          if (pin == '3333') {
            return null;
          } else {
            return 'Неверный код верификации. Попробуйте еще раз';
          }
        },
      ),
    );
  }
}
