import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mystore/utils/constants/assets.dart';
import 'package:mystore/view/components/icon_svg_button.dart';
import 'package:mystore/view/components/paragraph_text.dart';
import 'package:mystore/view/screens/all_product_screen.dart';
import 'package:mystore/view/screens/favourate_wishlist.dart';

class BottomBar extends StatelessWidget {
  Function screen;
  Color backgroundColor;
  Color iconColor;

  BottomBar({
    super.key,
    required this.screen,
    required this.iconColor,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final dynamic screenhight = MediaQuery.of(context).size.height;
    final dynamic screenwidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenwidth,
      height: screenhight * 0.07,
      color: backgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconSvgButton(
                  crowselclick: () {
                    screen(0);
                  },
                  height: screenhight,
                  width: screenwidth,
                  iconimage: AssetImgLinks.home, iconImageColor: iconColor,),
              Ptext(
                fonttext: "Home",
                size: screenwidth * 0.028,
                weight: FontWeight.w300,
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconSvgButton(
                  crowselclick: () {
                    screen(1);
                  },
                  height: screenhight,
                  width: screenwidth,
                  iconimage: AssetImgLinks.list, iconImageColor: iconColor,),
              Ptext(
                fonttext: "Products",
                size: screenwidth * 0.028,
                weight: FontWeight.w300,
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconSvgButton(
                  crowselclick: () {
                    screen(2);
                  },
                  height: screenhight,
                  width: screenwidth,
                  iconimage: AssetImgLinks.brandWatermark, iconImageColor: iconColor,),
              Ptext(
                fonttext: "My Orders",
                size: screenwidth * 0.028,
                weight: FontWeight.w300,
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconSvgButton(
                  crowselclick: () {
                    screen(3);
                  },
                  height: screenhight,
                  width: screenwidth,
                  iconimage: AssetImgLinks.favorite, iconImageColor: iconColor,),
              Ptext(
                fonttext: "favorite",
                size: screenwidth * 0.028,
                weight: FontWeight.w300,
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconSvgButton(
                  crowselclick: () {
                    screen(4);
                  },
                  height: screenhight,
                  width: screenwidth,
                  iconimage: AssetImgLinks.profile, iconImageColor: iconColor,),
              Ptext(
                fonttext: "Profile",
                size: screenwidth * 0.028,
                weight: FontWeight.w300,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
