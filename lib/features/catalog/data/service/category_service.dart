// data/service/category_service.dart
import 'dart:convert';
import 'package:allservice/features/catalog/data/model/category.dart';
import 'package:allservice/res/constants/constants.dart';
import 'package:http/http.dart' as http;


class CategoryService {
  Future<List<Category>> fetchCategories() async {
    final response = await http.get(
      Uri.parse('$baseUrl/catalog/categories'),
      headers: {'Accept-Charset': 'utf-8'},
    );

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(utf8.decode(response.bodyBytes));
      List<Category> categories = body.map((dynamic item) => Category.fromJson(item)).toList();
      return categories;
    } else {
      throw Exception('Failed to load categories');
    }
  }
}
