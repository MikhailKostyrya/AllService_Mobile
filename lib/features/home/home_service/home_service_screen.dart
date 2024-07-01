import 'package:allservice/features/home/home_service/widgets/filter_options.dart';
import 'package:allservice/features/home/home_service/widgets/service_card.dart';
import 'package:allservice/res/theme/theme.dart';
import 'package:flutter/material.dart';

class HomeServiceScreen extends StatefulWidget {
  const HomeServiceScreen({Key? key}) : super(key: key);

  @override
  _HomeServiceScreenState createState() => _HomeServiceScreenState();
}

class _HomeServiceScreenState extends State<HomeServiceScreen> {
  Color _backgroundColor = kBackgroundColor;

  void _showFilterOptions() {
    setState(() {
      _backgroundColor = kPrimaryColor;
    });
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return FilterOptions(
          onDismiss: () {
            setState(() {
              _backgroundColor = kBackgroundColor;
            });
          },
        );
      },
    ).whenComplete(() {
      setState(() {
        _backgroundColor = kBackgroundColor;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 40.0),
          Container(
            color: _backgroundColor,
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Row(
                  children: [
                    Spacer(),
                    Icon(Icons.location_on),
                    SizedBox(width: 8.0),
                    Text('Москва'),
                    Spacer(),
                  ],
                ),
                const SizedBox(height: 16.0),
                Row(
                  children: [
                    Container(
                      width: 298.0,
                      height: 52.0,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Поиск',
                          hintStyle: const TextStyle(color: Colors.black),
                          suffixIcon: const Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: kGreyColor3,
                        ),
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    Expanded(
                      child: InkWell(
                        onTap: _showFilterOptions,
                        child: Container(
                          width: 52.0,
                          height: 52.0,
                          decoration: BoxDecoration(
                            color: kGreyColor3,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: const Icon(Icons.tune),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                  childAspectRatio: 0.75,
                ),
                itemCount: serviceItems.length,
                itemBuilder: (context, index) {
                  final item = serviceItems[index];
                  return ServiceCard(item: item);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ServiceItem {
  final String imageUrl;
  final String title;
  final String provider;
  final String price;

  ServiceItem({
    required this.imageUrl,
    required this.title,
    required this.provider,
    required this.price,
  });
}

final List<ServiceItem> serviceItems = [
  ServiceItem(
    imageUrl: 'assets/icons/photo_service.png',
    title: 'Ремонт стиральных машин и посудомоек',
    provider: 'Андрей Востриков',
    price: 'от 700 ₽',
  ),
  ServiceItem(
    imageUrl: 'assets/icons/photo_service_second.png',
    title: 'Занятия по программированию и робототехнике',
    provider: 'Робокодинг',
    price: 'от 1500 ₽',
  ),
];
