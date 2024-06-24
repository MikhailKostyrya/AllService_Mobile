import 'package:allservice/res/constants/color_constants.dart';
import 'package:flutter/material.dart';

class OncomingService extends StatelessWidget {
  final bool isAproved;
  const OncomingService({super.key, required this.isAproved});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              'https://avatars.mds.yandex.net/get-kinopoisk-image/1900788/88b99c0b-9bfb-4804-bd2e-80f07f487d68/orig', // Замените на URL вашей картинки
              width: 104,
              height: 104,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'Химчистка мебели',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                const Row(
                  children: <Widget>[
                    Icon(Icons.calendar_today, size: 16.0),
                    SizedBox(width: 4.0),
                    Text('19.06.2024'),
                    SizedBox(width: 16.0),
                    Icon(Icons.access_time, size: 16.0),
                    SizedBox(width: 4.0),
                    Text('11:00'),
                  ],
                ),
                const SizedBox(height: 8.0),
                Container(
                  height: 26,
                  width: 221,
                  padding: const EdgeInsets.symmetric(horizontal: 64.0, vertical: 4.0),
                  decoration: BoxDecoration(
                    color: isAproved ? kAprovedColor : kProcessingColor,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Text(
                    isAproved ? 'Одобрено' : 'В обработке',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
