

import 'dart:convert';


class ProductModel {
  ProductModel({
    required this.success,
    required this.message,
    required this.products,
  });

  bool success;
  String message;
  List<dynamic> products;

}

class Product {
  Product({
    required this.discountPercentage,
    required this.color,
    required this.size,
    required this.id,
    required this.title,
    required this.discription,
    required this.price,
    required this.rating,
    required this.thumbnail,
    required this.stock,
    required this.brand,
    required this.productImages,
    required this.createdAt,
    required this.category,
    required this.updatedAt,
    required this.v,
  });

  double discountPercentage;
  List<String> color;
  List<String> size;
  String id;
  String title;
  String discription;
  int price;
  double rating;
  String thumbnail;
  String category;
  String brand;
  int stock;
  List<String> productImages;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

}
