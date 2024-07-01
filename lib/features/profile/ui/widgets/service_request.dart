import 'package:allservice/res/constants/constants.dart';
import 'package:allservice/res/icons/all_service_icons.dart';
import 'package:flutter/material.dart';

const bool isAproved = false;

class Request {
  final String title;
  final String date;
  final String time;
  final String imageUrl;

  Request({
    required this.title,
    required this.date,
    required this.time,
    required this.imageUrl,
  });
}

class ServiceRequest extends StatelessWidget {
  final VoidCallback onTap;
  const ServiceRequest({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: kGreyColor3,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Row(
          children: <Widget>[
            Hero(
              tag: 'request',
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  'https://avatars.mds.yandex.net/get-kinopoisk-image/1900788/88b99c0b-9bfb-4804-bd2e-80f07f487d68/orig',
                  width: 104,
                  height: 104,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Химчистка мебели', style: smallTitleTextStyle),
                  const SizedBox(height: 8.0),
                  Row(
                    children: <Widget>[
                      const Icon(
                        AllServiceIcons.calendar,
                        size: 20.0,
                        color: kGreyColor1,
                      ),
                      const SizedBox(width: 4.0),
                      Text(
                        '19.06.2024',
                        style: inputFieldTextStyle.copyWith(color: kGreyColor1),
                      ),
                      const SizedBox(width: 16.0),
                      const Icon(
                        Icons.access_time,
                        size: 20.0,
                        color: kGreyColor1,
                      ),
                      const SizedBox(width: 4.0),
                      Text(
                        '11:00',
                        style: inputFieldTextStyle.copyWith(color: kGreyColor1),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    isAproved ? 'Одобрено' : 'В обработке',
                    style: mainTextSyle.copyWith(
                      color: isAproved ? kAprovedColor : kGreyColor1,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
