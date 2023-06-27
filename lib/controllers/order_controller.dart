import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mystore/models/cart_model.dart';
import 'package:mystore/models/order_model.dart';
import 'package:mystore/repository/cart_repo.dart';

import '../repository/order_repo.dart';
import '../utils/constants/colorpallets.dart';
// import '../utils/conversion_formater.dart';
import '../utils/conversion_formater.dart';
import '../utils/listners_utils.dart';
import '../utils/seassion_manager.dart';

enum payment { payOnDelivery, PayNow }

class OrderController with ChangeNotifier {
  final orderRepo = OrderRepository();

  late OrderModel _orders = OrderModel();
  OrderModel get orders => _orders;

  bool _loading = false;
  bool get loading => _loading;

  dynamic paymentMethod;

  setLoadingState(bool val) {
    _loading = val;
  }

  setPaymentMethod(value) {
    paymentMethod = value;
    notifyListeners();
  }

  Future orderProductController(context, data) async {
    setLoadingState(true);
    try {
      await orderRepo.placeOrder(data, context);
      setLoadingState(false);
      notifyListeners();
    } catch (exception) {
      
    }
  }

  // Future fetchUserCartController(context) async {
  //   try {
  //     setLoadingState(true);
  //     dynamic getSeassionUser = await ManageSeassion.getUserDetails();
  //     _cart =
  //         await cartRepo.fetchUserCart(getSeassionUser.elementAt(1), context);
  //     Map cartTotal =
  //         await Formater.calculateTotal(_cart.userCart as List<UserCart>);
  //     _price = cartTotal['total'];
  //     _discountPrice = cartTotal['discountPrice'];
  //     _discountPercent = _discountPrice / _price * 100;
  //     if (kDebugMode) {
  //       print("cart and  and  cart items: ${cart.userCart} and total is ");
  //     }
  //     setLoadingState(false);
  //     notifyListeners();
  //   } catch (exception) {
  //     setLoadingState(false);
  //   }
  // }

  // Future deletUserCartController(context, data) async {
  //   try {
  //     print("price ============delet controller ran =================");
  //     dynamic getSeassionUser = await ManageSeassion.getUserDetails();
  //     data["userId"] = getSeassionUser.elementAt(1);
  //     await cartRepo.deletFromCart(data, context);
  //     notifyListeners();
  //   } catch (exception) {
  //     setLoadingState(false);
  //   }
  // }

  // Future updateCartState(context) async {
  //   dynamic getSeassionUser = await ManageSeassion.getUserDetails();
  //   _cart = await cartRepo.fetchUserCart(getSeassionUser.elementAt(1), context);
  //   Map cartTotal =
  //       await Formater.calculateTotal(_cart.userCart as List<UserCart>);
  //   _price = cartTotal['total'];
  //   _discountPrice = cartTotal['discountPrice'];
  //   _discountPercent = _discountPrice / _price * 100;
  //   if (kDebugMode) {
  //     print("price ============$_discountPrice=================== $_price");
  //   }
  //   notifyListeners();
  // }
}
