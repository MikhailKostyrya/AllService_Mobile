import 'package:allservice/res/constants/color_constants.dart';
import 'package:allservice/res/constants/font_constants.dart';
import 'package:flutter/material.dart';

class EditField extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  const EditField({super.key, required this.title, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17),
          child: Text(
            title,
            style: inputFieldTextStyle.copyWith(color: kGreyColor1),
          ),
        ),
        TextFormField(
            style: inputFieldTextStyle.copyWith(color: Colors.black),
            controller: controller,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 17),
            )),
      ],
    );
  }
}
