import 'package:allservice/features/profile/provider/settings_screen_provider.dart';
import 'package:allservice/features/profile/ui/widgets/contacts.dart';
import 'package:allservice/features/profile/ui/widgets/menu_item.dart';
import 'package:allservice/res/constants/font_constants.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage()
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool light = true;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SettingsScreenProvider>(context);
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
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Настройки", style: meduimTitleTextStyle),
              const SizedBox(height: 32),
              MenuItem(
                title: "Уведомления",
                onTap: () {},
                suffixWidget: Switch(
                  value: light,
                  onChanged: (bool value) {
                    setState(() {
                      light = value;
                    });
                  },
                ),
                style: mainTextSyle,
              ),
              const SizedBox(height: 16),
              const Contacts(),
              const SizedBox(height: 16),
              MenuItem(
                title: 'Политика конфиденциальности',
                onTap: () {},
                suffixWidget: const Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                ),
                style: mainTextSyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
