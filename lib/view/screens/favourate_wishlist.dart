import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mystore/view/components/bottom_bar.dart';
import 'package:mystore/view/components/card2.dart';
import 'package:mystore/view/components/navbar.dart';
// import 'package:mystore/view/components/title_text.dart';

class FavourateWishList extends StatelessWidget {
  const FavourateWishList({super.key});

  @override
  Widget build(BuildContext context) {
    final dynamic screenhight = MediaQuery.of(context).size.height;
    final dynamic screenwidth = MediaQuery.of(context).size.width;
    return Expanded(
      child: Container(
        // color: Colors.amberAccent,
        child: Column(
          children: [

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
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Wrap(
                        runSpacing: screenwidth * 0.03,
                        alignment: WrapAlignment.spaceEvenly,
                        children: const [
                          // Card2(),
                          // Divider(
                          //   color: Color.fromARGB(255, 78, 78, 78),
                          //   height: 20,
                          // ),
                        ],
                      );
                    },
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
