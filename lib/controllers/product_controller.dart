
import 'package:flutter/foundation.dart';
import 'package:mystore/models/product_model.dart';
import 'package:mystore/repository/product_repo.dart';


class ProductController with ChangeNotifier {
  final productRepo = ProductRepository();

  bool _loading = false;
  bool get loading => _loading;

  late ProductModel _products =
      ProductModel(message: "", products: [], success: false);
  ProductModel get products => _products;

    late ProductModel _searchProducts =
      ProductModel(message: "", products: [], success: false);
  ProductModel get searchProducts => _searchProducts;

  setLoadingState(bool val) {
    _loading = val;
  }

  // product  controller for fetching all products
  Future getAllProductsController(context) async {
    try {
      setLoadingState(true);
      var productsRes = await productRepo.getAllProductsRepo(context);
      _products = productsRes;
      setLoadingState(false);
      notifyListeners();
      if (kDebugMode) {
        print("products : ${products.products}");
      }
    } catch (exception) {
      print("exception : $exception");
      setLoadingState(false);
    }
  }

  // product controller for searching product
  Future searchProductsController(context, searchInputData) async {
    try {
      setLoadingState(true);
      var productsRes = await productRepo.ProductsQueryRepo(
          context, "?input=$searchInputData");
      _searchProducts = productsRes;
      setLoadingState(false);
      notifyListeners();
      if (kDebugMode) {
        print("products : ${products.products}");
      }
    } catch (exception) {
      print("exception : $exception");
      setLoadingState(false);
    }
  }

  // ?input=oneplus
}
