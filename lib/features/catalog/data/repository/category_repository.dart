import 'package:allservice/features/catalog/data/model/category.dart';
import 'package:allservice/features/catalog/data/service/category_service.dart';

class CategoryRepository {
  final CategoryService categoryService;

  CategoryRepository({required this.categoryService});

  Future<List<Category>> getCategories() async {
    return await categoryService.fetchCategories();
  }
}
