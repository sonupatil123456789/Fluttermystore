import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mystore/utils/constants/colorpallets.dart';
import 'package:mystore/utils/routes/routes_name.dart';
import 'package:mystore/view/components/heading_text.dart';
import 'package:mystore/view/components/paragraph_text.dart';
import 'package:like_button/like_button.dart';
import 'package:mystore/view/screens/product_details_screen.dart';

class Card1 extends StatelessWidget {
  String productId;
  Map SingleProduct;
  String thumbnailImage;
  String title;
  String discription;
  String price;
  Function addToCart;

  Card1({
    super.key,
    required this.productId,
    required this.SingleProduct,
    required this.thumbnailImage,
    required this.title,
    required this.discription,
    required this.price,
    required this.addToCart,
  });

  @override
  Widget build(BuildContext context) {
    final dynamic screenhight = MediaQuery.of(context).size.height;
    final dynamic screenwidth = MediaQuery.of(context).size.width;
    // print("=========================${SingleProduct}");
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          RoutesName.productsDetail,
          arguments: {"SingleProduct" : SingleProduct}
        );
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(8, 0, 8, 0),
        width: screenwidth * 0.42,
        height: screenhight * 0.34,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          // color: Color.fromARGB(255, 226, 134, 134),
        ),
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  width: screenwidth * 0.42,
                  height: screenhight * 0.16,
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Image.network(
                      thumbnailImage,
                      width: screenwidth * 0.40,
                      height: screenhight * 0.16,
                      // fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: screenhight * 0.01,
                ),
                Container(
                  width: screenwidth * 0.38,
                  height: screenhight * 0.15,
                  // color: Colors.blueAccent,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        width: screenwidth * 0.38,
                        height: screenhight * 0.03,
                        // color: Color.fromARGB(255, 64, 255, 166),
                        child: H1text(
                          fonttext: title,
                          size: screenwidth * 0.036,
                          weight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: screenhight * 0.01,
                      ),
                      Container(
                        width: screenwidth * 0.38,
                        height: screenhight * 0.060,
                        // color: Colors.amberAccent,
                        child: Ptext(
                          fonttext: discription,
                          size: screenwidth * 0.026,
                          weight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(
                        height: screenhight * 0.01,
                      ),
                      Expanded(
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              H1text(
                                fonttext: " \u{20B9} $price",
                                size: screenwidth * 0.038,
                                weight: FontWeight.w600,
                              ),
                              InkWell(
                                onTap: () {
                                  addToCart();
                                },
                                child: Container(
                                    width: screenwidth * 0.12,
                                    height: screenhight * 0.036,
                                    decoration: BoxDecoration(
                                        color: TheamColors.primaryColor,
                                        borderRadius: BorderRadius.circular(6)),
                                    child: Icon(
                                      Icons.add,
                                      color: TheamColors.backgroundColor,
                                    )
                                    ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            Positioned(
                top: 6,
                right: 6,
                child: Container(
                  // color: Color.fromARGB(255, 197, 246, 22),
                  width: screenwidth * 0.10,
                  height: screenhight * 0.04,
                  child: LikeButton(
                    circleColor: CircleColor(
                        start: Color(0xff00ddff), end: Color(0xff0099cc)),
                    bubblesColor: BubblesColor(
                      dotPrimaryColor: Color(0xff33b5e5),
                      dotSecondaryColor: Color(0xff0099cc),
                    ),
                    likeBuilder: (bool isLiked) {
                      print(isLiked);
                      return Icon(
                        Icons.favorite,
                        color: isLiked ? Colors.deepPurpleAccent : Colors.grey,
                        size: screenwidth * 0.050,
                      );
                    },
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
