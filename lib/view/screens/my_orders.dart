import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mystore/utils/constants/colorpallets.dart';

import '../components/navbar.dart';
// import 'package:mystore/view/components/title_text.dart';

class MyOrder extends StatelessWidget {
  const MyOrder({super.key});

  @override
  Widget build(BuildContext context) {
    final dynamic screenhight = MediaQuery.of(context).size.height;
    final dynamic screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
            // height: screenhight * 0.40,
            child: Column(
          children: [
            Navbar(
              isVisible: false,
              title: 'MyCart',
              subtitle: '[1]',
              cart: false,
              filter: false,
              search: false,
              backButton: true,
              cartCount: null,
            ),
            SizedBox(
              height: screenhight * 0.01,
            ),
            Expanded(
              child: Container(
                // height: screenhight * 0.60,
                color: Colors.amber,
                child: ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: 3,
                  separatorBuilder: (context, index) {
                    return Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Divider(color: TheamColors.primaryColor),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    );
                  },
                  itemBuilder: (context, index) {
                    // final order = state.orders[index];
            
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "# - 643296439235",
                          style: TextStyle(color: TheamColors.backgroundColor),
                        ),
                        Text(
                          "29/03/2000",
                          style: TextStyle(color: TheamColors.backgroundColor),
                        ),
                        Text("Order Total: 500000",
                            style: TextStyle(
                                color: TheamColors.HtexrtColor1,
                                fontWeight: FontWeight.bold)),
            
                        // Text("# - ${order.sId}", style: TextStyles.body2.copyWith(color: AppColors.textLight),),
                        // Text(Formatter.formatDate(order.createdOn!), style: TextStyles.body2.copyWith(color: AppColors.accent),),
                        // Text("Order Total: ${Formatter.formatPrice(Calculations.cartTotal(order.items!))}", style: TextStyles.body1.copyWith(fontWeight: FontWeight.bold),),
            
                        Container(
                          height: screenhight * 0.60,
                          // color: Color.fromARGB(255, 66, 118, 221),
                          child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              // final item = order.items![index];
                              // final product = item.product!;
            
                              return ListTile(
                                  contentPadding: EdgeInsets.zero,
                                  leading: CachedNetworkImage(
                                    imageUrl:
                                        "https://m.media-amazon.com/images/I/61amb0CfMGL._SX679_.jpg",
                                  ),
                                  title: Text("One plus*pro"),
                                  subtitle: Text("Qty: 3"),
                                  trailing: Text("29000"));
                            },
                          ),
                        ),
            
                        // Text("Status: ${order.status}"),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
