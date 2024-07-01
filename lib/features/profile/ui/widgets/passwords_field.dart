import 'package:allservice/res/constants/color_constants.dart';
import 'package:allservice/res/constants/font_constants.dart';
import 'package:allservice/res/icons/all_service_icons.dart';
import 'package:flutter/material.dart';

class PasswordsField extends StatefulWidget {
  final String title;
  final TextEditingController controller;
  final String label;
  final String? Function(String?)? validator;
  const PasswordsField({super.key, required this.title, required this.controller, required this.label, this.validator});

  @override
  State<PasswordsField> createState() => _PasswordsFieldState();
}

class _PasswordsFieldState extends State<PasswordsField> {
  bool _passwordVisible = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17),
          child: Text(
            widget.title,
            style: inputFieldTextStyle.copyWith(color: Colors.black),
          ),
        ),
        TextFormField(
          style: inputFieldTextStyle,
          controller: widget.controller,
          obscureText: _passwordVisible,
          validator: (value) => widget.validator!(value),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 17),
            prefixIcon: const Icon(AllServiceIcons.lock, size: 20, color: kIconColor),
            suffixIcon: _buildSuffixIcon(),
            label: Text(widget.label),
          ),
        ),
      ],
    );
  }

  Widget _buildSuffixIcon() {
    return IconButton(
      icon: Icon(
        _passwordVisible ? Icons.visibility_off : Icons.visibility,
      ),
      style: const ButtonStyle(overlayColor: WidgetStatePropertyAll(Colors.transparent), iconColor: WidgetStatePropertyAll(kIconColor)),
      onPressed: () {
        setState(() {
          _passwordVisible = !_passwordVisible;
        });
      },
    );
  }
}
