import 'package:allservice/res/constants/color_constants.dart';
import 'package:allservice/res/constants/font_constants.dart';
import 'package:allservice/res/icons/all_service_icons.dart';
import 'package:allservice/features/recover_password/providers/recover_password_screen_provider.dart';
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
                padding: const EdgeInsets.only(top: 127, bottom: 63),
                child: Text(
                  "Восстановление пароля",
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
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 26),
                          child: SizedBox(
                            child: TextFormField(
                              controller: provider.emailController,
                              decoration: InputDecoration(
                                labelText: 'Электронная почта',
                                labelStyle: hintTextStyle,
                                prefixIcon: const Icon(AllServiceIcons.email, size: 20),
                              ),
                              validator: (value) => provider.emailValidator(value),
                            ),
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
                            provider.sendEmail(context);
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
}
