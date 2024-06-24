import 'package:allservice/ui/features/authorization_screen/authorization_screen.dart';
import 'package:allservice/ui/features/become_seller_screen/become_seller_screen.dart';
import 'package:allservice/ui/features/contacts_screen/contacts_screen.dart';
import 'package:allservice/ui/features/edit_profile_screen/edit_profile_screen.dart';
import 'package:allservice/ui/features/find_service_screen/find_service_screen.dart';
import 'package:allservice/ui/features/main_screen/main_screen.dart';
import 'package:allservice/ui/features/notification_screen/notification_screen.dart';
import 'package:allservice/ui/features/onboarding_screen/onboarding_screen.dart';
import 'package:allservice/ui/features/private_policy_screen/private_policy_screen.dart';
import 'package:allservice/ui/features/profile_screen/profile_screen.dart';
import 'package:allservice/ui/features/recover_password_screen/recover_password_screen.dart';
import 'package:allservice/ui/features/request_complete_screen/request_complete_screen.dart';
import 'package:allservice/ui/features/service_history_screen/service_history_screen.dart';
import 'package:allservice/ui/features/service_list_screen/service_list_screen.dart';
import 'package:allservice/ui/features/service_request_screen/service_request_screen.dart';
import 'package:allservice/ui/features/settings_screen/settings_screen.dart';
import 'package:allservice/ui/features/verification_screen/verification_screen.dart';
import 'package:auto_route/auto_route.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: AuthorizationRoute.page
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
      page: MainRoute.page,
      initial:true,
    ),
    AutoRoute(
      page: NotificationRoute.page
    ),
    AutoRoute(
      page: OnboardingRoute.page
    ),
    AutoRoute(
      page: PrivatePolicyRoute.page
    ),
    AutoRoute(
      page: ProfileRoute.page
    ),
    AutoRoute(
      page: RecoverPasswordRoute.page
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