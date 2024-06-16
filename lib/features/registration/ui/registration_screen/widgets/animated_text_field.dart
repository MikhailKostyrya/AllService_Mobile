import 'package:flutter/material.dart';

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
          prefixIcon: Icon(icon),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            ),
          ),
          errorText: errorText,
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            ),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
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
