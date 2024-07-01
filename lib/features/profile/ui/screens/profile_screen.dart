import 'package:allservice/features/profile/provider/profile_screen_provider.dart';
import 'package:allservice/features/profile/ui/widgets/account_action.dart';
import 'package:allservice/features/profile/ui/widgets/menu_item.dart';
import 'package:allservice/features/profile/ui/widgets/service_request.dart';
import 'package:allservice/res/constants/constants.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

@RoutePage()
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<ProfileScreenProvider>(context, listen: false).fetchUserProfile(context);
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProfileScreenProvider>(context);
    final user = provider.user;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: provider.isLoading
            ? const Center(child: CircularProgressIndicator())
            : Form(
                key: provider.formKey,
                child: Center(
                  child: Column(
                    children: [
                      const SizedBox(height: 48),
                      GestureDetector(
                        onTap: () {
                          provider.navigateToEditProfile(context);
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Hero(
                                tag: 'edit',
                                child: CircleAvatar(
                                  radius: 50,
                                  backgroundImage: NetworkImage('$baseUrl${user?.photo}'),
                                ),
                              ),
                              const SizedBox(width: 31.0),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${user?.firstName ?? ''} ${user?.secondName ?? ''}',
                                    style: smallTitleTextStyle,
                                  ),
                                  const SizedBox(height: 10.0),
                                  Text(
                                    user?.isExecutor ?? false ? 'Исполнитель' : 'Покупатель',
                                    style: mainTextSyle.copyWith(
                                      color: kPrimaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Текущие заявки",
                          style: smallTitleTextStyle,
                        ),
                      ),
                      const SizedBox(height: 16),
                      ServiceRequest(
                        onTap: () {
                          provider.navigateToRequestDescription(context);
                        },
                      ),
                      const SizedBox(height: 30),
                      MenuItem(
                        title: 'История услуг',
                        onTap: () {
                          provider.navigateToHistory(context);
                        },
                        suffixWidget: const Icon(
                          Icons.arrow_forward_ios,
                          size: 20,
                        ),
                        style: mainTextSyle,
                      ),
                      const SizedBox(height: 12),
                      MenuItem(
                        title: 'Настройки',
                        onTap: () {
                          provider.navigateToSettings(context);
                        },
                        suffixWidget: const Icon(
                          Icons.arrow_forward_ios,
                          size: 20,
                        ),
                        style: mainTextSyle,
                      ),
                      const SizedBox(height: 6),
                      SvgPicture.asset(
                        'assets/images/profile/become_salesman.svg',
                      ),
                      const SizedBox(height: 12),
                      AccountAction(
                        title: 'Выйти из аккаунта',
                        onTap: () {},
                      ),
                      const SizedBox(height: 12),
                      AccountAction(
                        title: 'Удалить аккаунт',
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
