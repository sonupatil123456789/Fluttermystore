import 'dart:convert';

class CategoryModel {
  CategoryModel({
    required this.success,
    required this.message,
    required this.categorys,
  });

  bool success;
  String message;
  List<dynamic> categorys;
}

class Category {
  Category({
    required this.id,
    required this.title,
    required this.discription,
    required this.createdAt,
    required this.updatedOn,
    required this.v,
  });

  String id;
  String title;
  String discription;
  DateTime createdAt;
  DateTime updatedOn;
  int v;
}
