import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user.dart';

class AuthService {
  static const String _baseUrl = 'http://158.160.91.177:8000/auth/register/';

  Future<String> register(User user) async {
    final response = await http.post(
      Uri.parse(_baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(user.toJson()),
    );

    if (response.statusCode == 201) {
      return 'success';
    } else if (response.statusCode == 401) {
      return 'Ошибка 401: Неавторизованный доступ';
    } else {
      final errorResponse = jsonDecode(response.body);
      return errorResponse['message'] ?? 'Ошибка регистрации';
    }
  }
}
