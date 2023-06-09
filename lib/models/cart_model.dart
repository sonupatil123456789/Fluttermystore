class CartModel {
  bool? success;
  String? message;
  List<UserCart>? userCart;

  CartModel({this.success, this.message, this.userCart});

  CartModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['userCart'] != null) {
      userCart = <UserCart>[];
      json['userCart'].forEach((v) {
        userCart!.add(new UserCart.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.userCart != null) {
      data['userCart'] = this.userCart!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UserCart {
  Product? product;
  num? quantity;
  String? color;
  String? size;
  String? sId;

  UserCart({this.product, this.quantity, this.color, this.size, this.sId});

  UserCart.fromJson(Map<String, dynamic> json) {
    product =
        json['product'] != null ? new Product.fromJson(json['product']) : null;
    quantity = json['quantity'];
    color = json['color'];
    size = json['size'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    data['quantity'] = this.quantity;
    data['color'] = this.color;
    data['size'] = this.size;
    data['_id'] = this.sId;
    return data;
  }
}

class Product {
  String? sId;
  dynamic? likes;
  String? title;
  String? discription;
  dynamic? price;
  num? rating;
  dynamic? discountPercentage;
  List<String>? productImages;
  String? thumbnail;
  String? category;
  String? brand;
  int? stock;
  List<String>? color;
  List<String>? size;
  int? iV;
  String? createdAt;
  String? updatedAt;

  Product(
      {this.sId,
       this.likes,
      this.title,
      this.discription,
      this.price,
      this.rating,
      this.discountPercentage,
      this.productImages,
      this.thumbnail,
      this.category,
      this.brand,
      this.stock,
      this.color,
      this.size,
      this.iV,
      this.createdAt,
      this.updatedAt});

  Product.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    likes = json['likes'];
    title = json['title'];
    discription = json['discription'];
    price = json['price'];
    rating = json['rating'];
    discountPercentage = json['discountPercentage'];
    productImages = json['productImages'].cast<String>();
    thumbnail = json['thumbnail'];
    category = json['category'];
    brand = json['brand'];
    stock = json['stock'];
    color = json['color'].cast<String>();
    size = json['size'].cast<String>();
    iV = json['__v'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['likes'] = this.likes;
    data['title'] = this.title;
    data['discription'] = this.discription;
    data['price'] = this.price;
    data['rating'] = this.rating;
    data['discountPercentage'] = this.discountPercentage;
    data['productImages'] = this.productImages;
    data['thumbnail'] = this.thumbnail;
    data['category'] = this.category;
    data['brand'] = this.brand;
    data['stock'] = this.stock;
    data['color'] = this.color;
    data['size'] = this.size;
    data['__v'] = this.iV;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
