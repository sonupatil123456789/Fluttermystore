import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mystore/controllers/order_controller.dart';
import 'package:mystore/models/cart_model.dart';
import 'package:mystore/models/order_model.dart';
import 'package:mystore/models/user_model.dart';
import 'package:mystore/utils/routes/routes_name.dart';
import 'package:mystore/view/authscreens/edit_user_details_screen.dart';
import 'package:provider/provider.dart';

import '../../controllers/auth_controller.dart';
import '../../controllers/cart_controller.dart';
import '../../utils/constants/colorpallets.dart';
import '../components/card_header.dart';
import '../components/cart_card.dart';
import '../components/coustom_button.dart';
import '../components/heading_text.dart';
import '../components/navbar.dart';
import '../components/paragraph_text.dart';
// import 'package:mystore/view/components/title_text.dart';

class BuyNowScreen extends StatefulWidget {
  BuyNowScreen({super.key});

  @override
  State<BuyNowScreen> createState() => _BuyNowScreenState();
}

class _BuyNowScreenState extends State<BuyNowScreen> {
  AuthController authController = AuthController();
  CartController cartController = CartController();
  OrderController orderController = OrderController();

  dynamic dataListLength;
  late Map data;

  Future authanticateUser() async {
    authController = Provider.of<AuthController>(context, listen: false);
    cartController = Provider.of<CartController>(context, listen: false);
    orderController = Provider.of<OrderController>(context, listen: false);
    cartController.fetchUserCartController(context);
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
    final dynamic screenhight = MediaQuery.of(context).size.height;
    final dynamic screenwidth = MediaQuery.of(context).size.width;

    return Scaffold(body: SafeArea(child: Consumer<AuthController>(
      builder: (context, state, child) {
        if (state.loading == true) {
          return Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(
                color: Colors.deepPurpleAccent,
              ));
        } else {
          if (state.user['success'] == true) {
            return Padding(
              padding: EdgeInsets.fromLTRB(
                  screenwidth * 0.04, 0, screenwidth * 0.04, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Navbar(
                    isVisible: false,
                    title: 'Order',
                    subtitle: '',
                    cart: false,
                    filter: false,
                    search: false,
                    backButton: true,
                    cartCount: null,
                  ),
                  // CardHeader(
                  //   titleText: "User Details",
                  //   navigateToList: () {
                  //     // Navigator.pushNamed(context, RoutesName.brandList);
                  //   },
                  //   isVisible: false,
                  // ),
                  /////////////////////////////////////////////////////////////////////////
                  Container(
                    width: screenwidth * 0.86,
                    // color: Colors.amber,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          H1text(
                              fonttext: state.user['userresponse']['fullName'],
                              weight: FontWeight.bold,
                              size: screenwidth * 0.052),
                          SizedBox(
                            height: screenhight * 0.008,
                          ),
                          H1text(
                              fonttext: state.user['userresponse']['number'],
                              weight: FontWeight.w400,
                              size: screenwidth * 0.034),
                          H1text(
                              fonttext: state.user['userresponse']['email'],
                              weight: FontWeight.w400,
                              size: screenwidth * 0.034),
                          Text(
                            state.user['userresponse']['address'],
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: TheamColors.HtexrtColor1,
                              fontWeight: FontWeight.w400,
                              fontSize: screenwidth * 0.034,
                            ),
                          ),
                          SizedBox(
                            height: screenhight * 0.01,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return EditUserDetailsScreen();
                                },
                              ));
                            },
                            child: Text(
                              "Edit Details",
                              style: TextStyle(color: Colors.deepPurpleAccent),
                            ),
                          )
                        ]),
                  ),
                  ///////////////////////////////////////////////////////////////////////
                  SizedBox(
                    height: screenhight * 0.01,
                  ),
                  CardHeader(
                    titleText: "Products",
                    navigateToList: () {
                      // Navigator.pushNamed(context, RoutesName.brandList);
                    },
                    isVisible: false,
                  ),
                  Container(
                    child: Consumer<CartController>(
                      builder: (BuildContext context, value, Widget? child) {
                        var dataListLength = value.cart.userCart;

                        if (value.loading == true || dataListLength == null) {
                          return const Expanded(
                              child: Center(
                            child: CircularProgressIndicator(
                              color: Colors.deepPurpleAccent,
                            ),
                          ));
                        } else {
                          if (dataListLength.length == 0) {
                            return const Expanded(
                              child: Center(
                                  child: Text(
                                      "Your cart is empty Please continue shopping")),
                            );
                          } else {
                            return Container(
                              // color: Colors.amberAccent,
                              height: screenhight * 0.32,
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Container(
                                        width: screenwidth,
                                        height: screenhight * 0.36,
                                        // color: Color.fromARGB(255, 214, 83, 83),
                                        child: ListView.builder(
                                          scrollDirection: Axis.vertical,
                                          itemCount:
                                              value.cart.userCart!.length,
                                          itemBuilder: (context, index) {
                                            var items =
                                                value.cart.userCart![index];
                                            return Wrap(
                                              runSpacing: screenwidth * 0.03,
                                              alignment:
                                                  WrapAlignment.spaceEvenly,
                                              children: [
                                                CartCard(
                                                  discription: items
                                                      .product!.discription!,
                                                  image:
                                                      items.product!.thumbnail!,
                                                  price: items.product!.price!
                                                      .toString(),
                                                  title: items.product!.title!,
                                                  color: items.color as String,
                                                  size: items.size as String,
                                                  setQuantity:
                                                      items.quantity as int,
                                                  getQuantity:
                                                      (int quantity) async {
                                                    data = {
                                                      "product":
                                                          items.product!.sId!,
                                                      "quantity":
                                                          quantity.toInt(),
                                                      "color": items.color,
                                                      "size": items.size
                                                    };
                                                    await cartController
                                                        .addToCartController(
                                                            context, data);
                                                    await cartController
                                                        .updateCartState(
                                                            context);
                                                  },
                                                  deletCart: () async {
                                                    data = {
                                                      "cartId": items.sId,
                                                    };
                                                    await cartController
                                                        .deletUserCartController(
                                                            context, data);
                                                    await cartController
                                                        .updateCartState(
                                                            context);
                                                  },
                                                )
                                              ],
                                            );
                                          },
                                        )),
                                  ),
                                ],
                              ),
                            );
                          }
                        }
                      },
                    ),
                  ),
                  ///////////////////////////////////////////////////////////////////////////////
                  CardHeader(
                    titleText: "Payment",
                    navigateToList: () {
                      // Navigator.pushNamed(context, RoutesName.brandList);
                    },
                    isVisible: false,
                  ),
                  Consumer<OrderController>(
                    builder: (BuildContext context, value, Widget? child) {
                      return Container(
                        height: screenhight * 0.14,
                        // color: Colors.amber,
                        child: Column(children: [
                          RadioListTile(
                            title: Text("Pay now"),
                            activeColor: Colors.deepPurpleAccent,
                            value: "Pay-Now",
                            groupValue: value.paymentMethod,
                            onChanged: (value) {
                              orderController
                                  .setPaymentMethod(value.toString());
                            },
                          ),
                          RadioListTile(
                            title: Text("Pay on delivery"),
                            value: "Pay-On-Delivery",
                            groupValue: value.paymentMethod,
                            activeColor: Colors.deepPurpleAccent,
                            onChanged: (value) {
                              orderController
                                  .setPaymentMethod(value.toString());
                            },
                          ),
                        ]),
                      );
                    },
                  ),
                  //////////////////////////////////////////////////////////////////////////////
                  Container(child: Consumer<CartController>(
                    builder: (BuildContext context, value, Widget? child) {
                      var dataListLength = value.cart.userCart;

                      if (value.loading == true || dataListLength == null) {
                        return const Expanded(
                            child: Center(
                          child: CircularProgressIndicator(
                            color: Colors.deepPurpleAccent,
                          ),
                        ));
                      } else {
                        if (dataListLength.length == 0) {
                          return const Expanded(
                            child: Center(child: Text("Calculating ...")),
                          );
                        } else {
                          return Expanded(
                            child: Container(
                              // color: Colors.amberAccent,
                              width: screenwidth,
                              height: screenhight * 0.20,
                              child: Column(
                                children: [
                                  const Divider(
                                    color: Color.fromARGB(255, 78, 78, 78),
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Ptext(
                                            fonttext: "Discount",
                                            size: screenwidth * 0.03,
                                            weight: FontWeight.w300,
                                          ),
                                          SizedBox(
                                            height: screenhight * 0.01,
                                          ),
                                          Ptext(
                                            fonttext: "Price",
                                            size: screenwidth * 0.03,
                                            weight: FontWeight.w300,
                                          ),
                                          SizedBox(
                                            height: screenhight * 0.01,
                                          ),
                                          H1text(
                                            fonttext: "Total",
                                            size: screenwidth * 0.038,
                                            weight: FontWeight.w600,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: screenhight * 0.03,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Ptext(
                                            fonttext:
                                                " ${value.discountPercent.toInt().toString()} %",
                                            size: screenwidth * 0.032,
                                            weight: FontWeight.w400,
                                          ),
                                          SizedBox(
                                            height: screenhight * 0.01,
                                          ),
                                          Ptext(
                                            fonttext:
                                                " \u{20B9} ${value.price.toString()}",
                                            size: screenwidth * 0.032,
                                            weight: FontWeight.w400,
                                          ),
                                          SizedBox(
                                            height: screenhight * 0.01,
                                          ),
                                          H1text(
                                            fonttext:
                                                " \u{20B9} ${value.discountPrice.toString()}",
                                            size: screenwidth * 0.040,
                                            weight: FontWeight.w700,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: screenhight * 0.03,
                                  ),
                                  Consumer<OrderController>(
                                    builder: (BuildContext context, orderState,
                                        Widget? child) {
                                      return AbsorbPointer(
                                        absorbing: state.user['userresponse']
                                                        ['number'] ==
                                                    "" ||
                                                orderState.paymentMethod ==
                                                    null ||
                                                orderState.paymentMethod == ""
                                            ? true
                                            : false,
                                        child: CommonButton(
                                            width: screenwidth * 0.72,
                                            height: screenhight * 0.056,
                                            btnTitle: "Place Order",
                                            btnColor: state.user['userresponse']
                                                            ['number'] ==
                                                        "" ||
                                                    orderState.paymentMethod ==
                                                        null ||
                                                    orderState.paymentMethod ==
                                                        ""
                                                ? TheamColors
                                                    .unselectedChipColor
                                                : TheamColors.primaryColor,
                                            onTapHandler: () async {
                                              Map orderData = {
                                                "user":
                                                    state.user['userresponse'],
                                                "items": value.cart.userCart,
                                                "ststus": orderState
                                                    .paymentMethod
                                                    .toString(),
                                              };
                                              await orderController
                                                  .orderProductController(
                                                      context, orderData)
                                                  .then((value) =>
                                                      Navigator.pushNamed(
                                                          context,
                                                          RoutesName
                                                              .orderPlacedScreen));

                                              // Navigator.pushNamed(
                                              //     context, RoutesName.home);
                                            }),
                                      );
                                    },
                                  )
                                ],
                              ),
                            ),
                          );
                        }
                      }
                    },
                  ))
                ],
              ),
            );
          } else {
            return Center(
              child: Text("User is not authanticated"),
            );
          }
        }
      },
    )));
  }
}
