import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mystore/data/app_exception.dart';
import 'package:mystore/repository/auth_repo.dart';
import 'package:mystore/utils/constants/colorpallets.dart';
import 'package:mystore/utils/input_field_utils.dart';
import 'package:mystore/utils/listners_utils.dart';
import 'package:mystore/utils/seassion_manager.dart';

import '../utils/routes/routes_name.dart';

class AuthController with ChangeNotifier {
  final authRepo = AuthRepository();

  bool _loading = false;
  bool get loading => _loading;

  setLoadingState(bool val) {
    _loading = val;
    notifyListeners();
  }

// provider controller for changing the state of login screen page which will show the data or handell data on error
  Future loginUserController(data, context) async {
    setLoadingState(true);
    try {
      var user = await authRepo.loginUser(data, context);
      setLoadingState(false);
      ListnersUtils.showFlushbarMessage(
          "${user["message"]}",
          user["success"] == true ? Colors.greenAccent : Colors.redAccent,
          TheamColors.PtexrtColor2,
          user["success"] == true ? "Success" : "Error",
          user["success"] == true ? Icons.done : Icons.error,
          context);

      user["success"] == true
          ? ManageSeassion.setUserDetails(context, user["user"])
          : null;
      user["success"] == true
          ? Navigator.pushNamed(context, RoutesName.home)
          : null;
      notifyListeners();
      if (kDebugMode) {
        print("user : $user");
      }
    } catch (exception) {
      setLoadingState(false);
    }
  }

// provider controller for changing the state of signeup screen page which will show the data or handell data on error
  Future registerUserController(data, context) async {
    setLoadingState(true);
    try {
      var user = await authRepo.registerUser(data, context);
      setLoadingState(false);
      ListnersUtils.showFlushbarMessage(
          "${user["message"]}",
          user["success"] == true ? Colors.greenAccent : Colors.redAccent,
          TheamColors.PtexrtColor2,
          user["success"] == true ? "Success" : "Error",
          user["success"] == true ? Icons.done : Icons.error,
          context);
      if (kDebugMode) {
        print("user : $user");
      }
    } catch (exception) {
      setLoadingState(false);
    }
  }

  // provider controller for authanticating the user by checking user persistance
  Future authintacateController(context) async {
    try {
      dynamic getSeassionUser = await ManageSeassion.getUserDetails();

      var user = await authRepo.authanticateUser(
          getSeassionUser.elementAt(4), context);
      if (kDebugMode) {
        print("user : $user");
      }
      return user["success"] == true ? true : false;
    } catch (exception) {

    }
  }
   
}
