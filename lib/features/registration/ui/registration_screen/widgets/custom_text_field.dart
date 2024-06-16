import 'package:flutter/material.dart';


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
          color: errorText != null ? Colors.white : const Color(0xFFF7F8F8),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                labelText: label,
                prefixIcon: Icon(icon),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: errorText != null ? Colors.red : const Color(0xFFF7F8F8),
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: errorText != null ? Colors.red : const Color(0xFFF7F8F8),
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: errorText != null
                        ? Colors.red
                        : const Color.fromARGB(255, 169, 7, 238),
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                ),
                errorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                focusedErrorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                filled: true,
                fillColor: errorText != null ? Colors.white : const Color(0xFFF7F8F8),
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
                    color: Colors.white,
                    child: Text(
                      errorText!,
                      style: const TextStyle(
                        color: Colors.red,
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
