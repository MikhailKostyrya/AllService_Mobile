import 'package:flutter/material.dart';

class RecoverPasswordScreenProvider extends ChangeNotifier {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String _email = '';
  bool _isValid = false;

  

  String get email => _email;
  bool get isValid => _isValid;

  void updateEmail(String email) {
    _email = email;
    _isValid = _validateEmail(email);
    notifyListeners();
  }

  
  bool _validateEmail(String email) {
    final RegExp emailRegExp = RegExp(
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
    );
    return emailRegExp.hasMatch(email);
  }


}
