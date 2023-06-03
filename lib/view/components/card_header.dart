import 'package:flutter/material.dart';
import 'package:mystore/view/components/heading_text.dart';
import 'package:mystore/view/components/paragraph_text.dart';

class CardHeader extends StatelessWidget {
  String titleText;
  Function navigateToList;
  bool isVisible;
  CardHeader(
      {super.key,
      required this.titleText,
      required this.navigateToList,
      required this.isVisible});

  @override
  Widget build(BuildContext context) {
    final dynamic screenhight = MediaQuery.of(context).size.height;
    final dynamic screenwidth = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          // color: Colors.amber,
          width: screenwidth * 0.90,
          height: screenhight * 0.04,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              H1text(
                fonttext: titleText,
                size: screenwidth * 0.044,
                weight: FontWeight.w700,
              ),
              SizedBox(
                width: screenwidth * 0.40,
              ),
              Visibility(
                visible: isVisible,
                child: InkWell(
                  onTap: () {
                    navigateToList();
                  },
                  child: Ptext(
                    fonttext: "See more >",
                    size: screenwidth * 0.03,
                    weight: FontWeight.w300,
                  ),
                ),
              ),
              SizedBox(
                height: screenhight * 0.01,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
