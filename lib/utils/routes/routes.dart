import 'package:flutter/material.dart';
import 'package:mystore/App.dart';
import 'package:mystore/utils/routes/routes_name.dart';
import 'package:mystore/view/authscreens/auth_screen.dart';
import 'package:mystore/view/authscreens/login_screen.dart';
import 'package:mystore/view/exceptionscreen/no_internet.dart';
import 'package:mystore/view/onboardingscreen/onboarding_scree%20n.dart';
import 'package:mystore/view/screens/all_product_screen.dart';
import 'package:mystore/view/screens/home_screen.dart';
import 'package:mystore/view/screens/product_details_screen.dart';
import '../../view/authscreens/signeup_screen.dart';

class Routes {
  static MaterialPageRoute generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.app:
        return MaterialPageRoute(builder: (buildContext) => App());

      case RoutesName.home:
        return MaterialPageRoute(builder: (buildContext) => HomeScreen());

      case RoutesName.noInternet:
        return MaterialPageRoute(builder: (buildContext) => NoInternet());

      case RoutesName.auth:
        return MaterialPageRoute(builder: (buildContext) => AuthScreen());

      case RoutesName.onboarding:
        return MaterialPageRoute(builder: (buildContext) => OnBoardingScreen());

      case RoutesName.allProducts:
        return MaterialPageRoute(builder: (buildContext) => AllProductScreen());

      case RoutesName.productsDetail:
        dynamic product = settings.arguments;
        return MaterialPageRoute(
            builder: (buildContext) => ProductDetailsScreen(product:product));

      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(child: Text("Default")),
          );
        });
    }
  }
}
