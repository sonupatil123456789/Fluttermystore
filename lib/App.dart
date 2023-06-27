import 'dart:async';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
// import 'package:mystore/controllers/connectiviety_controller.dart';
import 'package:mystore/utils/routes/routes_name.dart';
import 'package:mystore/view/onboardingscreen/onboarding_scree%20n.dart';
import 'package:mystore/view/screens/home_screen.dart';
import 'package:mystore/view/authscreens/login_screen.dart';
import 'package:provider/provider.dart';

import 'controllers/auth_controller.dart';
import 'controllers/connectiviety_controller.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  dynamic isOnboardingScreen;
  dynamic isUserAuthanticated;

  late StreamSubscription<ConnectivityResult> subscription;

  Future getOnBoardingScreen() async {
    final authController =
        await Provider.of<AuthController>(context, listen: false);
    var box = await Hive.openBox("onBoarding");
    isOnboardingScreen = await box.get("setOnboarding", defaultValue: true);
    if (kDebugMode) {
      print("onboarding : $isOnboardingScreen");
    }
    try {
      await Timer(Duration(milliseconds: 200), () async {
        isUserAuthanticated =
            await authController.authintacateController(context);
        Navigator.pushNamedAndRemoveUntil(
            context,
            isOnboardingScreen == true
                ? RoutesName.onboarding
                : isUserAuthanticated == true
                    ? RoutesName.home
                    : RoutesName.auth,
            (Route<dynamic> route) => false);
      });
    } catch (ex) {}
  }

  @override
  void initState() {
    getOnBoardingScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(221, 255, 128, 128),
      body: Center(
        child: Text(""),
      ),
    );
  }
}

