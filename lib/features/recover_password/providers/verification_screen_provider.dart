import 'package:flutter/material.dart';

class VerificationScreenProvider extends ChangeNotifier {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController pinController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> sendPin(BuildContext context) async {
    if (formKey.currentState?.validate() ?? false) {
      _setLoading(true);
      try {} catch (e) {
        _setLoading(false);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Wrong pin: $e')));
      }
    }
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  @override
  void dispose() {
    pinController.dispose();
    super.dispose();
  }
}
