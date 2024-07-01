import 'package:allservice/features/profile/provider/edit_profile_screen_provider.dart';
import 'package:allservice/features/profile/ui/widgets/edit_field.dart';
import 'package:allservice/features/profile/ui/widgets/menu_item.dart';
import 'package:allservice/res/constants/constants.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage()
class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<EditProfileScreenProvider>(context, listen: false).getUsersInfo(context);
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<EditProfileScreenProvider>(context);
    final user = provider.user;
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
                Text("Мои Данные", style: meduimTitleTextStyle),
                const SizedBox(height: 21),
                Hero(
                  tag: 'edit',
                  child: CircleAvatar(
                    radius: 91,
                    backgroundImage: NetworkImage('$baseUrl${user?.photo}'),
                  ),
                ),
                const SizedBox(height: 32),
                EditField(title: "Имя", controller: provider.nameController),
                const SizedBox(height: 16),
                EditField(title: "Фамилия", controller: provider.surnameController),
                const SizedBox(height: 16),
                EditField(title: "Почта", controller: provider.emailController),
                const SizedBox(height: 34),
                MenuItem(
                  title: "Изменить пароль",
                  onTap: () {
                    provider.navigateToChangePassword(context);
                  },
                  suffixWidget: const Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                  ),
                  style: inputFieldTextStyle,
                ),
                const SizedBox(height: 75),
                ElevatedButton(
                  child: const Text('Сохранить'),
                  onPressed: () {
                    provider.setUserDetails(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
