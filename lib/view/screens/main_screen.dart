import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mystore/controllers/category_controller.dart';
import 'package:mystore/models/product_model.dart';
import 'package:mystore/utils/constants/api_endpoints.dart';
import 'package:mystore/utils/conversion_formater.dart';
import 'package:mystore/view/components/bottom_bar.dart';
import 'package:mystore/view/components/card2.dart';
import 'package:mystore/view/components/card4.dart';
import 'package:mystore/view/components/choice_chips.dart';
import 'package:mystore/view/screens/all_product_screen.dart';
import 'package:mystore/view/screens/category_list.dart';
import 'package:mystore/view/screens/home_screen.dart';
import 'package:provider/provider.dart';

import '../../controllers/brand_controller.dart';
import '../../controllers/cart_controller.dart';
import '../../controllers/product_controller.dart';
import '../../utils/constants/assets.dart';
import '../../utils/constants/colorpallets.dart';
import '../../utils/routes/routes_name.dart';
import '../components/card.dart';
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
  late String categoryValue = "643bbe6a81145223f448ea5f";
  late String categoryName = "Mens fashion";

  late String brandValue = "648abd3507d47212d565cca3";
  late String brandName = "Apple";

  late CategoryController categoryController = CategoryController();
  late CartController cartController = CartController();
  late ProductController productController = ProductController();
  late BrandController brandController = BrandController();

  @override
  void initState() {
    categoryController =
        Provider.of<CategoryController>(context, listen: false);
    cartController = Provider.of<CartController>(context, listen: false);
    productController = Provider.of<ProductController>(context, listen: false);
    brandController = Provider.of<BrandController>(context, listen: false);

    brandController.brandController(context);

    productController.mainBannerProducts(context);
    productController.mostLikedProducts(context);
    productController.HieghestRatedProducts(context);

    cartController.fetchUserCartController(context);

    categoryController.categoryController(context);
    categoryController.fetchProductByCategoryController(context, categoryValue);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    final dynamic screenhight = MediaQuery.of(context).size.height;
    final dynamic screenwidth = MediaQuery.of(context).size.width;

    return Expanded(
      child: Container(
          // color: Color.fromARGB(255, 244, 244, 244),
          child: Column(children: [
        // Navbar section  ==================================================================
        Consumer<CartController>(
          builder: (context, value, child) {
            return Navbar(
              isVisible: true,
              title: 'Shreyas patil',
              subtitle: 'Hello 👋',
              cart: true,
              filter: false,
              search: true,
              backButton: false,
              cartCount: value.cart.userCart,
            );
          },
        ),
// top selling products crowsel slider component ==================================================================
        Consumer<ProductController>(
          builder: (BuildContext context, value, Widget? child) {
            var items = value.latestProducts.products;
            return value.loading == true || items == null
                ? Container(
                    height: screenwidth * 0.60,
                    alignment: Alignment.center,
                    child: const CircularProgressIndicator(
                      color: Colors.deepPurpleAccent,
                    ))
                : items.length == 0
                    ? const Center(
                        child: Text("No products"),
                      )
                    : CrowselSlider(
                        crowselclick: () {},
                        data: value.latestProducts.products,
                        height: screenhight,
                        width: screenwidth,
                      );
          },
        ),

// category choice chips component  ==================================================================
        Consumer<CategoryController>(
          builder: (BuildContext context, value, Widget? child) {
            return Row(
              children: [
                Expanded(
                    child: Container(
                        height: screenhight * 0.072,
                        decoration: BoxDecoration(
                            // color: Color.fromARGB(60, 210, 108, 108),
                            borderRadius: BorderRadius.circular(10)),
                        child: ChoiceChipCatogary(
                          data: value.loading == true
                              ? []
                              : value.category.categorys as List,
                          bgColor: TheamColors.unselectedChipColor,
                          selectColor: TheamColors.selectedChipColor,
                          textColor: TheamColors.PtexrtColor2,
                          isVisible: false,
                          ChoiceChip: (choiceValue) {
                            categoryValue = choiceValue.sId;
                            categoryName = choiceValue.title;
                            categoryController.fetchProductByCategoryController(
                                context, categoryValue);
                            // print("Category === ${choiceValue.sId}");
                          },
                          chipType: 'Category',
                        ))),
              ],
            );
          },
        ),
// body section  ==================================================================
        Expanded(
          child: Container(
            // color: Colors.amber,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  // category section  ==================================================================
                  Consumer<CategoryController>(
                    builder: (BuildContext context, value, Widget? child) {
                      return CardHeader(
                        titleText: "${categoryName}",
                        navigateToList: () {
                          Navigator.pushNamed(context, RoutesName.categoryList);
                        },
                        isVisible: true,
                      );
                    },
                  ),

                  Consumer<CategoryController>(
                      builder: (BuildContext context, value, Widget? child) {
                    var items = value.products.products;
                    return Container(
                        width: screenwidth * 0.90,
                        height: screenhight * 0.40,
                        alignment: Alignment.center,
                        // color: Color.fromARGB(255, 214, 83, 83),
                        child: value.loading == true || items == null
                            ? Container(
                                alignment: Alignment.center,
                                child: const CircularProgressIndicator(
                                  color: Colors.deepPurpleAccent,
                                ))
                            : items.length == 0
                                ? const Center(
                                    child: Text("No products"),
                                  )
                                : ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: value.products.products!.length,
                                    itemBuilder: (context, index) {
                                      var items =
                                          value.products.products![index];
                                      return Wrap(
                                        crossAxisAlignment:
                                            WrapCrossAlignment.center,
                                        runAlignment: WrapAlignment.center,
                                        children: [
                                          Card1(
                                            addToCart: () {
                                              Map data = {
                                                "product": items.sId,
                                                "quantity": 1,
                                                "color": items.color![0],
                                                "size": items.size![0]
                                              };
                                              cartController
                                                  .addToCartController(
                                                      context, data);
                                            },
                                            discription:
                                                items.discription.toString(),
                                            price: items.price.toString(),
                                            thumbnailImage:
                                                items.thumbnail.toString(),
                                            title: items.title.toString(),
                                            productId: items.sId.toString(),
                                            SingleProduct: items,
                                            likes: items.likes,
                                          ),
                                        ],
                                      );
                                    },
                                  ));
                  }),

// according to top rating of product sectionn  ==================================================================
                  CardHeader(
                    titleText: "Highest Rated",
                    navigateToList: () {},
                    isVisible: true,
                  ),

                  Consumer<ProductController>(
                      builder: (BuildContext context, value, Widget? child) {
                    var items = value.rating.products;
                    return Container(
                        width: screenwidth * 0.90,
                        height: screenhight * 0.14,
                        alignment: Alignment.center,
                        // color: Color.fromARGB(255, 214, 83, 83),
                        child: value.loading == true || items == null
                            ? Container(
                                alignment: Alignment.center,
                                child: const CircularProgressIndicator(
                                  color: Colors.deepPurpleAccent,
                                ))
                            : items.length == 0
                                ? const Center(
                                    child: Text("No products"),
                                  )
                                : ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: value.rating.products!.length,
                                    itemBuilder: (context, index) {
                                      var items = value.rating.products![index];
                                      return Wrap(
                                        crossAxisAlignment:
                                            WrapCrossAlignment.center,
                                        runAlignment: WrapAlignment.center,
                                        children: [
                                          Card2(
                                            discription:
                                                items.discription.toString(),
                                            price: items.price.toString(),
                                            thumbnailImage:
                                                items.thumbnail.toString(),
                                            title: items.title.toString(),
                                            productId: items.sId.toString(),
                                            SingleProduct: items,
                                            likes: items.likes,
                                            starRating: items.rating as num,
                                          ),
                                        ],
                                      );
                                    },
                                  ));
                  }),

// top10 latest products sectionn  ==================================================================
                  CardHeader(
                    titleText: "New Arrival",
                    navigateToList: () {},
                    isVisible: true,
                  ),

                  Consumer<ProductController>(
                      builder: (BuildContext context, value, Widget? child) {
                    var items = value.latestProducts.products;
                    return Container(
                        width: screenwidth * 0.90,
                        height: screenhight * 0.40,
                        alignment: Alignment.center,
                        // color: Color.fromARGB(255, 214, 83, 83),
                        child: value.loading == true || items == null
                            ? Container(
                                alignment: Alignment.center,
                                child: const CircularProgressIndicator(
                                  color: Colors.deepPurpleAccent,
                                ))
                            : items.length == 0
                                ? const Center(
                                    child: Text("No products"),
                                  )
                                : ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount:
                                        value.latestProducts.products!.length,
                                    itemBuilder: (context, index) {
                                      var items =
                                          value.latestProducts.products![index];
                                      return Wrap(
                                        crossAxisAlignment:
                                            WrapCrossAlignment.center,
                                        runAlignment: WrapAlignment.center,
                                        children: [
                                          Card1(
                                            addToCart: () {
                                              Map data = {
                                                "product": items.sId,
                                                "quantity": 1,
                                                "color": items.color![0],
                                                "size": items.size![0]
                                              };

                                              cartController
                                                  .addToCartController(
                                                      context, data);
                                            },
                                            discription:
                                                items.discription.toString(),
                                            price: items.price.toString(),
                                            thumbnailImage:
                                                items.thumbnail.toString(),
                                            title: items.title.toString(),
                                            productId: items.sId.toString(),
                                            SingleProduct: items,
                                            likes: items.likes,
                                          ),
                                        ],
                                      );
                                    },
                                  ));
                  }),

                  // top brand sectionn  ==================================================================
                  Consumer<BrandController>(
                    builder: (BuildContext context, value, Widget? child) {
                      return CardHeader(
                        titleText: "Top Brands",
                        navigateToList: () {
                          Navigator.pushNamed(context, RoutesName.brandList);
                        },
                        isVisible: true,
                      );
                    },
                  ),

                  Consumer<BrandController>(
                      builder: (BuildContext context, value, Widget? child) {
                    var items = value.brand.brands;
                    return Container(
                        width: screenwidth * 0.90,
                        height: screenhight * 0.30,
                        alignment: Alignment.center,
                        // color: Color.fromARGB(255, 214, 83, 83),
                        child: value.loading == true || items == null
                            ? Container(
                                alignment: Alignment.center,
                                child: const CircularProgressIndicator(
                                  color: Colors.deepPurpleAccent,
                                ))
                            : items.length == 0
                                ? const Center(
                                    child: Text("No products"),
                                  )
                                : ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: value.brand.brands!.length,
                                    itemBuilder: (context, index) {
                                      var items = value.brand.brands![index];
                                      return Wrap(
                                        crossAxisAlignment:
                                            WrapCrossAlignment.center,
                                        runAlignment: WrapAlignment.center,
                                        children: [
                                          Card3(
                                            image: items.brandImage.toString(),
                                            name: items.title.toString(),
                                            onCardClick: (choiceValue) {
                                              // brandValue = choiceValue.sId;
                                              // brandName = choiceValue.title;
                                          
                                            },
                                            cardType: "Homescreen",
                                            categorys: items,
                                          ),
                                        ],
                                      );
                                    },
                                  ));
                  }),

                  // according most liked product sectionn  ==================================================================
                  CardHeader(
                    titleText: "Most liked",
                    navigateToList: () {},
                    isVisible: true,
                  ),
                  Consumer<ProductController>(
                      builder: (BuildContext context, value, Widget? child) {
                    var items = value.liked.products;
                    return Container(
                        width: screenwidth * 0.90,
                        height: screenhight * 0.40,
                        alignment: Alignment.center,
                        // color: Color.fromARGB(255, 214, 83, 83),
                        child: value.loading == true || items == null
                            ? Container(
                                alignment: Alignment.center,
                                child: const CircularProgressIndicator(
                                  color: Colors.deepPurpleAccent,
                                ))
                            : items.length == 0
                                ? const Center(
                                    child: Text("No products"),
                                  )
                                : ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    itemCount: value.liked.products!.length,
                                    itemBuilder: (context, index) {
                                      var items = value.liked.products![index];
                                      return Wrap(
                                        crossAxisAlignment:
                                            WrapCrossAlignment.center,
                                        runAlignment: WrapAlignment.center,
                                        children: [
                                          Card4(
                                            discription:
                                                items.discription.toString(),
                                            price: items.price.toString(),
                                            thumbnailImage:
                                                items.thumbnail.toString(),
                                            title: items.title.toString(),
                                            productId: items.sId.toString(),
                                            SingleProduct: items,
                                          likes: items.likes,
                                          ),
                                        ],
                                      );
                                    },
                                  ));
                  }),
                ],
              ),
            ),
          ),
        ),
        // const BottomBar()
      ])),
    );
  }
}
