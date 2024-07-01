import 'package:allservice/res/constants/color_constants.dart';
import 'package:allservice/res/constants/font_constants.dart';
import 'package:flutter/material.dart';

class ServiceDescriptionItem extends StatelessWidget {
  final String title;
  final String content;
  const ServiceDescriptionItem({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: requestDescriptionTextStyle.copyWith(color: kGreyColor1, fontWeight: FontWeight.w500),
        ),
        Text(
          content,
          style: requestDescriptionTextStyle,
        )
      ],
    );
  }
}
