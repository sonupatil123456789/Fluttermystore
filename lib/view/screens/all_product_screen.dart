import 'package:flutter/material.dart';
import 'package:mystore/controllers/product_controller.dart';
import 'package:mystore/view/components/bottom_sheet.dart';
import 'package:mystore/view/components/card.dart';
import 'package:mystore/view/components/heading_text.dart';
import 'package:provider/provider.dart';
import '../../controllers/cart_controller.dart';
import '../../utils/constants/assets.dart';
import '../../utils/constants/colorpallets.dart';
import '../../utils/routes/routes_name.dart';
import '../components/icon_svg_button.dart';
import '../components/paragraph_text.dart';

class AllProductScreen extends StatefulWidget {
  AllProductScreen({super.key});

  @override
  State<AllProductScreen> createState() => _AllProductScreenState();
}

class _AllProductScreenState extends State<AllProductScreen> {
  late ProductController productController = ProductController();
  late CartController cartController = CartController();

  @override
  void initState() {
    productController = Provider.of<ProductController>(context, listen: false);
    productController.getAllProductsController(context);

    cartController = Provider.of<CartController>(context, listen: false);
    cartController.fetchUserCartController(context);
    super.initState();
  }

  filterProductsController(queryData) async {
    await productController.filterProductsController(context, queryData);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final dynamic screenhight = MediaQuery.of(context).size.height;
    final dynamic screenwidth = MediaQuery.of(context).size.width;
    return Expanded(
      child: Container(
        // color: Colors.amberAccent,
        child: Column(
          children: [
            Consumer<ProductController>(
              builder: (BuildContext context, value, Widget? child) {
                return Container(
                  width: screenwidth,
                  height: screenhight * 0.07,
                  // color: Colors.amber,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          width: screenwidth * 0.55,
                          child: Row(
                            children: [
                              H1text(
                                fonttext: "Products",
                                size: screenwidth * 0.046,
                                weight: FontWeight.w700,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Ptext(
                                fonttext:
                                    "[${value.loading == true ? "" : value.products.products!.length.toString()}]",
                                size: screenwidth * 0.032,
                                weight: FontWeight.w400,
                              ),
                            ],
                          )),
                      Container(
                        width: screenwidth * 0.06,
                        height: screenhight * 0.02,
                        child: IconSvgButton(
                            crowselclick: () {
                              showCoustomBottomSheet(context, screenwidth,
                                  screenhight, filterProductsController);
                            },
                            height: screenhight,
                            width: screenwidth,
                            iconimage: AssetImgLinks.filter,  iconImageColor: TheamColors.primaryColor,),
                      ),
                      IconSvgButton(
                          crowselclick: () {
                            Navigator.pushNamed(context, RoutesName.searchScreen);
                          },
                          height: screenhight,
                          width: screenwidth,
                          iconimage: AssetImgLinks.search, iconImageColor: TheamColors.primaryColor,),
                      Stack(
                        children: [
                          Positioned(
                            right: 0,
                            // top: 2,
                            child: Consumer<CartController>(
                              builder: (context, value, child) {
                                return Container(
                                    alignment: Alignment.center,
                                    width: screenwidth * 0.035,
                                    height: screenhight * 0.016,
                                    decoration: BoxDecoration(
                                        color: Color.fromARGB(255, 255, 73, 73),
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    child: Text(
                                      value.cart.userCart == null
                                          ? "0"
                                          : value.cart.userCart!.length
                                              .toString(),
                                      style: TextStyle(
                                          fontSize: 10, color: Colors.white70),
                                    ));
                              },
                            ),
                          ),
                          IconSvgButton(
                              crowselclick: () {
                                Navigator.pushNamed(context, RoutesName.myCart);
                              },
                              height: screenhight,
                              width: screenwidth,
                              iconimage: AssetImgLinks.cart,  iconImageColor: TheamColors.primaryColor,)
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
            SizedBox(
              height: screenhight * 0.01,
            ),
            Consumer<ProductController>(
              builder: (BuildContext context, value, Widget? child) {
                print("value : ${value.products.success}");

                var dataListLength = value.products.products;

                if (value.loading == true || dataListLength == null) {
                  return Expanded(
                      child: Container(
                          alignment: Alignment.center,
                          child: const CircularProgressIndicator(
                            color: Colors.deepPurpleAccent,
                          )));
                } else {
                  if (dataListLength.length == 0 || dataListLength == null) {
                    return const Expanded(
                      child: Center(
                        child: Text("No products"),
                      ),
                    );
                  } else {
                    return Expanded(
                        child: Container(
                            width: screenwidth,
                            height: screenhight * 0.36,
                            // color: Color.fromARGB(255, 214, 83, 83),
                            child: GridView.builder(
                              shrinkWrap: false,
                              itemCount: value.products.products!.length,
                              gridDelegate:
                                  new SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 2 / 3,
                              ),
                              itemBuilder: (BuildContext context, int index) {
                                var items = value.products.products![index];
                                return Padding(
                                  padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                                  child: Card1(
                                    addToCart: () {
                                      Map data = {
                                        "product": items.sId,
                                        "quantity": 1,
                                        "color": items.color![0],
                                        "size": items.size![0]
                                      };
                                      cartController.addToCartController(
                                          context, data);
                                    },
                                    discription: items.discription.toString(),
                                    price: items.price.toString(),
                                    thumbnailImage: items.thumbnail.toString(),
                                    title: items.title.toString(),
                                    productId: items.sId.toString(),
                                    SingleProduct: items,
                                    likes: items.likes,
                                  ),
                                );
                              },
                            )));
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
