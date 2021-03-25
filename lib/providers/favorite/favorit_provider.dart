// use a dummyy data
import '../../data/dummy_data.dart';

// Pub and core package
import 'package:flutter/material.dart';

class Favorite with ChangeNotifier {
  List<Map> _favoritItems = [];

  List<Map> get favoritItems => _favoritItems;

  void toggleProductToFavorite(
    String itemId,
  ) {
    final currentIndex = _favoritItems.indexWhere((product) {
      return product["id"] == itemId;
    });
    if (currentIndex >= 0) {
      _favoritItems.removeAt(currentIndex);
    } else {
      _favoritItems
          .add(DUMMY_PRODUCTS.firstWhere((product) => product["id"] == itemId));
    }
    notifyListeners();
  }

  bool isFavorited(itemId) {
    return _favoritItems.any((product) {
      return product["id"] == itemId;
    });
  }
}
