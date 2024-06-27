import 'package:allservice/allservice_app.dart';
import 'package:allservice/di/configure_dependencies.dart';
import 'package:allservice/di/dependencies.dart';
import 'package:allservice/features/authorization/provider/authorization_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthorizationScreenProvider(getIt<Dependencies>().authRepository)
        ),
      ],
      child: const AllServiceApp()
    )
  );
}