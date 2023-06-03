import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:mystore/utils/constants/colorpallets.dart';
import 'package:mystore/utils/listners_utils.dart';

class ManageSeassion {
  static var userPersistanceDetails;

  static Future setUserDetails(context, userData) async {
    print("session run ");

    try {
      var userDetails = await Hive.openBox("userDetails");
      await userDetails.putAll({
        'userId': userData['userId']!,
        'id': userData['_id']!,
        'userName': userData['fullName']!,
        'userEmail': userData['email']!,
        'userToken': userData['token']!,
      });

      if (kDebugMode) {
        print(userData['userId']);
        getUserDetails();
      }
    } catch (ex) {
      print(ex);
      ListnersUtils.showFlushbarMessage("${ex.toString()}", Colors.redAccent,
          TheamColors.PtexrtColor2, "Error", Icons.done, context);
    }
  }

  static Future getUserDetails() async {
    var userDetails = await Hive.openBox("userDetails");
    var userId = await userDetails.get("userId");
    var id = await userDetails.get("id");
    var userName = await userDetails.get("userName");
    var userEmail = await userDetails.get("userEmail");
    var userToken = await userDetails.get("userToken");

    if (kDebugMode) {
      print("persistance value ");
      print(userId);
    }

    return {userId, id, userName, userEmail, userToken};
  }

  static Future deletUserDetails() async {
    var userDetails = await Hive.openBox("userDetails");
    Hive.box('userDetails').clear();
  }
}
