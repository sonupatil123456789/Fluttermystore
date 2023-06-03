import 'package:flutter/material.dart';
import 'package:mystore/data/base_api.dart';
import 'package:mystore/data/network_api.dart';
import 'package:mystore/models/cart_model.dart';
import 'package:mystore/utils/constants/api_endpoints.dart';
import '../models/category_model.dart';
import '../utils/constants/colorpallets.dart';
import '../utils/listners_utils.dart';

class CategoryRepository {
  BaseApi _apiServices = networkApi();

  late CategoryModel apiresponse;

// function to add product to user cart
  Future categoryList(context) async {
    try {
      var apiResponse = await _apiServices.getApiResponse(
          ApiEndpointsUrl.getAllCategory, context);
      print(apiResponse);
      CategoryModel apiresponse = CategoryModel(
          categorys: apiResponse['categorys'],
          message: apiResponse['message'],
          success: apiResponse['success']);
      return apiresponse;
    } catch (ex) {
      print(ex);
      ListnersUtils.showFlushbarMessage(
          "Error during adding product try to add product again",
          Colors.redAccent,
          TheamColors.PtexrtColor2,
          "Error",
          Icons.done,
          context);
    }
  }
}
