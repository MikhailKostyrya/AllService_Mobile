import 'package:allservice/res/constants/color_constants.dart';
import 'package:allservice/res/constants/font_constants.dart';
import 'package:allservice/ui/features/recover_password_screen/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InputField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;

  const InputField({required this.controller, required this.hint, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26),
      child: Consumer<EmailValidator>(
        builder: (context, emailValidator, child) {
          return TextField(
            cursorColor: kTextColor,
            controller: controller,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: inputFieldTextStyle,
              prefixIcon: const Icon(Icons.email_outlined),
              border: customOutlineInputBorderFocus(),
              focusedBorder: customOutlineInputBorderFocus(),
              enabledBorder: customOutlineInputBorderFocus(),
              errorBorder: customOutlineInputBorder(),
              disabledBorder: customOutlineInputBorder(),
              filled: true,
              fillColor: kGreyColor3,
              errorText: emailValidator.isValid ? null : 'Неверный формат электронной почты',
              errorStyle: errorTextStyle,
              focusedErrorBorder: customOutlineInputBorderFocus(),
            ),
            onChanged: (value) => emailValidator.updateEmail(value),
          );
        },
      ),
    );
  }
}

OutlineInputBorder customOutlineInputBorder() {
  return const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(15.0)),
    borderSide: BorderSide.none,
  );
}

OutlineInputBorder customOutlineInputBorderFocus() {
  return const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(15.0)),
    borderSide: BorderSide(color: kContourColor),
  );
}
