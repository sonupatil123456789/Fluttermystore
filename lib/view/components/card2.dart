import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:like_button/like_button.dart';
import 'package:mystore/view/components/heading_text.dart';
import 'package:mystore/view/components/paragraph_text.dart';

import '../../utils/routes/routes_name.dart';

class Card2 extends StatelessWidget {

  String productId;
  Map SingleProduct;
  String thumbnailImage;
  String title;
  String discription;
  String price;
  num starRating;
   Card2({
    super.key ,
     required this.productId,
    required this.SingleProduct,
    required this.thumbnailImage,
    required this.title,
    required this.discription,
    required this.price,
    required this.starRating,
    });

  Widget build(BuildContext context) {
    final dynamic screenhight = MediaQuery.of(context).size.height;
    final dynamic screenwidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
                Navigator.pushNamed(
          context,
          RoutesName.productsDetail,
          arguments: {"SingleProduct" : SingleProduct}
        );
      },
      child: Container(
        width: screenwidth * 0.94,
        height: screenhight * 0.14,
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
                  width: screenwidth * 0.22,
                  height: screenhight * 0.09,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    // color: Color(0x4c000000),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      thumbnailImage,
                      width: screenwidth * 0.15,
                      height: screenhight * 0.06,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                SizedBox(width: screenwidth * 0.05),
                Container(
                  width: screenwidth * 0.56,
                  height: screenhight * 0.086,
                  // color: Color.fromARGB(255, 128, 64, 255),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            width: screenwidth * 0.42,
                            height: screenhight * 0.028,
                            // color: Color.fromARGB(255, 64, 255, 166),
                            child: H1text(
                              fonttext: title,
                              size: screenwidth * 0.036,
                              weight: FontWeight.w600,
                            ),
                          ),
                          Container(
                            width: screenwidth * 0.42,
                            height: screenhight * 0.030,
                            alignment: Alignment.topCenter,
                            // color: Colors.amberAccent,
                            child: H1text(
                              fonttext:
                                   discription,
                              size: screenwidth * 0.026,
                              weight: FontWeight.w300,
                            ),
                          ),
                          H1text(
                            fonttext: " \u{20B9} $price",
                            size: screenwidth * 0.038,
                            weight: FontWeight.w600,
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: Column(
                          children: [
                            Container(
                              width: screenwidth * 0.10,
                              height: screenhight * 0.03,
                              alignment: Alignment.center,
                              color: Color.fromARGB(255, 229, 243, 250),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.deepPurpleAccent,
                                    size: screenwidth * 0.04,
                                  ),
                                  Ptext(
                                    fonttext:starRating.toString(),
                                    size: screenwidth * 0.022,
                                    weight: FontWeight.w600,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                                child: Container(
                              // color: Color.fromARGB(255, 197, 246, 22),
                              width: screenwidth * 0.10,
                              height: screenhight * 0.04,
                              child: LikeButton(
                                circleColor: CircleColor(
                                    start: Color(0xff00ddff),
                                    end: Color(0xff0099cc)),
                                bubblesColor: BubblesColor(
                                  dotPrimaryColor: Color(0xff33b5e5),
                                  dotSecondaryColor: Color(0xff0099cc),
                                ),
                                likeBuilder: (bool isLiked) {
                                  print(isLiked);
                                  return Icon(
                                    Icons.favorite,
                                    color: isLiked
                                        ? Colors.deepPurpleAccent
                                        : Colors.grey,
                                    size: screenwidth * 0.050,
                                  );
                                },
                              ),
                            ))
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
      ),
    );
  }
}
