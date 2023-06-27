import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../utils/constants/colorpallets.dart';
import '../../utils/routes/routes_name.dart';
import '../components/coustom_button.dart';

class PlacedOrderScreen extends StatelessWidget {
  const PlacedOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(children: [

                         Icon(CupertinoIcons.cube_box_fill, color: TheamColors.unselectedChipColor, size: 100),
              const SizedBox(height: 10,),
              const Text("Order Placed!",),
              const SizedBox(height: 10,),
              const Text("You can check out the status by going to Profile > My Orders", textAlign: TextAlign.center,),
          CommonButton(
              width: 200,
              height: 50,
              btnTitle: "Continue shopping",
              btnColor: TheamColors.primaryColor,
              // .unselectedChipColor

              onTapHandler: () {
                Navigator.popUntil(context, (route) => route.isFirst);
                Navigator.pushNamed(context, RoutesName.home);
              }),
        ]),
      )),
    );
  }
}
