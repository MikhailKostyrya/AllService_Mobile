import 'package:allservice/features/recover_password/provider/verification_screen_provider.dart';
import 'package:allservice/res/constants/constants.dart';
import 'package:allservice/features/recover_password/ui/widgets/opt_text_field.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage()
class VerificationScreen extends StatelessWidget {
  final String email;

  const VerificationScreen({
    super.key,
    required this.email
  });

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
              children: [
                const SizedBox(height: 190),
                Text(
                  "Верификация",
                  style: titleTextStyle,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 60),
                (provider.isLoading)
                    ? const Align(
                        alignment: Alignment.bottomCenter,
                        child: SizedBox(
                          height: 192,
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      )
                    : Column(
                        children: [
                          SizedBox(
                            height: 130,
                            child: OptTextFieldWidget(pinController: provider.pinController)
                          ),
                          const SizedBox(height: 32),
                          SizedBox(
                            height: 30,
                            child: (provider.isError)
                                ? Align(
                                    alignment: Alignment.topCenter,
                                    child: Text(
                                      'Неверный код верификации. Попробуйте еще раз',
                                      textAlign: TextAlign.center,
                                      style: hintTextStyle.copyWith(color: kErrorColor),
                                    ),
                                  )
                                : Text(
                                    'Проверьте свою электронную почту. Мы отправили вам код верификации на ваш электронный адрес',
                                    textAlign: TextAlign.center,
                                    style: hintTextStyle,
                                  )
                          ),
                        ],
                      ),
                const SizedBox(height: 170),
                ElevatedButton(
                  onPressed: () {
                    provider.verify(context, email);
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
