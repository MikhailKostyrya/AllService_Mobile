import 'package:allservice/features/recover_password/ui/screens/new_password_screen.dart';
import 'package:allservice/features/recover_password/ui/screens/recover_password_screen.dart';
import 'package:allservice/features/recover_password/ui/screens/verification_screen.dart';
import 'package:allservice/features/authorization/ui/authorization_screen.dart';
import 'package:allservice/features/onboarding/ui/onboarding_screen.dart';
import 'package:allservice/features/registration/ui/registration_screen.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: OnboardingRoute.page,
      initial: true
    ),
    AutoRoute(
      page: AuthorizationRoute.page
    ),
    AutoRoute(
      page: RegistrationRoute.page
    ),
    AutoRoute(
      page: RecoverPasswordRoute.page
    ),
    AutoRoute(
      page: VerificationRoute.page
    ),
    AutoRoute(
      page: NewPasswordRoute.page
    )
  ];
}