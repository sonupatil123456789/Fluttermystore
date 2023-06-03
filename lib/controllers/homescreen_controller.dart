import 'package:flutter/foundation.dart';
import 'package:mystore/models/product_model.dart';
import 'package:mystore/repository/product_repo.dart';

import '../models/category_model.dart';
import '../repository/homescreen_repo.dart';

class HomeScreenController with ChangeNotifier {
  final homescreenRepo = CategoryRepository();

  bool _loading = false;
  bool get loading => _loading;

  late ProductModel _products =
      ProductModel(message: "", products: [], success: false);
  ProductModel get products => _products;

  late CategoryModel _category =
      CategoryModel(categorys: [], message: '', success: true);
  CategoryModel get category => _category;

  setLoadingState(bool val) {
    _loading = val;
  }

  // product  controller for fetching all products
  Future categoryController(context) async {
    try {
      setLoadingState(true);
      var cstegoryRes = await homescreenRepo.categoryList(context);
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

  // // product  controller for fetching all products
  // Future categoryController(context) async {
  //   try {
  //     setLoadingState(true);
  //     var productsRes = await productRepo.getAllProductsRepo(context);
  //     _products = productsRes;
  //     setLoadingState(false);
  //     notifyListeners();
  //     if (kDebugMode) {
  //       print("products : ${products.products}");
  //     }
  //   } catch (exception) {
  //     print("exception : $exception");
  //     setLoadingState(false);
  //   }
  // }
}
