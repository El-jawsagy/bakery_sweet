// use a dummyy data
import '../../data/dummy_data.dart';

// Pub and core package
import 'package:flutter/material.dart';

class Category with ChangeNotifier {
  List<Map> _categoryItem = DUMMY_CATEGORIES;
  Map<String, dynamic> selectedCategory = {};
  String selectedCategoryId = "";

  List<Map<String, dynamic>> get categoryItems => _categoryItem;

  List<Map<String, dynamic>> get categoryProductItems => DUMMY_PRODUCTS
      .where((product) => product["category"].contains(selectedCategoryId))
      .toList();

  void changeSelectedCategoryId(String categoryId) {
    selectedCategoryId = categoryId;
    selectedCategory =
        DUMMY_CATEGORIES.firstWhere((category) => category["id"] == categoryId);
    notifyListeners();
  }
}
