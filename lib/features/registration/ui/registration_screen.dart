import 'package:allservice/features/registration/provider/registration_provider.dart';
import 'package:allservice/res/constants/constants.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage()
class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

   @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool _passwordVisible = true;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<RegistrationScreenProvider>(context);

    return Scaffold(
      body: Form(
        key: provider.formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 190),
                Text('Регистрация', style: titleTextStyle),
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
                                controller: provider.firstNameController,
                                decoration: const InputDecoration(
                                  labelText: 'Имя',
                                  //prefixIcon:  Icon(AllServiceIcons.email, size: 20, color: kIconColor),
                                ),
                                validator:(value) => provider.nameValidator(value),
                              ),
                            ),
                            SizedBox(
                              height: 85,
                              child: TextFormField(
                                controller: provider.secondNameController,
                                decoration: const InputDecoration(
                                  labelText: 'Фамилия',
                                  //prefixIcon:  Icon(AllServiceIcons.email, size: 20, color: kIconColor),
                                ),
                                validator:(value) => provider.nameValidator(value),
                              ),
                            ),
                            SizedBox(
                              height: 85,
                              child: TextFormField(
                                controller: provider.emailController,
                                decoration: const InputDecoration(
                                  labelText: 'Электронная почта',
                                  //prefixIcon:  Icon(AllServiceIcons.email, size: 20, color: kIconColor),
                                ),
                                validator:(value) => provider.emailValidator(value),
                              ),
                            ),
                            SizedBox(
                              height: 85,
                              child: TextFormField(
                                controller: provider.passwordController,
                                obscureText: _passwordVisible,
                                decoration: InputDecoration(
                                  labelText: 'Пароль',
                                 // prefixIcon: const Icon(AllServiceIcons.lock, size: 20, color: kIconColor),
                                  suffixIcon: _buildSuffixIcon(),
                                ),
                                validator: (value) => provider.passwordValidator(value),
                              ),
                            ),
                          ],
                        ),
                const SizedBox(height: 30),
                ElevatedButton(
                  child: const Text('Зарегистрироваться'),
                  onPressed: () {
                    provider.register(context);
                  },
                ),
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
