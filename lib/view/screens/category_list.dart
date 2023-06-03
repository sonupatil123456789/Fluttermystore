import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mystore/view/components/card.dart';
import 'package:mystore/view/components/navbar.dart';

class CategoryList extends StatelessWidget {
  CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    final dynamic screenhight = MediaQuery.of(context).size.height;
    final dynamic screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: SafeArea(
              child: Container(
        // color: Colors.amberAccent,
        child: Column(
          children: [
            Navbar(
              isVisible: false,
              title: 'Mobile',
              subtitle: '[24]',
              cart: true,
              filter: true,
              search: true,
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
                  child: GridView.builder(
                    shrinkWrap: false,
                    itemCount: 10,
                    gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 2 / 3,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                        // child: Card1(),
                      );
                    },
                  )

                  //  Wrap(
                  //   runSpacing: screenwidth * 0.01,
                  //   alignment: WrapAlignment.spaceEvenly,
                  //   children: [
                  //     Card1(),
                  //     Card1(),
                  //     Card1(),
                  //     Card1(),
                  //     Card1(),
                  //     Card1(),
                  //     Card1(),
                  //     Card1()
                  //   ],
                  // )

                  ),
            ),
          ],
        ),
      ))),
    );
  }
}
