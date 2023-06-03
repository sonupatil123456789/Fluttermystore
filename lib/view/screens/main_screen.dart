import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mystore/controllers/homescreen_controller.dart';
import 'package:mystore/view/components/bottom_bar.dart';
import 'package:mystore/view/components/card2.dart';
import 'package:mystore/view/components/choice_chips.dart';
import 'package:mystore/view/screens/all_product_screen.dart';
import 'package:mystore/view/screens/category_list.dart';
import 'package:mystore/view/screens/home_screen.dart';
import 'package:provider/provider.dart';

import '../../controllers/product_controller.dart';
import '../../utils/constants/assets.dart';
import '../../utils/constants/colorpallets.dart';
import '../components/card3.dart';
import '../components/card_header.dart';
import '../components/cart_card.dart';
import '../components/crowsel.dart';
import '../components/navbar.dart';

List<String> chipList = ["Household", "Cloathing", "Grocessary", "Cosmatics"];

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List listdata = [];
  Map mapData = {};

  late String categoryValue;

  late HomeScreenController homescreenController = HomeScreenController();

  @override
  Widget build(BuildContext context) {
    homescreenController =
        Provider.of<HomeScreenController>(context, listen: false);
    homescreenController.categoryController(context);

    GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    final dynamic screenhight = MediaQuery.of(context).size.height;
    final dynamic screenwidth = MediaQuery.of(context).size.width;

    return Expanded(
      child: Container(
        // color: Color.fromARGB(255, 244, 244, 244),
        child: Consumer<HomeScreenController>(
          builder: (BuildContext context, value, Widget? child) {
            return Column(children: [
              // Navbar section  ==================================================================
              Navbar(
                isVisible: true,
                title: 'Shreyas patil',
                subtitle: 'Hello 👋',
                cart: true,
                filter: false,
                search: true,
                backButton: false,
              ),
              // top selling products crowsel slider component ==================================================================
              CrowselSlider(
                height: screenhight,
                width: screenwidth,
                crowselclick: () {
                  print("hello");
                },
              ),
              // category choice chips component  ==================================================================
              Row(
                children: [
                  Expanded(
                      child: Container(
                          height: screenhight * 0.072,
                          decoration: BoxDecoration(
                              // color: Color.fromARGB(60, 210, 108, 108),
                              borderRadius: BorderRadius.circular(10)),
                          child: ChoiceChipCatogary(
                            data: value.category.categorys,
                            bgColor: TheamColors.unselectedChipColor,
                            selectColor: TheamColors.selectedChipColor,
                            textColor: TheamColors.PtexrtColor2,
                            isVisible: false,
                            ChoiceChip: (choiceValue) {
                              categoryValue = choiceValue['_id'];
                              print("Color value is === ${choiceValue['_id']}");
                            },
                          ))),
                ],
              ),
              Expanded(
                child: Container(
                  // color: Colors.amber,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        // category section  ==================================================================
                        CardHeader(
                          titleText: "Mobile",
                          navigateToList: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CategoryList()),
                            );
                          },
                          isVisible: true,
                        ),

                        Container(
                            width: screenwidth * 0.90,
                            height: screenhight * 0.36,
                            // color: Color.fromARGB(255, 214, 83, 83),
                            child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: 5,
                              itemBuilder: (context, index) {
                                return Wrap(
                                  runSpacing: screenwidth * 0.03,
                                  alignment: WrapAlignment.spaceEvenly,
                                  children: [Text("this is the text")],
                                );
                              },
                            )),

                        // according to top rating of product sectionn  ==================================================================
                        CardHeader(
                          titleText: "Top Rated",
                          navigateToList: () {},
                          isVisible: true,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            // children: [Card2(), Card2(), Card2(), Card2()],
                          ),
                        ),
                        // top10 latest products sectionn  ==================================================================
                        CardHeader(
                          titleText: "New Arrival",
                          navigateToList: () {},
                          isVisible: true,
                        ),
                        Container(
                            width: screenwidth * 0.90,
                            height: screenhight * 0.36,
                            // color: Color.fromARGB(255, 214, 83, 83),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // Card1(
                                  //   addToCart: () {
                                  //     print("Add to cart");
                                  //   },
                                  //   allData: listdata,
                                  //   discription:
                                  //       "IPhone 14 and iPhone 14 Plus introduce a new standard for photo and video capture with a new 12MP Main camera featuring a larger sensor and larger pixels, a new front TrueDepth camera, the Ultra Wide camera to capture more of a scene, and Photonic Engine for a giant leap in low-light performance.",
                                  //   price: 1000.toString(),
                                  //   thumbnailImage:
                                  //       "https://www.apple.com/newsroom/images/product/iphone/standard/Apple-iPhone-14-iPhone-14-Plus-2up-midnight-220907_inline.jpg.large_2x.jpg",
                                  //   title: "iPhone 14 Plus", index: 1,
                                  // ),
                                ],
                              ),
                            )),
                        // top brand sectionn  ==================================================================
                        CardHeader(
                          titleText: "Top Brands",
                          navigateToList: () {},
                          isVisible: true,
                        ),
                        Container(
                            width: screenwidth * 0.90,
                            height: screenhight * 0.36,
                            // color: Color.fromARGB(255, 214, 83, 83),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Card3(
                                      brandImage: AssetImgLinks.apple,
                                      brandName: 'Apple',
                                      onCard3Click: () {}),
                                  Card3(
                                      brandImage: AssetImgLinks.samsung,
                                      brandName: 'Samsung',
                                      onCard3Click: () {}),
                                  Card3(
                                      brandImage: AssetImgLinks.hp,
                                      brandName: 'Hp',
                                      onCard3Click: () {}),
                                  Card3(
                                      brandImage: AssetImgLinks.microsoft,
                                      brandName: 'Microsoft',
                                      onCard3Click: () {})
                                ],
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
              // const BottomBar()
            ]);
          },
        ),
      ),
    );
  }
}
