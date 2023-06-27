import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mystore/utils/constants/colorpallets.dart';
import 'package:mystore/utils/conversion_formater.dart';
import 'package:mystore/view/components/card2.dart';
import 'package:mystore/view/components/cart_card.dart';
import 'package:mystore/view/components/coustom_button.dart';
import 'package:mystore/view/components/heading_text.dart';
import 'package:mystore/view/components/navbar.dart';
import 'package:mystore/view/screens/buy_now_screen.dart';
import 'package:provider/provider.dart';
import '../../controllers/cart_controller.dart';
import '../components/paragraph_text.dart';

class CartList extends StatelessWidget {
  CartList({super.key});

  CartController cartController = CartController();

  @override
  Widget build(BuildContext context) {
    final dynamic screenhight = MediaQuery.of(context).size.height;
    final dynamic screenwidth = MediaQuery.of(context).size.width;
    cartController = Provider.of<CartController>(context, listen: false);
    cartController.fetchUserCartController(context);
    dynamic dataListLength;
    Map data;

    return Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        Navbar(
          isVisible: false,
          title: 'MyCart',
          subtitle: '[1]',
          cart: false,
          filter: false,
          search: false,
          backButton: true,
          cartCount: null,
        ),
        SizedBox(
          height: screenhight * 0.01,
        ),
        Container(
          child: Consumer<CartController>(
            builder: (BuildContext context, value, Widget? child) {
              dataListLength = value.cart.userCart;

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
                    child: Expanded(
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                                width: screenwidth,
                                height: screenhight * 0.36,
                                // color: Color.fromARGB(255, 214, 83, 83),
                                child: ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  itemCount: value.cart.userCart!.length,
                                  itemBuilder: (context, index) {
                                    var items = value.cart.userCart![index];
                                    return Wrap(
                                      runSpacing: screenwidth * 0.03,
                                      alignment: WrapAlignment.spaceEvenly,
                                      children: [
                                        CartCard(
                                          discription:
                                              items.product!.discription!,
                                          image: items.product!.thumbnail!,
                                          price:
                                              items.product!.price!.toString(),
                                          title: items.product!.title!,
                                          color: items.color as String,
                                          size: items.size as String,
                                          setQuantity: items.quantity as int,
                                          getQuantity: (int quantity) async {
                                            data = {
                                              "product": items.product!.sId!,
                                              "quantity": quantity.toInt(),
                                              "color": items.color,
                                              "size": items.size
                                            };
                                            await cartController
                                                .addToCartController(
                                                    context, data);
                                            await cartController
                                                .updateCartState(context);
                                          },
                                          deletCart: () async {
                                            data = {
                                              "cartId": items.sId,
                                            };
                                            await cartController
                                                .deletUserCartController(
                                                    context, data);
                                            await cartController
                                                .updateCartState(context);
                                          },
                                        )
                                      ],
                                    );
                                  },
                                )),
                          ),
                          /////////////////////////////////////////////////////////////////////
                          Padding(
                            padding: EdgeInsets.fromLTRB(14, 0, 14, 0),
                            child: Container(
                              // color: Colors.amberAccent,
                              width: screenwidth,
                              height: screenhight * 0.20,
                              child: Column(
                                children: [
                                  const Divider(
                                    color: Color.fromARGB(255, 78, 78, 78),
                                    height: 20,
                                  ),
                                  const SizedBox(
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
                                        height: screenhight * 0.04,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
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
                                  CommonButton(
                                      width: screenwidth * 0.72,
                                      height: screenhight * 0.056,
                                      btnTitle: "Buy Now",
                                      btnColor: TheamColors.primaryColor,
                                      onTapHandler: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                          builder: (context) {
                                            return BuyNowScreen();
                                          },
                                        ));
                                      })
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }
              }
            },
          ),
        )
      ],
    )));
  }
}
