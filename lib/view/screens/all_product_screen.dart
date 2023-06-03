import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mystore/controllers/product_controller.dart';
import 'package:mystore/view/components/bottom_bar.dart';
import 'package:mystore/view/components/bottom_sheet.dart';
import 'package:mystore/view/components/card.dart';
import 'package:mystore/view/components/heading_text.dart';
import 'package:mystore/view/components/navbar.dart';
import 'package:mystore/view/screens/cart_list.dart';
import 'package:mystore/view/screens/search_screen.dart';
import 'package:provider/provider.dart';
import '../../controllers/cart_controller.dart';
import '../../utils/constants/assets.dart';
import '../../utils/constants/colorpallets.dart';
import '../components/dropdown.dart';
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("built function ran");
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
                                fonttext: "[${value.products.products.length}]",
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
                              showCoustomBottomSheet(context);
                            },
                            height: screenhight,
                            width: screenwidth,
                            iconimage: AssetImgLinks.filter),
                      ),
                      IconSvgButton(
                          crowselclick: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SearchScreen()),
                            );
                          },
                          height: screenhight,
                          width: screenwidth,
                          iconimage: AssetImgLinks.search),
                      Stack(
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
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.white70),
                                )),
                          ),
                          IconSvgButton(
                              crowselclick: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CartList()),
                                );
                              },
                              height: screenhight,
                              width: screenwidth,
                              iconimage: AssetImgLinks.cart),
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
                return dataListLength == 0 || dataListLength == null
                    ? Center(
                        child:
                            Text("Your cart is empty Please continue shopping"),
                      )
                    : value.loading == true
                        ? const Center(child: CircularProgressIndicator())
                        : Expanded(
                            child: value.loading == false
                                ? Container(
                                    width: screenwidth,
                                    height: screenhight * 0.36,
                                    // color: Color.fromARGB(255, 214, 83, 83),
                                    child: GridView.builder(
                                      shrinkWrap: false,
                                      itemCount: value.products.products.length,
                                      gridDelegate:
                                          new SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        childAspectRatio: 2 / 3,
                                      ),
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        var iteams =
                                            value.products.products[index];
                                        return Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(0, 5, 0, 5),
                                          child: Card1(
                                            addToCart: () {
                                              Map data = {
                                                "product": iteams['_id'],
                                                "quantity": 1,
                                                "color": iteams['color'][0],
                                                "size": iteams['size'][0]
                                              };

                                              cartController
                                                  .addToCartController(
                                                      context, data);
                                            },

                                            discription: iteams['discription'],
                                            price: iteams['price'].toString(),
                                            thumbnailImage: iteams['thumbnail'],
                                            title: iteams['title'],
                                            productId: iteams['_id'],
                                            SingleProduct: iteams,
                                            // : iteams,
                                          ),
                                        );
                                      },
                                    ))
                                : const Center(
                                    child: CircularProgressIndicator()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
