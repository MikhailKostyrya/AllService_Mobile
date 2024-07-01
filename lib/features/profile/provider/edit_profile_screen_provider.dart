import 'package:allservice/features/profile/data/domain/profile_request.dart';
import 'package:allservice/features/profile/data/model/user.dart';
import 'package:allservice/features/profile/data/repository/profile_repository.dart';
import 'package:allservice/router/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class EditProfileScreenProvider extends ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final ProfileRepository _profileRepository;

  EditProfileScreenProvider(this._profileRepository);

  User? user;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> getUsersInfo(BuildContext context) async {
    final request = ProfileRequest();
    user = await _profileRepository.getUserProfile(request: request);
    nameController.text = user!.firstName;
    surnameController.text = user!.secondName;
    emailController.text = user!.email;
    notifyListeners();
  }

  Future<void> setUserDetails(BuildContext context) async {
    final request = ProfileUpdateRequest(
      firstName: nameController.text,
      secondName: surnameController.text,
      email: emailController.text,
      contact: "1",
      isExecutor: true,
      executor: null,
    );

    await _profileRepository.updateUserProfile(request: request);
    notifyListeners();
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void navigateToChangePassword(BuildContext context) {
    AutoRouter.of(context).push(const ChangePasswordRoute());
  }

  void backToProfile(BuildContext context) {
    AutoRouter.of(context).popForced(const ProfileRoute());
  }

  @override
  void dispose() {
    nameController.dispose();
    surnameController.dispose();
    emailController.dispose();
    super.dispose();
  }
}
