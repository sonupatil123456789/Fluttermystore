import 'package:flutter/material.dart';
import 'package:mystore/data/base_api.dart';
import 'package:mystore/data/network_api.dart';
import 'package:mystore/utils/constants/api_endpoints.dart';
import '../utils/constants/colorpallets.dart';
import '../utils/listners_utils.dart';

class AuthRepository {
  BaseApi _apiServices = networkApi();

  late Map apiResponse;

// function to authanticate with login user from backend database
  Future loginUser(data, context) async {
    try {
      apiResponse =
          await _apiServices.postApiResponse(ApiEndpointsUrl.loginUrl, data,context);
      return apiResponse;
    } catch (ex) {
      ListnersUtils.showFlushbarMessage("${ex.toString()}", Colors.redAccent,
          TheamColors.PtexrtColor2, "Error", Icons.done, context);
    }
  }

// function to authanticate with register user from backend database
  Future registerUser(data, context) async {
    try {
      apiResponse =
          await _apiServices.postApiResponse(ApiEndpointsUrl.registerUrl, data,context);
      print(apiResponse);
      return apiResponse;
    } catch (ex) {
      print(ex);
      ListnersUtils.showFlushbarMessage("${ex.toString()}", Colors.redAccent,
          TheamColors.PtexrtColor2, "Error", Icons.done, context);
    }
  }

  // function to authanticate valid user using token from backend database
  Future authanticateUser(data, context) async {
    try {
      apiResponse = await _apiServices
          .getApiResponse("${ApiEndpointsUrl.verifyUserUrl}" + data,context);

      return apiResponse;
    } catch (ex) {
      // print(ex);
      ListnersUtils.showFlushbarMessage("${ex.toString()}", Colors.redAccent,
          TheamColors.PtexrtColor2, "Error", Icons.done, context);
    }
  }
}
