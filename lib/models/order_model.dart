class OrderModel {
  bool? success;
  String? message;
  Order? order;

  OrderModel({this.success, this.message, this.order});

  OrderModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    order = json['Order'] != null ? new Order.fromJson(json['Order']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.order != null) {
      data['Order'] = this.order!.toJson();
    }
    return data;
  }
}

class Order {
  User? user;
  String? status;
  List<Items>? items;
  String? sId;
  int? iV;

  Order({this.user, this.status, this.items, this.sId, this.iV});

  Order.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    status = json['status'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
    sId = json['_id'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['status'] = this.status;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    data['_id'] = this.sId;
    data['__v'] = this.iV;
    return data;
  }
}

class User {
  String? sId;
  String? userId;
  String? fullName;
  String? email;
  int? iV;
  String? address;
  String? images;
  String? number;

  User(
      {this.sId,
      this.userId,
      this.fullName,
      this.email,
      this.iV,
      this.address,
      this.images,
      this.number});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userId = json['userId'];
    fullName = json['fullName'];
    email = json['email'];
    iV = json['__v'];
    address = json['address'];
    images = json['images'];
    number = json['number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['userId'] = this.userId;
    data['fullName'] = this.fullName;
    data['email'] = this.email;
    data['__v'] = this.iV;
    data['address'] = this.address;
    data['images'] = this.images;
    data['number'] = this.number;
    return data;
  }
}

class Items {
  Product? product;
  int? quantity;
  String? color;
  String? size;
  String? sId;

  Items({this.product, this.quantity, this.color, this.size, this.sId});

  Items.fromJson(Map<String, dynamic> json) {
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
  String? title;
  String? discription;
  int? price;
  dynamic? rating;
  int? discountPercentage;
  List<String>? productImages;
  String? thumbnail;
  dynamic? category;
  dynamic? brand;
  int? stock;
  List<String>? color;
  List<String>? size;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Product(
      {this.sId,
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
      this.createdAt,
      this.updatedAt,
      this.iV});

  Product.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
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
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
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
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}