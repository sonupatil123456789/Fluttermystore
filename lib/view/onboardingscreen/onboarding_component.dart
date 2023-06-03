import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:mystore/utils/routes/routes_name.dart';
import 'package:mystore/view/components/coustom_button.dart';
import 'package:mystore/view/components/lotee_asset.dart';

import '../../utils/constants/colorpallets.dart';

class OnboardingComponent extends StatelessWidget {
  String title;
  String discription;
  String assetLink;
  bool isDone;

  OnboardingComponent(
      {super.key,
      required this.title,
      required this.discription,
      required this.assetLink,
      required this.isDone});

  Future setOnBoardingScreen() async {
    var box = await Hive.openBox("onBoarding");
    await box.put('setOnboarding', false);
  }

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    return Container(
      child: Column(children: [
        Container(
          height: screenheight * 0.50,
          width: screenwidth,
          child: ltAsset(assetLink: assetLink),
        ),
        SizedBox(
          height: screenheight * 0.05,
        ),
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
          child: Text(
            title,
            style: GoogleFonts.poppins(
                fontSize: screenwidth * 0.05, fontWeight: FontWeight.w800),
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(30, 18, 30, 0),
          child: Text(
            discription,
            textAlign: TextAlign.center,
            style: GoogleFonts.notoSans(
                fontSize: screenwidth * 0.034, fontWeight: FontWeight.w300),
          ),
        ),
        SizedBox(
          height: screenheight * 0.04,
        ),
        Visibility(
            visible: isDone,
            child: CommonButton(
                width: screenwidth * 0.40,
                height: screenheight * 0.056,
                btnTitle: "Done",
                btnColor: TheamColors.primaryColor,
                onTapHandler: () {
                  setOnBoardingScreen();
                  Navigator.pushNamed(context, RoutesName.auth);
                })),
      ]),
    );
  }
}
