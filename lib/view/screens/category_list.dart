import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mystore/models/category_model.dart';
import 'package:mystore/view/components/card.dart';
import 'package:mystore/view/components/navbar.dart';
import 'package:mystore/view/screens/cart_list.dart';
import 'package:mystore/view/screens/search_screen.dart';
import 'package:provider/provider.dart';

import '../../controllers/cart_controller.dart';
import '../../controllers/category_controller.dart';
import '../../controllers/product_controller.dart';
import '../../utils/constants/assets.dart';
import '../components/bottom_sheet.dart';
import '../components/card3.dart';
import '../components/heading_text.dart';
import '../components/icon_svg_button.dart';
import '../components/paragraph_text.dart';

class CategoryList extends StatefulWidget {
  
  CategoryList({super.key});

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  late CategoryController categoryController = CategoryController();
  late CartController cartController = CartController();
    late String categoryValue = "643bbe6a81145223f448ea5f";
  late String categoryName = "Mens fashion";



  @override
  void initState() {
    categoryController =
        Provider.of<CategoryController>(context, listen: false);

    categoryController.categoryController(context);
    categoryController.fetchProductByCategoryController(context, categoryValue);
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
              Navbar(
                isVisible: false,
                title: 'Category',
                subtitle: '[1]',
                cart: true,
                filter: false,
                search: false,
                backButton: true,
                cartCount: null,
              ),
//////////////////////////////////////////////////////////////////////////////////

              Consumer<CategoryController>(
                  builder: (BuildContext context, value, Widget? child) {
                var items = value.category.categorys;
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
                                itemCount: value.category.categorys!.length,
                                itemBuilder: (context, index) {
                                  var items = value.category.categorys![index];
                                  return Wrap(
                                    crossAxisAlignment:
                                        WrapCrossAlignment.center,
                                    runAlignment: WrapAlignment.center,
                                    children: [
                                      Card3(
                                        image: items.title.toString(),
                                        name: items.title.toString(),
                                        onCardClick: (categoryValue) {
                                          print(
                                              " =======================$categoryValue");
                                           categoryController.fetchProductByCategoryController(context, categoryValue);
                                        },
                                       
                                        categorys: items,
                                        cardType: "CategoryScreen",
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
              Consumer<CategoryController>(
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
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 2 / 3,
                                ),
                                itemBuilder: (BuildContext context, int index) {
                                  var items = value.products.products![index];
                                  return Padding(
                                    padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
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
