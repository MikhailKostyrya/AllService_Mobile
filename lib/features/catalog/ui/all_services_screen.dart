import 'package:allservice/res/constants/color_constants.dart';
import 'package:allservice/res/constants/font_constants.dart';
import 'package:flutter/material.dart';

class AllServicesScreen extends StatelessWidget {
  final List<String> services = [
    'Автосервис, аренда',
    'Грузоперевозки',
    'Пассажирские перевозки',
    'Услуги эвакуатора',
    'Ремонт и отделка',
    'Строительство',
    'Красота, здоровье',
    'Ремонт и обслуживание техники',
    'Монтаж и установка техники',
    'Обучение, курсы',
    'Деловые услуги',
    'Уборка',
    'Бытовые услуги',
    'Маркетинг',
    'Праздники, мероприятия',
    'Фото- и видеосъемка',
    'Няни, сиделки',
    'Уход за животными',
    'Искусство'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight + 44),
        child: Padding(
          padding: const EdgeInsets.only(top: 44.0),
          child: AppBar(
            title: Text('Все услуги', style: titleTextStyle.copyWith(color: kTitleColor)),
            centerTitle: true,
            backgroundColor: kBackgroundColor,
            iconTheme: const IconThemeData(color: kIconColor),
            elevation: 0,
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                color: kBackgroundColor,
              ),
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: services.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return const SizedBox(height: 25);
          }
          return ListTile(
            title: Text(
              services[index - 1],
              style: servicesTextStyle.copyWith(color: kTextColor),
              textAlign: TextAlign.left,
            ),
            trailing: const Icon(Icons.chevron_right, color: kIconColor),
            onTap: () {},
          );
        },
      ),
    );
  }
}
