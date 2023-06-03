import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:like_button/like_button.dart';
import 'package:mystore/view/components/icon_svg_button.dart';
import 'package:mystore/view/components/paragraph_text.dart';

import '../../utils/constants/colorpallets.dart';
import 'heading_text.dart';

class Card3 extends StatelessWidget {
  String brandImage;
  String brandName;
  Function onCard3Click;
  Card3({
    super.key,
    required this.brandImage,
    required this.brandName,
    required this.onCard3Click,
  });

  @override
  Widget build(BuildContext context) {
    final dynamic screenhight = MediaQuery.of(context).size.height;
    final dynamic screenwidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        onCard3Click();
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(8, 0, 8, 0),
        width: screenwidth * 0.42,
        height: screenhight * 0.20,
        decoration: BoxDecoration( 
            // color: Color.fromARGB(255, 233, 233, 233),
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: screenhight * 0.020,
            ),
            Container(
              width: screenwidth * 0.20,
              height: screenhight * 0.10,
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: SvgPicture.asset(brandImage,
                    width: screenwidth * 0.20,
                    height: screenhight * 0.10,
                    semanticsLabel: 'Cart'),
              ),
            ),
            SizedBox(
              height: screenhight * 0.020,
            ),
            Container(
              width: screenwidth * 0.38,
              height: screenhight * 0.03,
              // color: Colors.blueAccent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: screenwidth * 0.38,
                    height: screenhight * 0.03,
                    // color: Color.fromARGB(255, 64, 255, 166),
                    child: H1text(
                      fonttext: brandName,
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
