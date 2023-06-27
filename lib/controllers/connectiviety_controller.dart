import 'dart:async';
// import 'package:connectivity/connectivity.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:mystore/controllers/auth_controller.dart';
import 'package:mystore/utils/listners_utils.dart';
import 'package:provider/provider.dart';

import '../utils/constants/colorpallets.dart';
import '../utils/routes/routes_name.dart';
// import 'package:network_aware/enums/connectivity_status.dart';

enum ConnectivityStatus { None, WiFi, Cellular, Offline }

class ConnectivityService with ChangeNotifier {
  // Create our public controller

  StreamController<ConnectivityStatus> connectionStatusController =
      StreamController<ConnectivityStatus>();
  ConnectivityService() {
    // Subscribe to the connectivity Chanaged Steam
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      // Use Connectivity() here to gather more info if you need t
      connectionStatusController.add(_getStatusFromResult(result));
    });
  }
  // Convert from the third part enum to our own enum
  ConnectivityStatus _getStatusFromResult(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.mobile:
        return ConnectivityStatus.Cellular;
      case ConnectivityResult.wifi:
        return ConnectivityStatus.WiFi;
      case ConnectivityResult.none:
        return ConnectivityStatus.Offline;
      default:
        return ConnectivityStatus.Offline;
    }
  }

}
