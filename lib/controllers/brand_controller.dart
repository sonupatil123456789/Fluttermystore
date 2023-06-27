import 'package:flutter/foundation.dart';
import 'package:mystore/models/brand_model.dart';
import 'package:mystore/models/product_model.dart';
import 'package:mystore/repository/brand_repo.dart';

import '../models/category_model.dart';
import '../repository/category_repo.dart';

class BrandController with ChangeNotifier {
  final brandRepo = BrandRepository();

  bool _loading = false;
  bool get loading => _loading;

  late ProductModel _products = ProductModel();
  ProductModel get products => _products;

  late BrandModel _brand = BrandModel();
  BrandModel get brand => _brand;

  setLoadingState(bool val) {
    _loading = val;
  }

  // brand controller for fetching all brand
  Future brandController(context) async {
    try {
      setLoadingState(true);
      var cstegoryRes = await brandRepo.brandList(context);
      _brand = cstegoryRes;
      setLoadingState(false);
      notifyListeners();
      if (kDebugMode) {
        print("_brand : ${_brand.brands}");
      }
    } catch (exception) {
      print("exception : $exception");
      setLoadingState(false);
    }
  }

    // fetching all products by brand 
  Future fetchProductByBrandController(context,brandId) async {
    try {
      setLoadingState(true);
      var productRes = await brandRepo.getAllProductsByBrand(context,brandId);
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