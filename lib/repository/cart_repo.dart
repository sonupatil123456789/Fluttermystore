import 'package:flutter/material.dart';
import 'package:mystore/data/base_api.dart';
import 'package:mystore/data/network_api.dart';
import 'package:mystore/models/cart_model.dart';
import 'package:mystore/utils/constants/api_endpoints.dart';
import '../utils/constants/colorpallets.dart';
import '../utils/listners_utils.dart';

class CartRepository {
  BaseApi _apiServices = networkApi();

  late Map apiResponse;

// function to add product to user cart
  Future addToCart(data, context) async {
    print("repo data $data");
    try {
      apiResponse = await _apiServices.postApiResponse(
          ApiEndpointsUrl.addToCart, data, context);
      print("data is from data = =====$data");
      CartModel apiresponse = CartModel(
          message: apiResponse['message'],
          newCart: NewCart(
              user: apiResponse['newCart']["user"],
              id: apiResponse['newCart']["_id"],
              items: apiResponse['newCart']["items"]),
          success: apiResponse['success']);

      return apiresponse;
    } catch (ex) {
      print("==============$ex");
      ListnersUtils.showFlushbarMessage(
          "Error during adding product try to add product again",
          Colors.redAccent,
          TheamColors.PtexrtColor2,
          "Error",
          Icons.done,
          context);
    }
  }

  // function to view perticular cart  user cart
  Future fetchUserCart(data, context) async {
    try {
      apiResponse = await _apiServices.getApiResponse(
          "${ApiEndpointsUrl.fetchUserCart}" + data, context);
      if (apiResponse['success'] == true) {
        CartModel apiresponse = CartModel(
            message: apiResponse['message'],
            newCart:
                NewCart(user: "", id: "", items: apiResponse['userCartList']),
            success: apiResponse['success']);
        return apiresponse;
      } else {
        CartModel apiresponse = CartModel(
            message: apiResponse['message'],
            newCart: NewCart(user: "", id: "", items: []),
            success: apiResponse['success']);
        return apiresponse;
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
