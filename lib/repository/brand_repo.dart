import 'package:flutter/material.dart';
import 'package:mystore/data/base_api.dart';
import 'package:mystore/data/network_api.dart';
import 'package:mystore/models/brand_model.dart';
import 'package:mystore/models/product_model.dart';
import 'package:mystore/utils/constants/api_endpoints.dart';
import '../utils/constants/colorpallets.dart';
import '../utils/listners_utils.dart';

class BrandRepository {
  BaseApi _apiServices = networkApi();

  dynamic apiResponse;

// function to get all brand list
  Future brandList(context) async {
    try {
      apiResponse = await _apiServices.getApiResponse(
          ApiEndpointsUrl.getAllBrand, context);

      print("=====================$apiResponse");
      BrandModel response = BrandModel.fromJson(apiResponse);
      print("=====================$apiResponse");
      return response;
    } catch (ex, stack) {
      print(ex);
      print("=====================$stack");
      ListnersUtils.showFlushbarMessage(
          "Internal server error",
          Colors.redAccent,
          TheamColors.PtexrtColor2,
          "Error",
          Icons.done,
          context);
    }
  }

  // function to get product according to brand 
  Future getAllProductsByBrand(context, brandId) async {
    try {
      var apiResponse = await _apiServices.getApiResponse(
          ApiEndpointsUrl.getAllProductsByBrand + brandId, context);
           print("=====================$apiResponse");
      ProductModel response = ProductModel.fromJson(apiResponse);
       print("=====================$apiResponse");
      return response;
    } catch (ex,stack) {
         print(ex);
      print("=====================$stack");
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
