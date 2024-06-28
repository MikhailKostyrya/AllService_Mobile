import 'package:allservice/features/authorization/provider/authorization_screen_provider.dart';
import 'package:allservice/res/constants/constants.dart';
import 'package:allservice/res/icons/all_service_icons.dart';
import 'package:provider/provider.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class AuthorizationScreen extends StatefulWidget {
  const AuthorizationScreen({super.key});

  @override
  State<AuthorizationScreen> createState() => _AuthorizationScreenState();
}

class _AuthorizationScreenState extends State<AuthorizationScreen> {
  bool _passwordVisible = true;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AuthorizationScreenProvider>(context);
    
    return Scaffold(
      body: Form(
        key: provider.formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                const SizedBox(height: 190),
                Text('Вход', style: titleTextStyle),
                const SizedBox(height: 60),
                (provider.isLoading)
                      ? const Align(
                          alignment: Alignment.bottomCenter,
                          child: SizedBox(
                            height: 190,
                            child: Center(child: CircularProgressIndicator())
                          )
                        )
                      :  Column(
                          children: [
                            SizedBox(
                              height: 85,
                              child: TextFormField(
                                controller: provider.emailController,
                                decoration: const InputDecoration(
                                  labelText: 'Электронная почта',
                                  prefixIcon:  Icon(AllServiceIcons.email, size: 20, color: kIconColor),
                                ),
                                validator:(value) => provider.emailValidator(value),
                              ),
                            ),
                            SizedBox(
                              height: 90,
                              child: TextFormField(
                                controller: provider.passwordController,
                                obscureText: _passwordVisible,
                                decoration: InputDecoration(
                                  labelText: 'Пароль',
                                  prefixIcon: const Icon(AllServiceIcons.lock, size: 20, color: kIconColor),
                                  suffixIcon: _buildSuffixIcon(),
                                ),
                                validator: (value) => provider.passwordValidator(value),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                              child: GestureDetector(
                                child: Text(
                                  'Восстановить пароль',
                                  style: inputFieldTextStyle.copyWith(color: kPrimaryColor),
                                ),
                                onTap: () {},
                              ),
                            ),
                          ],
                        ),
                const SizedBox(height: 170),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      child: const Text('Войти'),
                      onPressed: () {
                        provider.login(context);
                      },
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Нет аккаунта? ', style: inputFieldTextStyle),
                        GestureDetector(
                          child: Text(
                            'Создать', 
                            style: inputFieldTextStyle.copyWith(color: kPrimaryColor)
                          ),
                          onTap: () {},
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSuffixIcon() {
    return IconButton(
      icon: Icon(
        _passwordVisible ? Icons.visibility_off : Icons.visibility,
      ),
      style: const ButtonStyle(
        overlayColor: WidgetStatePropertyAll(Colors.transparent),
        iconColor: WidgetStatePropertyAll(kIconColor)
      ),
      onPressed: () {
        setState(() {
          _passwordVisible = !_passwordVisible;
        });
      },
    );
  }
}