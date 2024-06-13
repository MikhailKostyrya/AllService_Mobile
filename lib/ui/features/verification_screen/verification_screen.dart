import 'package:allservice/res/constants/color_constants.dart';
import 'package:allservice/res/constants/font_constants.dart';
import 'package:allservice/ui/features/verification_screen/opt_text_field.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 118, left: 66, right: 66, bottom: 98),
              child: Text(
                "Верификация",
                style: titleTextStyle,
                textAlign: TextAlign.center,
              ),
            ),
            const OptTextField(),
            Padding(
              padding: const EdgeInsets.only(top: 40, left: 26, right: 26, bottom: 165),
              child: Text(
                'Проверьте свою электронную почту. Мы отправили вам код верификации на ваш электронный адрес',
                style: commentStyle,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
