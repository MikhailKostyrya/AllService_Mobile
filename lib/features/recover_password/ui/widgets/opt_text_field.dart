import 'package:allservice/res/constants/color_constants.dart';
import 'package:allservice/res/constants/font_constants.dart';
import 'package:allservice/res/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class OptTextField extends StatefulWidget {
  const OptTextField({super.key});

  @override
  State<OptTextField> createState() => _OptTextFieldState();
}

class _OptTextFieldState extends State<OptTextField> {
  final TextEditingController _pinController = TextEditingController();
  bool validPin = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1),
      child: Pinput(
        controller: _pinController,
        errorTextStyle: inputFieldTextStyle.copyWith(color: kErrorColor),
        length: 4,
        defaultPinTheme: defaultPinTheme,
        submittedPinTheme: submittedPinTheme,
        onCompleted: (pin) {},
      ),
    );
  }
}
