import 'package:allservice/features/authorization/ui/authorization_screen.dart';
import 'package:allservice/features/profile/ui/screens/change_password_screen.dart';
import 'package:allservice/features/profile/ui/screens/profile_screen.dart';
import 'package:allservice/features/profile/ui/screens/service_description_screen.dart';
import 'package:allservice/features/profile/ui/screens/service_history_screen.dart';
import 'package:allservice/features/profile/ui/screens/settings_screen.dart';
import 'package:allservice/features/profile/ui/screens/edit_profile_screen.dart';
import 'package:allservice/features/onboarding/ui/onboarding_screen.dart';
import 'package:allservice/features/recover_password/ui/screens/new_password_screen.dart';
import 'package:allservice/features/recover_password/ui/screens/recover_password_screen.dart';
import 'package:allservice/features/recover_password/ui/screens/verification_screen.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: AuthorizationRoute.page,
          initial: true,
        ),
        AutoRoute(
          page: EditProfileRoute.page,
        ),
        AutoRoute(
          page: MainRoute.page,
        ),
        AutoRoute(
          page: OnboardingRoute.page,
        ),
        AutoRoute(
          page: ProfileRoute.page,
        ),
        AutoRoute(
          page: RecoverPasswordRoute.page,
        ),
        AutoRoute(
          page: ServiceHistoryRoute.page,
        ),
        AutoRoute(
          page: SettingsRoute.page,
        ),
        AutoRoute(
          page: VerificationRoute.page,
        ),
        AutoRoute(
          page: ChangePasswordRoute.page,
        ),
        AutoRoute(
          page: ServiceDescriptionRoute.page,
        ),
      ];
}
