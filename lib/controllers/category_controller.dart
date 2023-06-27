import 'package:flutter/foundation.dart';
import 'package:mystore/models/product_model.dart';
import 'package:mystore/repository/product_repo.dart';

import '../models/category_model.dart';
import '../repository/category_repo.dart';

class CategoryController with ChangeNotifier {
  final categoryRepo = CategoryRepository();

  bool _loading = false;
  bool get loading => _loading;

  late ProductModel _products = ProductModel();
  ProductModel get products => _products;

  late CategoryModel _category = CategoryModel();
  CategoryModel get category => _category;

  setLoadingState(bool val) {
    _loading = val;
  }

  // category controller for fetching all categorys
  Future categoryController(context) async {
    try {
      setLoadingState(true);
      var cstegoryRes = await categoryRepo.categoryList(context);
      _category = cstegoryRes;
      setLoadingState(false);
      notifyListeners();
      if (kDebugMode) {
        print("category : ${_category.categorys}");
      }
    } catch (exception) {
      print("exception : $exception");
      setLoadingState(false);
    }
  }

    // fetching all products by category 
  Future fetchProductByCategoryController(context,categoryId) async {
    try {
      setLoadingState(true);
      var productRes = await categoryRepo.getAllProductsByCategory(context,categoryId);
      _products = productRes;
      setLoadingState(false);
      notifyListeners();
      if (kDebugMode) {
        print("products : ${_products.products}");
      }
    } catch (exception) {
      print("exception : $exception");
      setLoadingState(false);
    }
  }

}