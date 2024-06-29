import 'package:allservice/res/constants/color_constants.dart';
import 'package:allservice/res/constants/font_constants.dart';
import 'package:allservice/res/icons/all_service_icons.dart';
import 'package:allservice/features/recover_password/provider/recover_password_screen_provider.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage()
class RecoverPasswordScreen extends StatelessWidget {
  const RecoverPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<RecoverPasswordScreenProvider>(context);
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Form(
        key: provider.formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 190),
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
                          height: 115,
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
                              controller: provider.emailController,
                              decoration: InputDecoration(
                                labelText: 'Электронная почта',
                                labelStyle: hintTextStyle,
                                prefixIcon: const Icon(AllServiceIcons.email, size: 20),
                              ),
                              validator: (value) => provider.emailValidator(value),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                            child: Text(
                              'На указанную электронную почту придет код верификации для восстановления пароля',
                              textAlign: TextAlign.center,
                              style: hintTextStyle,
                            ),
                          ),
                        ],
                      ),
                const SizedBox(height: 200),
                ElevatedButton(
                  onPressed: () {
                    provider.sendEmail(context);
                  },
                  child: const Text('Продолжить'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
