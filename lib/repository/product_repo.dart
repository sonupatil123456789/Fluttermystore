import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:mystore/models/product_model.dart';
import 'package:mystore/utils/listners_utils.dart';
import '../data/app_exception.dart';
import '../data/base_api.dart';
import '../data/network_api.dart';
import '../utils/constants/api_endpoints.dart';
import '../utils/constants/colorpallets.dart';

class ProductRepository {
  BaseApi _apiServices = networkApi();

  dynamic apiResponse;
  late ProductModel response;

// function to fetch all products from backend database
  Future getAllProductsRepo(context) async {
    try {
      apiResponse = await _apiServices.getApiResponse(
          ApiEndpointsUrl.getAllProducts, context);
      response = ProductModel.fromJson(apiResponse);
      return response;
    } catch (ex) {
      ListnersUtils.showFlushbarMessage("${ex.toString()}", Colors.redAccent,
          TheamColors.PtexrtColor2, "Error", Icons.done, context);
    }
  }

  // function to fetch all products from backend database
  Future productsQueryRepo(context, queryData) async {
    try {
      apiResponse = await _apiServices.getApiResponse(
          ApiEndpointsUrl.searchProducts + queryData, context);
      response = ProductModel.fromJson(apiResponse);
      return response;
    } catch (ex) {
      ListnersUtils.showFlushbarMessage("${ex.toString()}", Colors.redAccent,
          TheamColors.PtexrtColor2, "Error", Icons.done, context);
    }
  }

  // function to filter fetch all products from backend database for homescreen
  Future homeScreenRepo(context, endpoint) async {
    try {
      apiResponse = await _apiServices.getApiResponse(endpoint, context);
      response = ProductModel.fromJson(apiResponse);
      return response;
    } catch (ex) {
      ListnersUtils.showFlushbarMessage("${ex.toString()}", Colors.redAccent,
          TheamColors.PtexrtColor2, "Error", Icons.done, context);
    }
  }

  // function to filter fetch all products from backend database for product filters
  Future filterProductRepo(context, queryData) async {
    print(ApiEndpointsUrl.getAllProducts + queryData);
    try {
      apiResponse = await _apiServices.getApiResponse(
          ApiEndpointsUrl.getAllProducts + queryData, context);
      response = ProductModel.fromJson(apiResponse);
      return response;
    } catch (ex) {
      ListnersUtils.showFlushbarMessage("${ex.toString()}", Colors.redAccent,
          TheamColors.PtexrtColor2, "Error", Icons.done, context);
    }
  }

  // function to filter like products
  Future likeRatingRepo(context, data) async {
    try {
      apiResponse = await _apiServices.updateApiResponse(
          ApiEndpointsUrl.likeProducts, data, context);

      // print("xxxxxxxxxxxxxxxxxxxxxxxxx$apiResponse");
      // response = ProductModel.fromJson(apiResponse);
      return response;
    } catch (ex) {
      ListnersUtils.showFlushbarMessage("${ex.toString()}", Colors.redAccent,
          TheamColors.PtexrtColor2, "Error", Icons.done, context);
    }
  }
}
