import 'package:flutter/material.dart';
import 'package:mystore/data/base_api.dart';
import 'package:mystore/data/network_api.dart';
import 'package:mystore/models/cart_model.dart';
import 'package:mystore/models/order_model.dart';
import 'package:mystore/utils/constants/api_endpoints.dart';
import '../utils/constants/colorpallets.dart';
import '../utils/listners_utils.dart';

class OrderRepository {
  BaseApi _apiServices = networkApi();

  dynamic apiResponse;
  late OrderModel response;

// function to create order in backend
  Future placeOrder(data, context) async {
    try {
      apiResponse = await _apiServices.postApiResponse(
          ApiEndpointsUrl.creatOrder, data, context);
      response = OrderModel.fromJson(apiResponse);
      return response;
    } catch (ex, stack) {
      print("o=============================ct $ex ===========$stack");
      ListnersUtils.showFlushbarMessage(
          "Error during ordering product try to add ordering again",
          Colors.redAccent,
          TheamColors.PtexrtColor2,
          "Error",
          Icons.done,
          context);
    }
  }

  // function to view perticular user cart
  Future fetchOrderCart(Id, context) async {
    try {
      apiResponse = await _apiServices.getApiResponse(
          ApiEndpointsUrl.getAllOrders + Id, context);
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
