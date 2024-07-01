import 'package:allservice/res/constants/color_constants.dart';
import 'package:allservice/res/constants/font_constants.dart';
import 'package:flutter/material.dart';

class AccountAction extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const AccountAction({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 52,
        width: 361,
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        decoration: BoxDecoration(
          color: kGreyColor3,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Center(
          child: Text(
            title,
            style: mainTextSyle.copyWith(fontSize: 12),
          ),
        ),
      ),
    );
  }
}
