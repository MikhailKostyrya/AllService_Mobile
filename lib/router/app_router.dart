import 'package:allservice/features/recover_password/ui/screens/new_password_screen.dart';
import 'package:allservice/features/recover_password/ui/screens/recover_password_screen.dart';
import 'package:allservice/features/recover_password/ui/screens/verification_screen.dart';
import 'package:allservice/features/authorization/ui/authorization_screen.dart';
import 'package:allservice/ui/features/become_seller_screen/become_seller_screen.dart';
import 'package:allservice/ui/features/contacts_screen/contacts_screen.dart';
import 'package:allservice/ui/features/edit_profile_screen/edit_profile_screen.dart';
import 'package:allservice/ui/features/find_service_screen/find_service_screen.dart';
import 'package:allservice/ui/features/main_screen/main_screen.dart';
import 'package:allservice/ui/features/notification_screen/notification_screen.dart';
import 'package:allservice/features/onboarding/ui/onboarding_screen.dart';
import 'package:allservice/ui/features/private_policy_screen/private_policy_screen.dart';
import 'package:allservice/ui/features/profile_screen/profile_screen.dart';
import 'package:allservice/ui/features/request_complete_screen/request_complete_screen.dart';
import 'package:allservice/ui/features/service_history_screen/service_history_screen.dart';
import 'package:allservice/ui/features/service_list_screen/service_list_screen.dart';
import 'package:allservice/ui/features/service_request_screen/service_request_screen.dart';
import 'package:allservice/ui/features/settings_screen/settings_screen.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: AuthorizationRoute.page,
      initial: true
    ),
    AutoRoute(
      page: BecomeSellerRoute.page
    ),
    AutoRoute(
      page: ContactsRoute.page
    ),
    AutoRoute(
      page: EditProfileRoute.page
    ),
    AutoRoute(
      page: FindServiceRoute.page
    ),
    AutoRoute(
      page: MainRoute.page
    ),
    AutoRoute(
      page: NotificationRoute.page
    ),
    AutoRoute(
      page: OnboardingRoute.page,
      initial: true
    ),
    AutoRoute(
      page: PrivatePolicyRoute.page
    ),
    AutoRoute(
      page: ProfileRoute.page
    ),
    AutoRoute(
      page: RecoverPasswordRoute.page,
      initial: true
    ),
    AutoRoute(
      page: RequestCompleteRoute.page
    ),
    AutoRoute(
      page: ServiceHistoryRoute.page
    ),
    AutoRoute(
      page: ServiceListRoute.page
    ),
    AutoRoute(
      page: ServiceRequestRoute.page
    ),
    AutoRoute(
      page: SettingsRoute.page
    ),
    AutoRoute(
      page: VerificationRoute.page
    ),
  ];
}