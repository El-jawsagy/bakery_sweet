import 'package:bakery_sweet/data/dummy_data.dart';
import 'package:flutter/cupertino.dart';

class Product with ChangeNotifier {
  List<Map> _productItem = DUMMY_PRODUCTS;

  List<Map> get productItems => _productItem;

  
}
