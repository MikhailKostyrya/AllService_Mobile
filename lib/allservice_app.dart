import 'package:allservice/res/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:allservice/router/app_router.dart';

class AllServiceApp extends StatefulWidget {
  const AllServiceApp({super.key});

  @override
  State<AllServiceApp> createState() => _AllServiceAppState();
}

class _AllServiceAppState extends State<AllServiceApp> {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _appRouter.config(
        // navigatorObservers: () => [
        //   TalkerRouteObserver(GetIt.I<Talker>()),
        // ],
      ),
      debugShowCheckedModeBanner: false,
      title: 'ПиИТ',
      theme: mainTheme
    );
  }
}