// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AuthorizationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AuthorizationScreen(),
      );
    },
    ChangePasswordRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ChangePasswordScreen(),
      );
    },
    EditProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const EditProfileScreen(),
      );
    },
    NewPasswordRoute.name: (routeData) {
      final args = routeData.argsAs<NewPasswordRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: NewPasswordScreen(
          key: args.key,
          email: args.email,
          verificationCode: args.verificationCode,
        ),
      );
    },
    OnboardingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OnboardingScreen(),
      );
    },
    ProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfileScreen(),
      );
    },
    RecoverPasswordRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RecoverPasswordScreen(),
      );
    },
    ServiceDescriptionRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ServiceDescriptionScreen(),
      );
    },
    ServiceHistoryRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ServiceHistoryScreen(),
      );
    },
    SettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingsScreen(),
      );
    },
    VerificationRoute.name: (routeData) {
      final args = routeData.argsAs<VerificationRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: VerificationScreen(
          key: args.key,
          email: args.email,
        ),
      );
    },
  };
}

/// generated route for
/// [AuthorizationScreen]
class AuthorizationRoute extends PageRouteInfo<void> {
  const AuthorizationRoute({List<PageRouteInfo>? children})
      : super(
          AuthorizationRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthorizationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ChangePasswordScreen]
class ChangePasswordRoute extends PageRouteInfo<void> {
  const ChangePasswordRoute({List<PageRouteInfo>? children})
      : super(
          ChangePasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChangePasswordRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [EditProfileScreen]
class EditProfileRoute extends PageRouteInfo<void> {
  const EditProfileRoute({List<PageRouteInfo>? children})
      : super(
          EditProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'EditProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [NewPasswordScreen]
class NewPasswordRoute extends PageRouteInfo<NewPasswordRouteArgs> {
  NewPasswordRoute({
    Key? key,
    required String email,
    required String verificationCode,
    List<PageRouteInfo>? children,
  }) : super(
          NewPasswordRoute.name,
          args: NewPasswordRouteArgs(
            key: key,
            email: email,
            verificationCode: verificationCode,
          ),
          initialChildren: children,
        );

  static const String name = 'NewPasswordRoute';

  static const PageInfo<NewPasswordRouteArgs> page =
      PageInfo<NewPasswordRouteArgs>(name);
}

class NewPasswordRouteArgs {
  const NewPasswordRouteArgs({
    this.key,
    required this.email,
    required this.verificationCode,
  });

  final Key? key;

  final String email;

  final String verificationCode;

  @override
  String toString() {
    return 'NewPasswordRouteArgs{key: $key, email: $email, verificationCode: $verificationCode}';
  }
}

/// generated route for
/// [OnboardingScreen]
class OnboardingRoute extends PageRouteInfo<void> {
  const OnboardingRoute({List<PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProfileScreen]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RecoverPasswordScreen]
class RecoverPasswordRoute extends PageRouteInfo<void> {
  const RecoverPasswordRoute({List<PageRouteInfo>? children})
      : super(
          RecoverPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'RecoverPasswordRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ServiceDescriptionScreen]
class ServiceDescriptionRoute extends PageRouteInfo<void> {
  const ServiceDescriptionRoute({List<PageRouteInfo>? children})
      : super(
          ServiceDescriptionRoute.name,
          initialChildren: children,
        );

  static const String name = 'ServiceDescriptionRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ServiceHistoryScreen]
class ServiceHistoryRoute extends PageRouteInfo<void> {
  const ServiceHistoryRoute({List<PageRouteInfo>? children})
      : super(
          ServiceHistoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'ServiceHistoryRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SettingsScreen]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [VerificationScreen]
class VerificationRoute extends PageRouteInfo<VerificationRouteArgs> {
  VerificationRoute({
    Key? key,
    required String email,
    List<PageRouteInfo>? children,
  }) : super(
          VerificationRoute.name,
          args: VerificationRouteArgs(
            key: key,
            email: email,
          ),
          initialChildren: children,
        );

  static const String name = 'VerificationRoute';

  static const PageInfo<VerificationRouteArgs> page =
      PageInfo<VerificationRouteArgs>(name);
}

class VerificationRouteArgs {
  const VerificationRouteArgs({
    this.key,
    required this.email,
  });

  final Key? key;

  final String email;

  @override
  String toString() {
    return 'VerificationRouteArgs{key: $key, email: $email}';
  }
}
