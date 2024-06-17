import 'package:flutter/material.dart';

class Validator extends ChangeNotifier {
  String _email = '';
  bool _isValid = false;

  String _newPassword = '';
  String _confirmPassword = '';
  bool _isEqual = false;

  String get newPassword => _newPassword;
  String get confirmPassword => _confirmPassword;
  bool get isEqual => _isEqual;

  String get email => _email;
  bool get isValid => _isValid;

  void updateEmail(String email) {
    _email = email;
    _isValid = _validateEmail(email);
    notifyListeners();
  }

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

  bool _validateEmail(String email) {
    final RegExp emailRegExp = RegExp(
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
    );
    return emailRegExp.hasMatch(email);
  }

  bool _isPasswordSEqual(String newPassword, String confirmPassword) {
    return newPassword == confirmPassword;
  }
}
