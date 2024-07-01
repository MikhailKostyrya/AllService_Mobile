import 'package:allservice/router/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class SettingsScreenProvider extends ChangeNotifier {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

   void backToProfile(BuildContext context) {
    AutoRouter.of(context).popForced(const ProfileRoute());
  }
}
