import 'package:allservice/features/catalog/data/model/category.dart';
import 'package:allservice/features/catalog/data/repository/category_repository.dart';
import 'package:flutter/material.dart';


class CategoryProvider with ChangeNotifier {
  final CategoryRepository categoryRepository;

  List<Category> _categories = [];
  List<Category> get categories => _categories;

  CategoryProvider({required this.categoryRepository});

  Future<void> fetchCategories() async {
    _categories = await categoryRepository.getCategories();
    for (var category in _categories) {
      print('Category: ${category.categoryName}, Photo: ${category.photo}');
    }
    notifyListeners();
  }
}

