import 'package:flutter/material.dart';
import 'package:mystore/view/components/bottom_bar.dart';
import 'package:mystore/view/exceptionscreen/no_internet.dart';
import 'package:mystore/view/screens/all_product_screen.dart';
import 'package:mystore/view/screens/category_list.dart';
import 'package:mystore/view/screens/favourate_wishlist.dart';
import 'package:mystore/view/screens/main_screen.dart';
import 'package:mystore/view/screens/my_orders.dart';
import 'package:mystore/view/screens/profile_screen.dart';
import 'package:provider/provider.dart';
import '../../controllers/auth_controller.dart';
import '../../controllers/connectiviety_controller.dart';
import '../../utils/constants/colorpallets.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List Screens = [
    MainScreen(),
    AllProductScreen(),
    MyOrder(),
    FavourateWishList(),
    ProfileScreen()
  ];

  int index = 0;

  late ConnectivityStatus connectionStatus = ConnectivityStatus.None;
  AuthController authController = AuthController();

  Future authanticateUser() async {
    authController = Provider.of<AuthController>(context, listen: false);
    await authController.homeScreenAuthintacateController(context);
    setState(() {});
  }

  @override
  void initState() {
    authanticateUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    final dynamic screenhight = MediaQuery.of(context).size.height;
    final dynamic screenwidth = MediaQuery.of(context).size.width;
    connectionStatus = Provider.of<ConnectivityStatus>(context);

    if (connectionStatus == ConnectivityStatus.WiFi ||
        connectionStatus == ConnectivityStatus.Cellular) {
      return Consumer<TheamColors>(
          builder: (BuildContext context, value, Widget? child) {
        return Consumer<AuthController>(
          builder: (context, value, child) {
            if (value.loading == true) {
              return Scaffold(
                backgroundColor: TheamColors.backgroundColor,
                body : Container(
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(
                      color: Colors.deepPurpleAccent,
                    )),
              );
            } else {
              if (value.user['success'] == true) {
                return Scaffold(
                  body: Container(
                    color: TheamColors.backgroundColor,
                    child: SafeArea(
                      child: Column(
                        children: [
                          Screens[index],
                          BottomBar(
                            screen: (value) {
                              setState(() {
                                index = value;
                              });
                            },
                            backgroundColor: TheamColors.cardColor,
                            iconColor: TheamColors.primaryColor,
                          )
                        ],
                      ),
                    ),
                  ),
                );
              } else if (value.user['success'] == null) {
                return Scaffold(
                  body: Center(
                    child: Text("Server is in maintainance"),
                  ),
                );
              } else {
                return Scaffold(
                  body: Center(
                    child: Text("Session is terminated"),
                  ),
                );
              }
            }
          },
        );
      });
    } else {
      return NoInternet();
    }

    // return connectionStatus == ConnectivityStatus.WiFi ||
    //         connectionStatus == ConnectivityStatus.Cellular
    //     ? authUser == true
    //         ? Scaffold(
    //             body: SafeArea(
    //               child: Consumer<AuthController>(
    //                 builder: (BuildContext context, value, Widget? child) {
    //                   return value.loading == true
    //                       ? Container(
    //                           alignment: Alignment.center,
    //                           child: CircularProgressIndicator(
    //                             color: Colors.deepPurpleAccent,
    //                           ))
    //                       : Container(
    //                           child: Column(
    //                             children: [
    //                               Screens[index],
    //                               BottomBar(
    //                                 screen: (value) {
    //                                   setState(() {
    //                                     index = value;
    //                                   });
    //                                 },
    //                               )
    //                             ],
    //                           ),
    //                         );
    //                 },
    //               ),
    //             ),
    //           )
    //         : Scaffold(
    //           body: Center(
    //               child: Text("session is terminated"),
    //             ),
    //         )
    //     : NoInternet();
  }
}
