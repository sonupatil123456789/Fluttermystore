import 'dart:convert';

import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:mystore/utils/constants/assets.dart';
import 'package:mystore/utils/constants/colorpallets.dart';
import 'package:mystore/utils/listners_utils.dart';
import 'package:mystore/view/components/bottom_bar.dart';
import 'package:mystore/view/components/card.dart';
import 'package:mystore/view/components/card2.dart';
import 'package:mystore/view/components/card3.dart';
import 'package:mystore/view/components/card_header.dart';
import 'package:mystore/view/components/choice_chips.dart';
import 'package:mystore/view/components/crowsel.dart';
import 'package:mystore/view/components/heading_text.dart';
import 'package:mystore/view/components/icon_svg_button.dart';
import 'package:mystore/view/components/navbar.dart';
import 'package:mystore/view/screens/all_product_screen.dart';
import 'package:mystore/view/screens/category_list.dart';
import 'package:mystore/view/screens/favourate_wishlist.dart';
import 'package:mystore/view/screens/main_screen.dart';
import 'package:mystore/view/screens/my_orders.dart';
import 'package:mystore/view/screens/profile_screen.dart';
import '../components/paragraph_text.dart';
import 'package:http/http.dart' as http;

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

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    final dynamic screenhight = MediaQuery.of(context).size.height;
    final dynamic screenwidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
          child: Container(
        child: Column(
          children: [
            Screens[index],
            BottomBar(
              screen: (value) {
                setState(() {
                  index = value;
                });
              },
            )
          ],
        ),
      )),
    );
  }
}
