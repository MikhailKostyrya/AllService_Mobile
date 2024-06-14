import 'package:allservice/res/constants/constants.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class AuthorizationScreen extends StatefulWidget {
  const AuthorizationScreen({super.key});

  @override
  State<AuthorizationScreen> createState() => _AuthorizationScreenState();
}

class _AuthorizationScreenState extends State<AuthorizationScreen> {
  final emailController = TextEditingController();
  final passwirdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 190),
              Text('Вход', style: titleTextStyle),
              const SizedBox(height: 60),
              SizedBox(
                height: 85,
                child: TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: 'Электронная почта',
                    prefixIcon:  Icon(Icons.email),
                    //errorText: 'Некорректный ввод'
                  ),
                ),
              ),
              SizedBox(
                height: 90,
                child: TextFormField(
                  controller: passwirdController,
                  decoration: const InputDecoration(
                    labelText: 'Пароль',
                    prefixIcon: Icon(Icons.lock),
                    //errorText: 'Некорректный ввод'
                  ),
                ),
              ),
              GestureDetector(
                child: Text(
                  'Восстановить пароль',
                  style: inputFieldTextStyle.copyWith(color: kPrimaryColor),
                ),
                onTap: () {},
              ),
              const SizedBox(height: 170),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    style: const ButtonStyle(
                      fixedSize: WidgetStatePropertyAll(Size.fromWidth(237))
                    ),
                    onPressed: () {},
                     child: const Text('Войти')
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
    );
  }
}