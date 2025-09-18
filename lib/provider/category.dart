import 'package:flutter/foundation.dart';
import 'package:internshipproject2/midel/categorylisrmodel.dart';
import 'package:internshipproject2/services/category.dart';

class CategoryProvider with ChangeNotifier {
  final CategoryService _categoryService = CategoryService();

  bool isLoading = false;
  Categorymodellist? categoryModelList;

  /// Load all categories
  Future<void> loadCategories() async {
    isLoading = true;
    notifyListeners();

    categoryModelList = await _categoryService.fetchCategories();

    isLoading = false;
    notifyListeners();
  }
}
