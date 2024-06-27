import 'package:allservice/res/constants/color_constants.dart';
import 'package:allservice/res/constants/font_constants.dart';
import 'package:allservice/res/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class OptTextFieldWidget extends StatelessWidget {
  final TextEditingController pinController;
  const OptTextFieldWidget({super.key, required this.pinController});

  @override
  Widget build(BuildContext context) {
    return Pinput(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      controller: pinController,
      errorTextStyle: inputFieldTextStyle.copyWith(color: kErrorColor),
      length: 4,
      defaultPinTheme: defaultPinTheme,
      submittedPinTheme: submittedPinTheme,
      onCompleted: (pin) {},
    );
  }
}
