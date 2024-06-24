import 'package:flutter/material.dart';

class Service {
  final String title;
  final String description;
  final String provider;
  final int price;
  final String imageUrl;

  Service({
    required this.title,
    required this.description,
    required this.provider,
    required this.price,
    required this.imageUrl,
  });
}

final List<Service> services = [
  Service(
    title: 'Ремонт духовок',
    description: 'Ремонт духовых шкафов и варочных панелей',
    provider: 'Андрей Востриков',
    price: 1000,
    imageUrl: 'https://avatars.mds.yandex.net/get-kinopoisk-image/1900788/88b99c0b-9bfb-4804-bd2e-80f07f487d68/orig',
  ),
  Service(
    title: 'Ламинирование',
    description: 'Ламинирование и окрашивание бровей и ресниц',
    provider: 'Алексей Иванов',
    price: 1200,
    imageUrl: 'https://avatars.mds.yandex.net/get-kinopoisk-image/1900788/88b99c0b-9bfb-4804-bd2e-80f07f487d68/orig',
  ),
  Service(
    title: 'Фотограф',
    description: 'Свадебный фотограф',
    provider: 'Патрик',
    price: 3000,
    imageUrl: 'https://avatars.mds.yandex.net/get-kinopoisk-image/1900788/88b99c0b-9bfb-4804-bd2e-80f07f487d68/orig',
  ),
  Service(
    title: 'Кондиционеры',
    description: 'Занятия по программированию и робототехнике',
    provider: 'Робобо',
    price: 5000,
    imageUrl: 'https://avatars.mds.yandex.net/get-kinopoisk-image/1900788/88b99c0b-9bfb-4804-bd2e-80f07f487d68/orig',
  ),
];

class ServiceCard extends StatelessWidget {
  final int index;
  const ServiceCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final service = services[index];
    return SizedBox(
      height: 270,
      width: 175,
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 6, left: 12, bottom: 6),
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(5)),
                child: Image.network(
                  service.imageUrl,
                  fit: BoxFit.cover,
                  height: 160,
                  width: 160,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Text(
                service.description,
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6.0),
              child: Text(
                service.provider,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Text(
                'от ${service.price} Р',
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.purple),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
