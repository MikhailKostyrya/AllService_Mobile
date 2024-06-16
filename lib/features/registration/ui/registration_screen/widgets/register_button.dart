import 'package:flutter/material.dart';

class RegisterButton extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController surnameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final VoidCallback validateFields;

  const RegisterButton({
    Key? key,
    required this.nameController,
    required this.surnameController,
    required this.emailController,
    required this.passwordController,
    required this.validateFields,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 237,
      height: 44,
      child: ElevatedButton(
        onPressed: () {
          validateFields();
          if (nameController.text.isNotEmpty &&
              surnameController.text.isNotEmpty &&
              emailController.text.isNotEmpty &&
              passwordController.text.isNotEmpty) {
            print("нажатие");
          }
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.black;
            }
            return Colors.white;
          }),
          side: MaterialStateProperty.all<BorderSide>(
            const BorderSide(color: Colors.black),
          ),
          foregroundColor: MaterialStateProperty.resolveWith<Color>((states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.white;
            }
            return Colors.black;
          }),
          elevation: MaterialStateProperty.all<double>(0),
        ),
        child: const Text(
          'Зарегистрироваться',
          style: TextStyle(
            fontSize: 17,
            fontFamily: 'Montserrat',
          ),
        ),
      ),
    );
  }
}
