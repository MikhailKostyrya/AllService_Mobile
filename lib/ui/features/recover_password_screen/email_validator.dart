import 'package:flutter/material.dart';

class EmailValidator extends ChangeNotifier {
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

  void updatePasswords(String newPassword, String confirmPassword) {
    _newPassword = newPassword;
    _confirmPassword = confirmPassword;
    _isEqual = _isPasswordSame(newPassword, confirmPassword);
  }

  bool _validateEmail(String email) {
    final RegExp emailRegExp = RegExp(
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
    );
    return emailRegExp.hasMatch(email);
  }

  bool _isPasswordSame(String newPassword, String confirmPassword) {
    return newPassword == confirmPassword;
  }
}
