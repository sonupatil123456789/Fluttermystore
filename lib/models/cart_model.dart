// To parse this JSON data, do
//
//     final welcome6 = welcome6FromJson(jsonString);

import 'dart:convert';


class CartModel {
    CartModel({
        required this.success,
        required this.message,
        required this.newCart,
    });

    bool success;
    String message;
    NewCart newCart;
}

class NewCart {
    NewCart({
       required this.user,
       required this.id,
       required this.items,
    });

    String user;
    String id;
    List<dynamic> items;


}

class Item {
    Item({
       required this.product,
       required this.quantity,
       required this.color,
       required this.size,
       required this.id,
    });

    String product;
    int quantity;
    String color;
    String size;
    String id;


}