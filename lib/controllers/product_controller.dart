import 'package:flutter/foundation.dart';
import 'package:mystore/models/product_model.dart';
import 'package:mystore/repository/product_repo.dart';

import '../utils/constants/api_endpoints.dart';

class ProductController with ChangeNotifier {
  final productRepo = ProductRepository();

  bool _loading = false;

  var newLikeValue;
  bool get loading => _loading;

  late ProductModel _products = ProductModel();
  ProductModel get products => _products;

  late ProductModel _searchProducts = ProductModel();
  ProductModel get searchProducts => _searchProducts;

  late ProductModel _latestProducts = ProductModel();
  ProductModel get latestProducts => _latestProducts;

  late ProductModel _rating = ProductModel();
  ProductModel get rating => _rating;

  late ProductModel _liked = ProductModel();
  ProductModel get liked => _liked;

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
        print("_products : ${_products.message}");
      }
    } catch (exception) {
      print("exception : $exception");
      setLoadingState(false);
    }
  }

  // product controller for searching product insearch bar
  Future searchProductsController(context, searchInputData) async {
    try {
      setLoadingState(true);
      var productsRes = await productRepo.productsQueryRepo(
          context, "?input=$searchInputData");
      _searchProducts = productsRes;
      setLoadingState(false);
      notifyListeners();
      if (kDebugMode) {
        print("_searchProducts : ${_searchProducts.products}");
      }
    } catch (exception) {
      print("exception : $exception");
      setLoadingState(false);
    }
  }

  // product controller for filtering product from home screen lik topRated , highestliked products
  Future mainBannerProducts(context) async {
    try {
      setLoadingState(true);
      var productsRes = await productRepo.homeScreenRepo(
          context, ApiEndpointsUrl.mainBannerProducts);
      _latestProducts = productsRes;
      setLoadingState(false);
      notifyListeners();
      if (kDebugMode) {
        print("_latestProducts : ${_latestProducts.products}");
      }
    } catch (exception) {
      print("exception : $exception");
      setLoadingState(false);
    }
  }

  // product controller for filtering product from home screen lik topRated , highestliked products
  Future mostLikedProducts(context) async {
    try {
      setLoadingState(true);
      var productsRes =
          await productRepo.homeScreenRepo(context, ApiEndpointsUrl.mostLiked);
      _liked = productsRes;
      setLoadingState(false);
      notifyListeners();
      if (kDebugMode) {
        print("_liked : ${_liked.products}");
      }
    } catch (exception) {
      print("exception : $exception");
      setLoadingState(false);
    }
  }

  // product controller for filtering product from home screen lik topRated , highestliked products
  Future HieghestRatedProducts(context) async {
    try {
      setLoadingState(true);
      var productsRes = await productRepo.homeScreenRepo(
          context, ApiEndpointsUrl.hieghestRating);
      _rating = productsRes;
      setLoadingState(false);
      notifyListeners();
      if (kDebugMode) {
        print("_rating : ${_rating.products}");
      }
    } catch (exception) {
      print("exception : $exception");
      setLoadingState(false);
    }
  }

  // product controller for filtering product by price , pricerange , color , discount ptice etc
  Future filterProductsController(context, queryData) async {
    try {
      setLoadingState(true);
      var productsRes = await productRepo.filterProductRepo(context, queryData);
      _products = productsRes;
      setLoadingState(false);
      notifyListeners();
      if (kDebugMode) {
        print("_products : ${_products.products}");
      }
    } catch (exception) {
      print("exception : $exception");
      setLoadingState(false);
    }
  }

  Future likeratingProductsController(context, data) async {
    try {
      print(" $data");

      await productRepo.likeRatingRepo(context, data);
      // notifyListeners();
    } catch (exception) {
      print("exception : $exception");
    }
  }
}
