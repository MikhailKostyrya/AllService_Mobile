import 'package:flutter/material.dart';
import 'package:allservice/res/constants/color_constants.dart';
import 'package:allservice/res/constants/font_constants.dart';
import 'package:allservice/models/user.dart';
import 'package:allservice/services/auth_service.dart';

final mainTheme = ThemeData(
  elevatedButtonTheme: elevatedButtonThemeData(),
  inputDecorationTheme: inputDecorationTheme(),
  textSelectionTheme: textSelectionThemeData(),
  progressIndicatorTheme: progressIndicatorTheme(),
  snackBarTheme: snackBarThemeData(),
  scaffoldBackgroundColor: kBackgroundColor,
  primaryColor: kPrimaryColor,
  textTheme: const TextTheme(
    bodyMedium: TextStyle(
      color: kTextColor,
    ),
  ),
  useMaterial3: true,
);

SnackBarThemeData snackBarThemeData() {
  return SnackBarThemeData(
    backgroundColor: kGreyColor3,
    contentTextStyle: snackBarTextStyle,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(12),
        topRight: Radius.circular(12),
      ),
    ),
  );
}

ProgressIndicatorThemeData progressIndicatorTheme() {
  return const ProgressIndicatorThemeData(
    color: kPrimaryColor,
  );
}

TextSelectionThemeData textSelectionThemeData() {
  return const TextSelectionThemeData(
    cursorColor: kPrimaryColor,
    selectionColor: kPrimaryColor,
    selectionHandleColor: kPrimaryColor,
  );
}

ElevatedButtonThemeData elevatedButtonThemeData() {
  return ElevatedButtonThemeData(
    style: ButtonStyle(
      textStyle: MaterialStatePropertyAll(elevateButtonStyle),
      foregroundColor: MaterialStateProperty.resolveWith(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.pressed)) {
            return Colors.white;
          }
          return Colors.black;
        },
      ),
      backgroundColor: MaterialStateProperty.resolveWith(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.pressed)) {
            return Colors.black;
          }
          return Colors.white;
        },
      ),
      overlayColor: const MaterialStatePropertyAll(Colors.transparent),
      shape: MaterialStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: const BorderSide(
            color: Colors.black,
            width: 1,
          ),
        ),
      ),
      fixedSize: const MaterialStatePropertyAll(Size(237, 44)),
      elevation: const MaterialStatePropertyAll(0),
      animationDuration: Duration.zero,
    ),
  );
}

InputDecorationTheme inputDecorationTheme() {
  return InputDecorationTheme(
    floatingLabelBehavior: FloatingLabelBehavior.never,
    contentPadding: const EdgeInsets.symmetric(vertical: 13.0, horizontal: 48),
    filled: true,
    fillColor: kGreyColor3,
    errorStyle: inputFieldTextStyle.copyWith(color: kErrorColor),
    labelStyle: inputFieldTextStyle.copyWith(color: kGreyColor1),
    disabledBorder: standartOutlineInputBorder(),
    enabledBorder: standartOutlineInputBorder(),
    focusedBorder: activeOutlineInputBorder(),
    errorBorder: errorOutlineInputBorder(),
    focusedErrorBorder: errorOutlineInputBorder(),
  );
}

OutlineInputBorder standartOutlineInputBorder() {
  return const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(15.0)),
    borderSide: BorderSide.none,
  );
}

OutlineInputBorder activeOutlineInputBorder() {
  return const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(15.0)),
    borderSide: BorderSide(color: kPrimaryColor),
  );
}

OutlineInputBorder errorOutlineInputBorder() {
  return const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(15.0)),
    borderSide: BorderSide(color: kErrorColor),
  );
}

class AnimatedTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final IconData icon;
  final double padding;
  final bool obscureText;
  final String? errorText;
  final ValueChanged<String> onChanged;

  const AnimatedTextField({
    Key? key,
    required this.controller,
    required this.label,
    required this.icon,
    required this.padding,
    this.obscureText = false,
    this.errorText,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: EdgeInsets.only(top: padding),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon, color: kIconColor),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            ),
          ),
          errorText: errorText,
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: kErrorColor),
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            ),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: kErrorColor),
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            ),
          ),
        ),
        obscureText: obscureText,
        onChanged: onChanged,
      ),
    );
  }
}

class CheckboxWithText extends StatefulWidget {
  final bool isChecked;
  final ValueChanged<bool?> onChanged;

  const CheckboxWithText({
    Key? key,
    required this.isChecked,
    required this.onChanged,
  }) : super(key: key);

  @override
  _CheckboxWithTextState createState() => _CheckboxWithTextState();
}

class _CheckboxWithTextState extends State<CheckboxWithText> {
  bool _isChecked = false;

  @override
  void initState() {
    super.initState();
    _isChecked = widget.isChecked;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                _isChecked = !_isChecked;
                widget.onChanged(_isChecked);
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Container(
                width: 18,
                height: 18,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: kIconColor,
                  ),
                  borderRadius: BorderRadius.circular(4),
                  color: _isChecked ? kBackgroundColor : Colors.transparent,
                ),
                child: _isChecked
                    ? const Icon(Icons.check, size: 14.0, color: kIconColor)
                    : null,
              ),
            ),
          ),
          const SizedBox(width: 16),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Я принимаю пользовательское',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
                ),
                Text(
                  'соглашение и политику конфиденциальности',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final IconData icon;
  final String? errorText;
  final ValueChanged<String> onChanged;
  final bool obscureText;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.label,
    required this.icon,
    this.errorText,
    required this.onChanged,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: errorText != null ? kBackgroundColor : kGreyColor3,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                labelText: label,
                prefixIcon: Icon(icon, color: kIconColor),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: errorText != null ? kErrorColor : kGreyColor3,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: errorText != null ? kErrorColor : kGreyColor3,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: errorText != null ? kErrorColor : kPrimaryColor,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                ),
                errorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: kErrorColor),
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                focusedErrorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: kErrorColor),
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                filled: true,
                fillColor: errorText != null ? kBackgroundColor : kGreyColor3,
              ),
              obscureText: obscureText,
              onChanged: onChanged,
            ),
            if (errorText != null)
              Positioned(
                left: -100.0,
                right: 12.0,
                top: -8.0,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    color: kBackgroundColor,
                    child: Text(
                      errorText!,
                      style: const TextStyle(
                        color: kErrorColor,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class LoginLink extends StatelessWidget {
  const LoginLink({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Уже есть аккаунт?',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.normal,
            ),
          ),
          SizedBox(width: 4.0),
          Text(
            'Войти',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: kPrimaryColor,
            ),
          ),
        ],
      ),
    );
  }
}

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
        onPressed: () async {
          validateFields();
          if (nameController.text.isNotEmpty &&
              surnameController.text.isNotEmpty &&
              emailController.text.isNotEmpty &&
              passwordController.text.isNotEmpty) {
            User user = User(
              name: nameController.text,
              surname: surnameController.text,
              email: emailController.text,
              password: passwordController.text,
            );

            AuthService authService = AuthService();
            String result = await authService.register(user);

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(result)),
            );
          }
        },
        style: ElevatedButton.styleFrom(
          foregroundColor: kIconColor,
          backgroundColor: kBackgroundColor,
          disabledForegroundColor: kGreyColor3.withOpacity(0.38),
          disabledBackgroundColor: kGreyColor3.withOpacity(0.12),
          side: const BorderSide(color: kIconColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          textStyle: elevateButtonStyle,
        ),
        child: const Text(
          'Зарегистрироваться',
        ),
      ),
    );
  }
}

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({Key? key}) : super(key: key);

  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  bool _isChecked = false;
  String? _emailErrorText;
  String? _passwordErrorText;
  String? _nameErrorText;
  String? _surnameErrorText;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _validateFields() {
    setState(() {
      _nameErrorText =
          _nameController.text.isEmpty ? 'Обязательное поле' : null;
      _surnameErrorText =
          _surnameController.text.isEmpty ? 'Обязательное поле' : null;
      _emailErrorText = _emailController.text.isEmpty
          ? 'Обязательное поле'
          : (!_isValidEmail(_emailController.text)
              ? 'Некорректный адрес электронной почты'
              : null);
      _passwordErrorText = _passwordController.text.isEmpty
          ? 'Обязательное поле'
          : (_passwordController.text.length < 6
              ? 'Пароль должен быть больше 6 символов'
              : null);
    });
  }

  bool _isValidEmail(String email) {
    final emailRegex = RegExp(
        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.(com|ru|net|org|edu|gov|mil|biz|info|mobi|name|aero|jobs|museum)$');
    return emailRegex.hasMatch(email);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _surnameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const SizedBox(height: 30.0),
        Text(
          'Регистрация',
          style: titleTextStyle,
        ),
        const SizedBox(height: 36.0),
        CustomTextField(
          controller: _nameController,
          label: 'Имя',
          icon: Icons.person_outline,
          errorText: _nameErrorText,
          onChanged: (value) {
            setState(() {
              _nameErrorText = null;
            });
          },
        ),
        const SizedBox(height: 16.0),
        CustomTextField(
          controller: _surnameController,
          label: 'Фамилия',
          icon: Icons.person_outline,
          errorText: _surnameErrorText,
          onChanged: (value) {
            setState(() {
              _surnameErrorText = null;
            });
          },
        ),
        const SizedBox(height: 16.0),
        CustomTextField(
          controller: _emailController,
          label: 'Электронная почта',
          icon: Icons.email_outlined,
          errorText: _emailErrorText,
          onChanged: (value) {
            setState(() {
              _emailErrorText = null;
            });
          },
        ),
        const SizedBox(height: 16.0),
        CustomTextField(
          controller: _passwordController,
          label: 'Пароль',
          icon: Icons.lock_outline,
          obscureText: true,
          errorText: _passwordErrorText,
          onChanged: (value) {
            setState(() {
              _passwordErrorText = null;
            });
          },
        ),
        const SizedBox(height: 32.0),
        CheckboxWithText(
          isChecked: _isChecked,
          onChanged: (bool? value) {
            setState(() {
              _isChecked = value ?? false;
            });
          },
        ),
        const SizedBox(height: 32.0),
        RegisterButton(
          nameController: _nameController,
          surnameController: _surnameController,
          emailController: _emailController,
          passwordController: _passwordController,
          validateFields: _validateFields,
        ),
        const SizedBox(height: 55.0),
        const LoginLink(),
      ],
    );
  }
}
