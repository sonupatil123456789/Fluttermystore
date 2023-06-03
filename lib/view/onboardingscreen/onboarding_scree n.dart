import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:mystore/utils/constants/assets.dart';
import 'package:mystore/view/onboardingscreen/onboarding_component.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final controller = PageController(initialPage: 0);
  int pagedotno = 0;

  Future onBoardingScreen() async {
    var box = await Hive.openBox("onBoarding");
    box.put("setOnboarding", false);
    box.put("setOnboardingData", "onBoarding");
  }

  @override
  void initState() {
    onBoardingScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: Container(
              width: screenwidth,
              // color: Color.fromRGBO(118, 125, 216, 1),
              height: screenheight * 0.80,
              child: PageView(
                scrollDirection: Axis.horizontal,
                onPageChanged: (value) {
                  print("page no is ${value + 1}");
                },
                children: [
                  OnboardingComponent(
                    title: "Welcome to mystore 🖐️",
                    discription:
                        " Welcome to my store app where you can find your desired product in your budget  ",
                    assetLink: AssetImgLinks.splash1, isDone: false ,
                  ),
                  OnboardingComponent(
                      title: "Local retailers",
                      discription:
                          " get your product in hand from your local and trusted seller with discount coupons ",
                      assetLink: AssetImgLinks.splash2, isDone: false),
                  OnboardingComponent(
                      title: "Fast delivery service",
                      discription:
                          " get your product in hand in no time and with free of cost no delivery charges",
                      assetLink: AssetImgLinks.splash3,isDone: true)
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
