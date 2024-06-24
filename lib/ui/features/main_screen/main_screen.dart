import 'package:allservice/ui/features/main_screen/service_grid.dart';
import 'package:allservice/ui/features/main_screen/oncoming_service.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

final List<String> category = [
  "Абоба",
  "Ремонт техники",
  "Бэрбэршоп",
  "Бытовые приколы",
  "Простые приколы",
  "Бимбим бамбам",
];

@RoutePage()
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: const Color(0xFFE8E8E8),
        centerTitle: true,
        title: const SearchBar(
          leading: Icon(Icons.search),
          hintText: "Поиск",
        ),
      ),
      backgroundColor: const Color(0xFFE8E8E8),
      body: ListView(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (int i = 0; i < category.length; i++)
                  Padding(
                    padding: const EdgeInsets.only(top: 16, bottom: 32),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
                        child: Text(category[i]),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Text("Предстоящие услуги", style: Theme.of(context).textTheme.titleSmall),
          ),
          const OncomingService(isAproved: true),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Text("Стоит взглянуть", style: Theme.of(context).textTheme.titleSmall),
          ),
          const ServiceGrid(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Text("Для вас", style: Theme.of(context).textTheme.titleSmall),
          ),
          const ServiceGrid(),
        ],
      ),
    );
  }
}
