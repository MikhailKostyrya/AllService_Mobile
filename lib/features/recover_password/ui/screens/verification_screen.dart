import 'package:allservice/features/recover_password/providers/verification_screen_provider.dart';
import 'package:allservice/res/constants/constants.dart';
import 'package:allservice/features/recover_password/ui/widgets/opt_text_field.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage()
class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<VerificationScreenProvider>(context);
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Form(
        key: provider.formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 118, bottom: 98),
                  child: Text(
                    "Верификация",
                    style: titleTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
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
                          OptTextFieldWidget(pinController: provider.pinController),
                          Padding(
                            padding: const EdgeInsets.only(top: 32, bottom: 165),
                            child: Text(
                              'Проверьте свою электронную почту. Мы отправили вам код верификации на ваш электронный адрес',
                              textAlign: TextAlign.center,
                              style: hintTextStyle,
                            ),
                          ),
                          ElevatedButton(
                            style: const ButtonStyle(fixedSize: WidgetStatePropertyAll(Size.fromWidth(237))),
                            onPressed: () {
                              provider.sendPin(context);
                            },
                            child: const Text('Продолжить'),
                          ),
                        ],
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
