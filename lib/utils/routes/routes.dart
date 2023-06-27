import 'package:flutter/material.dart';
import 'package:mystore/App.dart';
import 'package:mystore/utils/routes/routes_name.dart';
import 'package:mystore/view/authscreens/auth_screen.dart';
import 'package:mystore/view/authscreens/edit_user_details_screen.dart';
import 'package:mystore/view/exceptionscreen/no_internet.dart';
import 'package:mystore/view/onboardingscreen/onboarding_scree%20n.dart';
import 'package:mystore/view/screens/all_product_screen.dart';
import 'package:mystore/view/screens/brand_list.dart';
import 'package:mystore/view/screens/buy_now_screen.dart';
import 'package:mystore/view/screens/cart_list.dart';
import 'package:mystore/view/screens/category_list.dart';
import 'package:mystore/view/screens/home_screen.dart';
import 'package:mystore/view/screens/my_orders.dart';
import 'package:mystore/view/screens/placed_order_screen.dart';
import 'package:mystore/view/screens/product_details_screen.dart';
import 'package:mystore/view/screens/search_screen.dart';

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

      case RoutesName.categoryList:
        //  Object categoryList = settings.arguments as Object;
        return MaterialPageRoute(builder: (buildContext) => CategoryList());

      case RoutesName.brandList:
        //  Object? brandList = settings.arguments as Object;
        return MaterialPageRoute(builder: (buildContext) => BrandList());

      case RoutesName.allProducts:
        return MaterialPageRoute(builder: (buildContext) => AllProductScreen());

      case RoutesName.editUserDetailScreen:
        return MaterialPageRoute(
            builder: (buildContext) => EditUserDetailsScreen());

      case RoutesName.myCart:
        return MaterialPageRoute(builder: (buildContext) => CartList());
        
      case RoutesName.myOrders:
        return MaterialPageRoute(builder: (buildContext) => MyOrder());

      case RoutesName.searchScreen:
        return MaterialPageRoute(builder: (buildContext) => SearchScreen());

      case RoutesName.orderScreen:
        return MaterialPageRoute(builder: (buildContext) => BuyNowScreen());

      case RoutesName.orderPlacedScreen:
        return MaterialPageRoute(
            builder: (buildContext) => PlacedOrderScreen());

      case RoutesName.productsDetail:
        Object? product = settings.arguments;
        return MaterialPageRoute(
            builder: (buildContext) => ProductDetailsScreen(product: product));

      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(child: Text("Default")),
          );
        });
    }
  }
}
