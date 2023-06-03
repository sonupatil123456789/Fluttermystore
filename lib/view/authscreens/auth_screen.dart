import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mystore/utils/listners_utils.dart';
import 'package:mystore/view/authscreens/login_screen.dart';
import 'package:mystore/view/authscreens/signeup_screen.dart';
import 'package:mystore/view/exceptionscreen/no_internet.dart';
import 'package:provider/provider.dart';
import '../../controllers/auth_controller.dart';
import '../../controllers/connectiviety_controller.dart';
import '../../utils/constants/colorpallets.dart';
import '../../utils/input_field_utils.dart';
import '../../utils/routes/routes_name.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  ValueNotifier<bool> checkAuthScreen = ValueNotifier<bool>(false);

  late final isUserAuthanticated;
  var connectionStatus;

  Future checkConnection(ConnectivityStatus connectionStatus) async {
    final authController =
        await Provider.of<AuthController>(context, listen: false);
    isUserAuthanticated = await authController.authintacateController(context);
    // ignore: use_build_context_synchronously
    Navigator.pushNamed(context,
        isUserAuthanticated == true ? RoutesName.home : RoutesName.auth);
    // ignore: use_build_context_synchronously
    ListnersUtils.showFlushbarMessage("Youare online now", Colors.greenAccent,
        TheamColors.PtexrtColor2, "Success", Icons.wifi, context);
  }

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    connectionStatus = Provider.of<ConnectivityStatus>(context);
    connectionStatus == ConnectivityStatus.WiFi ||
            connectionStatus == ConnectivityStatus.Cellular
        ? checkConnection(connectionStatus)
        : null;

    return connectionStatus == ConnectivityStatus.WiFi ||
            connectionStatus == ConnectivityStatus.Cellular
        ? Scaffold(
            body: SafeArea(
                child: SingleChildScrollView(
              child: ValueListenableBuilder(
                builder: (BuildContext context, value, Widget? child) {
                  return Column(
                    children: [
                      checkAuthScreen.value == true
                          ? SigneupScreen()
                          : loginScreen(),
                      Container(
                        height: screenwidth * 0.10,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              checkAuthScreen.value == true
                                  ? "Already have account"
                                  : "Dont have acount ?", //"Dont have acount ?",
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            GestureDetector(
                              onTap: () {
                                checkAuthScreen.value = !checkAuthScreen.value;
                              },
                              child: Text(
                                checkAuthScreen.value == true
                                    ? " LogIn "
                                    : " Register ",
                                style: TextStyle(
                                    color: Colors.deepPurpleAccent,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w300),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
                valueListenable: checkAuthScreen,
              ),
            )),
          )
        : NoInternet();
  }

  @override
  void dispose() {
    InputFielUtils.passowrdController.dispose();
    InputFielUtils.emailController.dispose();
    InputFielUtils.nameController.dispose();
    super.dispose();
  }
}
