import 'package:flutter/material.dart';
import 'package:mystore/data/base_api.dart';
import 'package:mystore/data/network_api.dart';
import 'package:mystore/models/cart_model.dart';
import 'package:mystore/models/product_model.dart';
import 'package:mystore/utils/constants/api_endpoints.dart';
import '../models/category_model.dart';
import '../utils/constants/colorpallets.dart';
import '../utils/listners_utils.dart';

class CategoryRepository {
  BaseApi _apiServices = networkApi();

  dynamic apiResponse;

// function to get all category list
  Future categoryList(context) async {
    try {
      apiResponse = await _apiServices.getApiResponse(
          ApiEndpointsUrl.getAllCategory, context);
      CategoryModel response = CategoryModel.fromJson(apiResponse);
      return response;
    } catch (ex) {
      print(ex);
      ListnersUtils.showFlushbarMessage(
          "Internal server error",
          Colors.redAccent,
          TheamColors.PtexrtColor2,
          "Error",
          Icons.done,
          context);
    }
  }

  // function to get product according to category
  Future getAllProductsByCategory(context, categoryId) async {
    try {
      var apiResponse = await _apiServices.getApiResponse(
          ApiEndpointsUrl.getAllProductsByCategory + categoryId, context);
      ProductModel response = ProductModel.fromJson(apiResponse);
      return response;
    } catch (ex) {
      ListnersUtils.showFlushbarMessage(
          "Internal server error",
          Colors.redAccent,
          TheamColors.PtexrtColor2,
          "Error",
          Icons.done,
          context);
    }
  }
}
