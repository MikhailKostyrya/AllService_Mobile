import 'package:allservice/features/profile/provider/change_password_screen_provider.dart';
import 'package:allservice/features/profile/ui/widgets/passwords_field.dart';
import 'package:allservice/res/constants/font_constants.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage()
class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ChangePasswordScreenProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            provider.backToEditProfile(context);
          },
          child: const Icon(Icons.arrow_back_ios, size: 20),
        ),
      ),
      body: Form(
        key: provider.formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Center(
            child: Column(
              children: [
                Text("Изменение пароля", style: meduimTitleTextStyle),
                const SizedBox(height: 32),
                PasswordsField(title: "Старый пароль", controller: provider.oldPasswordController, label: "Введите старый пароль", validator: provider.passwordValidator),
                const SizedBox(height: 32),
                PasswordsField(title: "Новый пароль", controller: provider.newPasswordController, label: "Введите новый пароль", validator: provider.passwordValidator),
                const SizedBox(height: 32),
                PasswordsField(title: "Новый пароль", controller: provider.confirmPassword, label: "Повторите новый пароль", validator: provider.passwordValidator),
                const SizedBox(height: 207),
                ElevatedButton(
                  child: const Text('Сохранить'),
                  onPressed: () {
                    provider.savePassword;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
