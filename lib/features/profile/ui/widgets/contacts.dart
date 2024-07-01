import 'package:allservice/res/constants/color_constants.dart';
import 'package:allservice/res/constants/font_constants.dart';
import 'package:flutter/material.dart';

List<String> contacts = [
  "andreeva2000@yandex.ru",
  "ivanova2000@mail.ru",
  "https://vk.com/viktoriaivanova"
];

class Contacts extends StatelessWidget {
  const Contacts({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: kGreyColor3,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(7.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Контакты для связи", style: mainTextSyle),
            const SizedBox(height: 16.0),
            Container(
              width: double.infinity,
              height: 152,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (int i = 0; i < contacts.length; i++)
                      Text(
                        contacts[i],
                        style: inputFieldTextStyle,
                      )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
