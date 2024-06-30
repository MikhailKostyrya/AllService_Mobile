import 'package:allservice/allservice_app.dart';
import 'package:allservice/di/configure_dependencies.dart';
import 'package:allservice/di/dependencies.dart';
import 'package:allservice/features/authorization/provider/authorization_screen_provider.dart';
import 'package:allservice/features/recover_password/provider/new_password_screen_provider.dart';
import 'package:allservice/features/recover_password/provider/recover_password_screen_provider.dart';
import 'package:allservice/features/recover_password/provider/verification_screen_provider.dart';
import 'package:allservice/features/registration/provider/registration_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();  

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthorizationScreenProvider(getIt<Dependencies>().authRepository),
        ),
        ChangeNotifierProvider(
          create: (_) => RegistrationScreenProvider(getIt<Dependencies>().registrationRepository),
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
      ],
      child: const AllServiceApp()
    )
  );
}