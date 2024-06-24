import 'package:allservice/ui/features/main_screen/service_card.dart';
import 'package:flutter/material.dart';

class ServiceGrid extends StatelessWidget {
  const ServiceGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.all(10.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 175 / 270,
        crossAxisCount: 2,
        crossAxisSpacing: 7.5,
        mainAxisSpacing: 7.5,
      ),
      itemCount: services.length,
      itemBuilder: (BuildContext context, int index) {
        return ServiceCard(index: index);
      },
    );
  }
}
