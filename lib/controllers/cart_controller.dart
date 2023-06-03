import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mystore/models/cart_model.dart';
import 'package:mystore/repository/cart_repo.dart';

import '../utils/constants/colorpallets.dart';
// import '../utils/conversion_formater.dart';
import '../utils/conversion_formater.dart';
import '../utils/listners_utils.dart';
import '../utils/seassion_manager.dart';

class CartController with ChangeNotifier {
  final cartRepo = CartRepository();

  late CartModel _cart = CartModel(
      message: "",
      success: false,
      newCart: NewCart(user: "", id: "", items: []));
  CartModel get cart => _cart;

  bool _loading = false;
  bool get loading => _loading;

  late num _price;
  num get price => _price;

  late num _discountPrice;
  num get discountPrice => _discountPrice;

  late double _discountPercent;
  double get discountPercent => _discountPercent;

  setLoadingState(bool val) {
    _loading = val;
  }

  Future addToCartController(context, data) async {
    try {
      dynamic getSeassionUser = await ManageSeassion.getUserDetails();
      data["userId"] = getSeassionUser.elementAt(1);
      await cartRepo.addToCart(data, context);
      notifyListeners();
      if (cart.success == true) {
        ListnersUtils.showFlushbarMessage(
            "Cart is updated",
            Colors.greenAccent,
            TheamColors.PtexrtColor2,
            cart.success.toString(),
            Icons.done,
            context);
      }
    } catch (exception) {}
  }

  Future fetchUserCartController(context) async {
    try {
      setLoadingState(true);
      dynamic getSeassionUser = await ManageSeassion.getUserDetails();
      _cart =
          await cartRepo.fetchUserCart(getSeassionUser.elementAt(1), context);
      Map cartTotal = await Formater.calculateTotal(_cart.newCart.items);
      _price = cartTotal['total'];
      _discountPrice = cartTotal['discountPrice'];
      _discountPercent = _discountPrice / _price * 100;
      if (kDebugMode) {
        print("cart and  and  cart items: ${cart.newCart.items} and total is ");
      }
      setLoadingState(false);
      notifyListeners();
    } catch (exception) {
      setLoadingState(false);
    }
  }

  Future deletUserCartController(context, data) async {
    try {
      print("price ============delet controller ran =================");
      dynamic getSeassionUser = await ManageSeassion.getUserDetails();
      data["userId"] = getSeassionUser.elementAt(1);
      await cartRepo.deletFromCart(data, context);
      notifyListeners();
    } catch (exception) {
      setLoadingState(false);
    }
  }

  Future updateCartState(context) async {
    dynamic getSeassionUser = await ManageSeassion.getUserDetails();
    _cart = await cartRepo.fetchUserCart(getSeassionUser.elementAt(1), context);
    Map cartTotal = await Formater.calculateTotal(_cart.newCart.items);
    _price = cartTotal['total'];
    _discountPrice = cartTotal['discountPrice'];
    _discountPercent = _discountPrice / _price * 100;
    if (kDebugMode) {
      print("price ============$_discountPrice=================== $_price");
    }
    notifyListeners();
  }
}
