import 'package:flutter/material.dart';
import 'package:mystore/data/base_api.dart';
import 'package:mystore/data/network_api.dart';
import 'package:mystore/models/cart_model.dart';
import 'package:mystore/utils/constants/api_endpoints.dart';
import '../utils/constants/colorpallets.dart';
import '../utils/listners_utils.dart';

class CartRepository {
  BaseApi _apiServices = networkApi();

  dynamic apiResponse;
  late CartModel response;

// function to add product to user cart
  Future addToCart(data, context) async {
    try {
      apiResponse = await _apiServices.postApiResponse(
          ApiEndpointsUrl.addToCart, data, context);
      response = CartModel.fromJson(apiResponse);
      return response;
    } catch (ex) {
      ListnersUtils.showFlushbarMessage(
          "Error during adding product try to add product again",
          Colors.redAccent,
          TheamColors.PtexrtColor2,
          "Error",
          Icons.done,
          context);
    }
  }

  // function to view perticular user cart
  Future fetchUserCart(data, context) async {
    try {
      apiResponse = await _apiServices.getApiResponse(
          "${ApiEndpointsUrl.fetchUserCart}" + data, context);
      if (apiResponse['success'] == true) {
        response = CartModel.fromJson(apiResponse);
        return response;
      } else {
        response = CartModel.fromJson(apiResponse);
        return response;
      }
    } catch (ex) {
      ListnersUtils.showFlushbarMessage("${ex.toString()}", Colors.redAccent,
          TheamColors.PtexrtColor2, "Error", Icons.done, context);
    }
  }

  // function to add product to user cart
  Future deletFromCart(data, context) async {
    try {
      apiResponse = await _apiServices.deletApiResponse(
          ApiEndpointsUrl.deletUserCart, data, context);
      return apiResponse;
    } catch (ex) {
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
