import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mystore/models/brand_model.dart';
import 'package:mystore/view/components/card.dart';
import 'package:mystore/view/components/card3.dart';
import 'package:mystore/view/components/navbar.dart';
import 'package:provider/provider.dart';

import '../../controllers/brand_controller.dart';
import '../../controllers/cart_controller.dart';

class BrandList extends StatefulWidget {
  BrandList({super.key});

  @override
  State<BrandList> createState() => _BrandListState();
}

class _BrandListState extends State<BrandList> {
  late BrandController brandController = BrandController();
  late CartController cartController = CartController();
  late String brandValue = "648abd3507d47212d565cca3";
  late String brandName = "Apple";

  @override
  void initState() {
    brandController = Provider.of<BrandController>(context, listen: false);
    brandController.fetchProductByBrandController(context, brandValue);
    brandController.brandController(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final dynamic screenhight = MediaQuery.of(context).size.height;
    final dynamic screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          // color: Colors.amberAccent,
          child: Column(
            children: [
           Consumer<BrandController>(
            builder: (BuildContext context, value, Widget? child) { 
            return     Navbar(
                isVisible: false,
                title: 'Brands',
                subtitle: '[${value.products.products!.length}]',
                cart: true,
                filter: false,
                search: false,
                backButton: true,
                cartCount: null,
              );
           },),
//////////////////////////////////////////////////////////////////////////////////

              Consumer<BrandController>(
                  builder: (BuildContext context, value, Widget? child) {
                var items = value.brand.brands;
                return Container(
                    width: screenwidth * 0.90,
                    height: screenhight * 0.11,
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
                                        onCardClick: (brandValue) {
                                          brandController
                                              .fetchProductByBrandController(
                                                  context, brandValue);
                                        },
                                        
                                        categorys: items,
                                        cardType: "BrandScreen",
                                      ),
                                    ],
                                  );
                                },
                              ));
              }),
///////////////////////////////////////////////////////////////////////////////////
              SizedBox(
                height: screenhight * 0.01,
              ),
              Consumer<BrandController>(
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
                                      thumbnailImage:
                                          items.thumbnail.toString(),
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
      ),
    );
  }
}
