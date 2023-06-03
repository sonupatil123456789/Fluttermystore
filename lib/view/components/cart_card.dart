import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:like_button/like_button.dart';
import 'package:mystore/utils/constants/colorpallets.dart';
import 'package:mystore/view/components/dropdown.dart';
import 'package:mystore/view/components/heading_text.dart';
import 'package:mystore/view/components/increment_decrement.dart';
import 'package:mystore/view/components/paragraph_text.dart';

class CartCard extends StatelessWidget {
  String discription;
  Function getQuantity;
    Function deletCart;
  String image;
  String price;
  String title;
  String size;
  String color;
  int setQuantity;

  CartCard(
      {super.key,
      required this.getQuantity,
      required this.deletCart,
      required this.setQuantity,
      required this.title,
      required this.discription,
      required this.image,
      required this.size,
      required this.color,
      required this.price});

  Widget build(BuildContext context) {

    final dynamic screenhight = MediaQuery.of(context).size.height;
    final dynamic screenwidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenwidth * 0.94,
      height: screenhight * 0.16,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        // color: Color.fromARGB(255, 226, 134, 134),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: screenwidth * 0.24,
                height: screenhight * 0.12,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  // color: Color(0x4c000000),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    image,
                    width: screenwidth * 0.15,
                    height: screenhight * 0.12,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(width: screenwidth * 0.05),
              Container(
                width: screenwidth * 0.56,
                height: screenhight * 0.12,
                // color: Color.fromARGB(255, 128, 64, 255),
                child: Column(
                  // mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: screenhight * 0.03,
                      // color: Color.fromARGB(255, 64, 255, 166),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              alignment: Alignment.centerLeft,
                              // width: screenwidth * 0.42,
                              height: screenhight * 0.03,
                              // color: Color.fromARGB(255, 64, 255, 166),
                              child: H1text(
                                fonttext: title,
                                size: screenwidth * 0.036,
                                weight: FontWeight.w600,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              deletCart();
                            },
                            child: Container(
                              width: screenwidth * 0.08,
                              // color: Colors.amber,
                              height: screenhight * 0.03,
                              child: Icon(
                                Icons.delete,
                                size: screenwidth * 0.05,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      // width: screenwidth * 0.42,
                      height: screenhight * 0.02,
                      alignment: Alignment.bottomCenter,
                      // color: Colors.amberAccent,
                      child: H1text(
                        fonttext: discription,
                        size: screenwidth * 0.026,
                        weight: FontWeight.w300,
                      ),
                    ),
                    Container(
                      // width: screenwidth * 0.42,
                      height: screenhight * 0.026,
                      alignment: Alignment.bottomLeft,
                      // color: Colors.amberAccent,
                      child: H1text(
                        fonttext: "\u{20B9} $price",
                        size: screenwidth * 0.038,
                        weight: FontWeight.w600,
                      ),
                    ),
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IncrementDecrementButton(
                            quantityValue: (int quantity) {
                              getQuantity(quantity);
                            },
                            initialQuantity: setQuantity,
                          ),
                          Spacer(),
                          Container(
                            width: screenwidth * 0.20,
                            height: screenwidth * 0.07,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                shape: BoxShape.rectangle,
                                border: Border.all(
                                    color: TheamColors.PtexrtColor1,
                                    width: 2,
                                    style: BorderStyle.solid)
                                // color: HexColor("FFFFFF"),
                                ),
                            child: Text(
                              size,
                              style: GoogleFonts.rubik(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: TheamColors.PtexrtColor1,
                              ),
                            ),
                          ),
                          Spacer(),
                          Container(
                            width: screenwidth * 0.07,
                            height: screenwidth * 0.07,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: HexColor(color),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
