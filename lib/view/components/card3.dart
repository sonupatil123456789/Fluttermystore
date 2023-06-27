import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:like_button/like_button.dart';
import 'package:mystore/models/brand_model.dart';
import 'package:mystore/view/components/icon_svg_button.dart';
import 'package:mystore/view/components/paragraph_text.dart';

import '../../models/category_model.dart';
import '../../utils/constants/colorpallets.dart';
import '../../utils/routes/routes_name.dart';
import 'heading_text.dart';

class Card3 extends StatelessWidget {
  String image;
  String name;
  Function onCardClick;
  dynamic categorys;
  dynamic cardType;

  
  Card3({
    super.key,
    required this.image,
    required this.name,
    required this.onCardClick,
    required this.categorys,
    required this.cardType,
  });

  @override
  Widget build(BuildContext context) {
    final dynamic screenhight = MediaQuery.of(context).size.height;
    final dynamic screenwidth = MediaQuery.of(context).size.width;


    return InkWell(
      onTap: () {
        onCardClick(categorys.sId);
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(8, 0, 8, 0),
        width: cardType == "CategoryScreen"|| cardType == "BrandScreen"
            ? screenwidth * 0.26
            : screenwidth * 0.42,
        height: cardType == "CategoryScreen" || cardType == "BrandScreen"
            ? screenhight * 0.10
            : screenhight * 0.20,
        decoration: BoxDecoration(
            color:  cardType == "CategoryScreen"|| cardType == "BrandScreen" ?null : Color.fromARGB(255, 233, 233, 233),
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            cardType == "CategoryScreen" || cardType == "BrandScreen"
                ? const SizedBox(
                    height: 0,
                  )
                : SizedBox(
                    height: screenhight * 0.020,
                  ),
            Container(
              width: cardType == "CategoryScreen" || cardType == "BrandScreen"
                  ? screenwidth * 0.14
                  : screenwidth * 0.26,
              height: cardType == "CategoryScreen" || cardType == "BrandScreen"
                  ? screenhight * 0.06
                  : screenhight * 0.12,
              decoration: BoxDecoration(
                color: cardType == "CategoryScreen" || cardType == "BrandScreen"
                    ? TheamColors.backgroundColor
                    : null,
                borderRadius: cardType == "CategoryScreen" || cardType == "BrandScreen"
                    ? BorderRadius.circular(50)
                    : BorderRadius.circular(6),
              ),
              child: cardType == "CategoryScreen" || cardType == "BrandScreen"
                  ? Container(
                      alignment: Alignment.center,
                      child: H1text(
                          fonttext: name.substring(0, 1),
                          weight: FontWeight.bold,
                          size: screenwidth * 0.08),
                    )
                  : 

                  CachedNetworkImage(
                      imageUrl: image,
                      fit: BoxFit.contain,
                      errorWidget: (context, url, error) => Icon(Icons.error),
                      fadeOutDuration: const Duration(milliseconds: 1000),
                      fadeOutCurve: Curves.easeOut,
                      fadeInDuration: const Duration(milliseconds: 500),
                    ),
            ),
            SizedBox(
              height: cardType == "CategoryScreen" || cardType == "BrandScreen"
                  ? screenhight * 0.004
                  : screenhight * 0.010,
            ),
            Container(
              height: screenhight * 0.03,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: screenwidth * 0.38,
                    height: screenhight * 0.03,
                    // color: Color.fromARGB(255, 64, 255, 166),
                    child: cardType == "CategoryScreen" || cardType == "BrandScreen"
                        ? H1text(
                            fonttext: name,
                            size: screenwidth * 0.028,
                            weight: FontWeight.w500,
                          )
                        : H1text(
                            fonttext: name,
                            size: screenwidth * 0.036,
                            weight: FontWeight.w600,
                          ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
