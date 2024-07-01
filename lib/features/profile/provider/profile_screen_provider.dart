// ignore_for_file: use_build_context_synchronously
import 'package:allservice/features/profile/data/domain/profile_request.dart';
import 'package:allservice/features/profile/data/model/user.dart';
import 'package:allservice/features/profile/data/repository/profile_repository.dart';
import 'package:allservice/router/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class ProfileScreenProvider extends ChangeNotifier {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final ProfileRepository profileRepository;

  ProfileScreenProvider(this.profileRepository);

  User? user;
  bool _isLoading = true;
  bool get isLoading => _isLoading;

  Future<void> fetchUserProfile(BuildContext context) async {
    try {
      final request = ProfileRequest();

      user = await profileRepository.getUserProfile(request: request);
      _setLoading(false);
    } catch (e) {
      _setLoading(false);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Profile load failed: $e')));
    }
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void navigateToSettings(BuildContext context) {
    AutoRouter.of(context).push(const SettingsRoute());
  }

  void navigateToHistory(BuildContext context) {
    AutoRouter.of(context).push(const ServiceHistoryRoute());
  }

  void navigateToEditProfile(BuildContext context) {
    AutoRouter.of(context).push(const EditProfileRoute());
  }

  void navigateToServiceHistory(BuildContext context) {
    AutoRouter.of(context).push(const ServiceHistoryRoute());
  }

  void navigateToRequestDescription(BuildContext context) {
    AutoRouter.of(context).push(const ServiceDescriptionRoute());
  }
}
