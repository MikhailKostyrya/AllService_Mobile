import 'package:allservice/features/profile/provider/service_history_screen_provider.dart';
import 'package:allservice/res/constants/font_constants.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage()
class ServiceHistoryScreen extends StatefulWidget {
  const ServiceHistoryScreen({super.key});

  @override
  State<ServiceHistoryScreen> createState() => _ServiceHistoryScreenState();
}

class _ServiceHistoryScreenState extends State<ServiceHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ServiceHistoryScreenProvider>(context);
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
              children: [
                Text("История услуг", style: meduimTitleTextStyle),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
