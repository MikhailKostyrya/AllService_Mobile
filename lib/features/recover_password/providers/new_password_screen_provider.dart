import 'package:flutter/material.dart';

class NewPasswordScreenProvider extends ChangeNotifier {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String _newPassword = '';
  String _confirmPassword = '';
  bool _isEqual = false;

  String get newPassword => _newPassword;
  String get confirmPassword => _confirmPassword;
  bool get isEqual => _isEqual;

  void updateNewPassword(String newPassword) {
    _newPassword = newPassword;
    _isEqual = _isPasswordSEqual(newPassword, _confirmPassword);
    notifyListeners();
  }

  void updateConfirmPassword(String confirmPassword) {
    _confirmPassword = confirmPassword;
    _isEqual = _isPasswordSEqual(_newPassword, confirmPassword);
    notifyListeners();
  }
  bool _isPasswordSEqual(String newPassword, String confirmPassword) {
    return newPassword == confirmPassword;
  }
}
