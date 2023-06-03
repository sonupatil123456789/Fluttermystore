import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:lottie/lottie.dart';
import 'package:mystore/utils/constants/assets.dart';
import 'package:mystore/view/components/dropdown.dart';
import 'package:mystore/view/components/heading_text.dart';
import 'package:mystore/view/components/icon_svg_button.dart';
import 'package:mystore/view/components/paragraph_text.dart';
import 'package:mystore/view/screens/cart_list.dart';
import 'package:mystore/view/screens/search_screen.dart';

class Navbar extends StatelessWidget {
  String title;
  bool isVisible;
  String subtitle;
  bool filter;
  bool search;
  bool cart;
  bool backButton;
  // bool isDisableBtn;

  Navbar({
    super.key,
    required this.title,
    required this.isVisible,
    required this.subtitle,
    required this.filter,
    required this.search,
    required this.cart,
    required this.backButton,
  });

  @override
  Widget build(BuildContext context) {
    final dynamic screenhight = MediaQuery.of(context).size.height;
    final dynamic screenwidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenwidth,
      height: screenhight * 0.07,
      // color: Colors.amber,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Container(
                width: screenwidth * 0.11,
                height: screenhight * 0.05,
                decoration: BoxDecoration(
                  // color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: backButton == true
                    ? InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: screenwidth * 0.11,
                          height: screenhight * 0.05,
                          // color: Colors.blueAccent,
                          child: Icon(
                            Icons.arrow_back_ios_new,
                            size: screenwidth * 0.05,
                          ),
                        ),
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Lottie.asset(
                          AssetImgLinks.profilepic,
                          fit: BoxFit.fill,
                        )),
              ),
            ],
          ),
          Container(
            width: screenwidth * 0.44,
            // color: Colors.amberAccent,
            child: isVisible == false
                ? Row(
                    children: [
                      H1text(
                        fonttext: title,
                        size: screenwidth * 0.040,
                        weight: FontWeight.w600,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Ptext(
                        fonttext: subtitle,
                        size: screenwidth * 0.032,
                        weight: FontWeight.w400,
                      ),
                    ],
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      H1text(
                        fonttext: subtitle,
                        size: screenwidth * 0.042,
                        weight: FontWeight.w500,
                      ),
                      Ptext(
                        fonttext: title,
                        size: screenwidth * 0.032,
                        weight: FontWeight.w300,
                      ),
                    ],
                  ),
          ),
          Visibility.maintain(
            visible: filter,
            child: Container(
              width: screenwidth * 0.06,
              height: screenhight * 0.02,
              child: IconSvgButton(
                  crowselclick: () {},
                  height: screenhight,
                  width: screenwidth,
                  iconimage: AssetImgLinks.filter),
            ),
          ),
          Visibility.maintain(
            visible: search,
            child: IconSvgButton(
                crowselclick: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SearchScreen()),
                  );
                },
                height: screenhight,
                width: screenwidth,
                iconimage: AssetImgLinks.search),
          ),
          Visibility.maintain(
            visible: cart,
            child: Stack(
              children: [
                Positioned(
                  right: 0,
                  // top: 2,
                  child: Container(
                      alignment: Alignment.center,
                      width: screenwidth * 0.035,
                      height: screenhight * 0.016,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 73, 73),
                          borderRadius: BorderRadius.circular(100)),
                      child: const Text(
                        "4",
                        style: TextStyle(fontSize: 10, color: Colors.white70),
                      )),
                ),
                IconSvgButton(
                    crowselclick: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CartList()),
                      );
                    },
                    height: screenhight,
                    width: screenwidth,
                    iconimage: AssetImgLinks.cart),
              ],
            ),
          ),
        ],
      ),
    );
  }
}





