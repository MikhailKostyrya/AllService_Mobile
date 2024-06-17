import 'package:allservice/res/constants/color_constants.dart';
import 'package:allservice/res/constants/font_constants.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

final defaultPinTheme = PinTheme(
  width: 78,
  height: 130,
  textStyle: verficationOptStyle,
  decoration: const BoxDecoration(
    color: kGreyColor3,
    borderRadius: BorderRadius.all(
      Radius.circular(15.0),
    ),
  ),
);

final submittedPinTheme = defaultPinTheme.copyWith(
  decoration: BoxDecoration(
    borderRadius: const BorderRadius.all(
      Radius.circular(15.0),
    ),
    border: Border.all(
      color: kPrimaryColor, // Цвет границы при фокусе
    ),
  ),
);
