import 'package:flutter/material.dart';
import 'package:mystore/models/product_model.dart';
import 'package:mystore/utils/listners_utils.dart';
import '../data/app_exception.dart';
import '../data/base_api.dart';
import '../data/network_api.dart';
import '../utils/constants/api_endpoints.dart';
import '../utils/constants/colorpallets.dart';

class ProductRepository {
  BaseApi _apiServices = networkApi();

// function to fetch all products from backend database
  Future getAllProductsRepo(context) async {
    try {
      var apiRes = await _apiServices.getApiResponse(
          ApiEndpointsUrl.getAllProducts, context);
      ProductModel apiresponse = ProductModel(
          message: apiRes["message"],
          products: apiRes["products"],
          success: apiRes["success"]);
      return apiresponse;
    } catch (ex) {
      ListnersUtils.showFlushbarMessage("${ex.toString()}", Colors.redAccent,
          TheamColors.PtexrtColor2, "Error", Icons.done, context);
      throw UnhandledException(message: "").msgString();
    }
  }

  // function to fetch all products from backend database
  Future ProductsQueryRepo(context, queryData) async {
    try {
      var apiRes = await _apiServices.getApiResponse(
          ApiEndpointsUrl.searchProducts + queryData, context);
      ProductModel apiresponse = ProductModel(
          message: apiRes["message"],
          products: apiRes["sortproduct"],
          success: apiRes["success"]);
      return apiresponse;
    } catch (ex) {
      ListnersUtils.showFlushbarMessage("${ex.toString()}", Colors.redAccent,
          TheamColors.PtexrtColor2, "Error", Icons.done, context);
      // print(ex);
      throw UnhandledException(message: "").msgString();
    }
  }
}
