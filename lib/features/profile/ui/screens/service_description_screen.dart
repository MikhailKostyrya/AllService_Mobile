import 'package:allservice/features/profile/provider/service_description_screen_provider.dart';
import 'package:allservice/features/profile/ui/widgets/service_description_item.dart';
import 'package:allservice/res/constants/constants.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage()
class ServiceDescriptionScreen extends StatelessWidget {
  const ServiceDescriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ServiceDescriptionScreenProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            provider.backToProfile(context);
          },
          child: const Icon(Icons.arrow_back_ios, size: 20),
        ),
      ),
      body: Form(
        key: provider.formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 27),
                Hero(
                  tag: 'request',
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      'https://avatars.mds.yandex.net/get-kinopoisk-image/1900788/88b99c0b-9bfb-4804-bd2e-80f07f487d68/orig',
                      width: double.infinity,
                      height: 231,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                Text(
                  "Химчистка мебели",
                  style: titleTextStyle,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 16),
                Container(
                  width: double.infinity,
                  height: 244,
                  decoration: BoxDecoration(
                    color: kGreyColor3,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 26),
                    child: Column(
                      children: [
                        const ServiceDescriptionItem(title: 'Дата:', content: "01.07.2004"),
                        const SizedBox(height: 12),
                        const ServiceDescriptionItem(title: 'Время:', content: "18:00"),
                        const SizedBox(height: 12),
                        const ServiceDescriptionItem(title: 'Стоимость:', content: "1000"),
                        const SizedBox(height: 12),
                        const ServiceDescriptionItem(title: 'Адрес:', content: "Дома"),
                        const SizedBox(height: 30),
                        Text(
                          "Выполнено",
                          style: requestDescriptionTextStyle.copyWith(color: kPrimaryColor, fontSize: 24),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
