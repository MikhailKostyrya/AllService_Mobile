import 'package:allservice/allservice_app.dart';
import 'package:allservice/di/configure_dependencies.dart';
import 'package:allservice/di/dependencies.dart';
import 'package:allservice/features/authorization/provider/authorization_screen_provider.dart';
import 'package:allservice/features/profile/provider/change_password_screen_provider.dart';
import 'package:allservice/features/profile/provider/edit_profile_screen_provider.dart';
import 'package:allservice/features/profile/provider/profile_screen_provider.dart';
import 'package:allservice/features/profile/provider/service_description_screen_provider.dart';
import 'package:allservice/features/profile/provider/service_history_screen_provider.dart';
import 'package:allservice/features/profile/provider/settings_screen_provider.dart';
import 'package:allservice/features/recover_password/provider/new_password_screen_provider.dart';
import 'package:allservice/features/recover_password/provider/recover_password_screen_provider.dart';
import 'package:allservice/features/recover_password/provider/verification_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (_) => EditProfileScreenProvider(getIt<Dependencies>().profileRepository),
    ),
    ChangeNotifierProvider(
      create: (_) => ProfileScreenProvider(getIt<Dependencies>().profileRepository),
    ),
    ChangeNotifierProvider(
      create: (_) => ChangePasswordScreenProvider(),
    ),
    ChangeNotifierProvider(
      create: (_) => SettingsScreenProvider(),
    ),
    ChangeNotifierProvider(
      create: (_) => ServiceHistoryScreenProvider(),
    ),
    ChangeNotifierProvider(
      create: (_) => ServiceDescriptionScreenProvider(),
    ),
    ChangeNotifierProvider(
      create: (_) => AuthorizationScreenProvider(getIt<Dependencies>().authRepository),
    ),
    ChangeNotifierProvider(
      create: (_) => RecoverPasswordScreenProvider(getIt<Dependencies>().recoverPasswordService),
    ),
    ChangeNotifierProvider(
      create: (_) => VerificationScreenProvider(getIt<Dependencies>().recoverPasswordService),
    ),
    ChangeNotifierProvider(
      create: (_) => NewPasswordScreenProvider(getIt<Dependencies>().recoverPasswordService),
    ),
  ], child: const AllServiceApp()));
}
