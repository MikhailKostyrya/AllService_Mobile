import 'package:allservice/allservice_app.dart';
import 'package:allservice/di/configure_dependencies.dart';
import 'package:allservice/di/dependencies.dart';
import 'package:allservice/features/authorization/provider/authorization_screen_provider.dart';
import 'package:allservice/features/catalog/data/repository/category_repository.dart';
import 'package:allservice/features/catalog/data/service/category_service.dart';
import 'package:allservice/features/catalog/provider/category_provider.dart';
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
          create: (_) => CategoryProvider(
            categoryRepository: CategoryRepository(
              categoryService: CategoryService(),
            ),
          ),
        ),
      ],
      child: const AllServiceApp(),
    ),
  );
}
