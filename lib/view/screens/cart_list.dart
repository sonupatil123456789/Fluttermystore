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
import 'package:provider/provider.dart';

import '../../controllers/cart_controller.dart';
import '../components/paragraph_text.dart';

class CartList extends StatelessWidget {
  CartList({super.key});

  CartController cartController = CartController();

  @override
  Widget build(BuildContext context) {
    cartController = Provider.of<CartController>(context, listen: false);
    int dataListLength;
    Map data;

    cartController.fetchUserCartController(context);
    final dynamic screenhight = MediaQuery.of(context).size.height;
    final dynamic screenwidth = MediaQuery.of(context).size.width;

    return Scaffold(body: SafeArea(child: SafeArea(
      child: Consumer<CartController>(
          builder: (BuildContext context, value, Widget? child) {
        dataListLength = value.cart.newCart.items.length;


        return dataListLength == 0 || dataListLength == null
            ? Center(
                child: Text("Your cart is empty Please continue shopping"),
              )
            : value.loading == true
                ? const Center(child: CircularProgressIndicator())
                : Container(
                    // color: Colors.amberAccent,
                    child: Column(
                      children: [
                        Navbar(
                          isVisible: false,
                          title: 'MyCart',
                          subtitle: '[$dataListLength]',
                          cart: false,
                          filter: false,
                          search: false,
                          backButton: true,
                        ),
                        SizedBox(
                          height: screenhight * 0.01,
                        ),
                        Expanded(
                          child: Container(
                              width: screenwidth,
                              height: screenhight * 0.36,
                              // color: Color.fromARGB(255, 214, 83, 83),
                              child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                itemCount: value.cart.newCart.items.length,
                                itemBuilder: (context, index) {
                                  var items = value.cart.newCart.items[index];
                                  return Wrap(
                                    runSpacing: screenwidth * 0.03,
                                    alignment: WrapAlignment.spaceEvenly,
                                    children: [
                                      CartCard(
                                        discription: items['product']
                                            ['discription'],
                                        image: items['product']['thumbnail'],
                                        price: items['product']['price']
                                            .toString(),
                                        title: items['product']['title'],
                                        color: items['color'],
                                        size: items['size'],
                                        setQuantity: items['quantity'],
                                        getQuantity: (int quantity) async {
                                          data = {
                                            "product": items['product']['_id'],
                                            "quantity": quantity.toInt(),
                                            "color": items['color'],
                                            "size": items['size']
                                          };
                                          await cartController
                                              .addToCartController(
                                                  context, data);
                                          await cartController
                                              .updateCartState(context);
                                        },
                                        deletCart: () async {
                                          data = {
                                            "cartId": items['_id'],
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
                        Padding(
                          padding: EdgeInsets.fromLTRB(14, 0, 14, 0),
                          child: Container(
                            // color: Colors.amberAccent,
                            width: screenwidth,
                            height: screenhight * 0.24,
                            child: Column(
                              children: [
                                Divider(
                                  color: Color.fromARGB(255, 78, 78, 78),
                                  height: 20,
                                ),
                                SizedBox(
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
                                      height: screenhight * 0.04,
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
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
                                CommonButton(
                                    width: screenwidth * 0.64,
                                    height: screenhight * 0.056,
                                    btnTitle: "Buy Now",
                                    btnColor: TheamColors.primaryColor,
                                    onTapHandler: () {})
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  );
      }),
    )));
  }
}
