import 'package:allservice/res/constants/color_constants.dart';
import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final Widget suffixWidget;
  final TextStyle style;

  const MenuItem({super.key, required this.title, required this.onTap, required this.suffixWidget, required this.style});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 52,
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        decoration: BoxDecoration(
          color: kGreyColor3,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: style,
            ),
            suffixWidget,
          ],
        ),
      ),
    );
  }
}
