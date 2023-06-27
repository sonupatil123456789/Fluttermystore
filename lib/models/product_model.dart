
class ProductModel {
  bool? success;
  String? message;
  List<Products>? products;

  ProductModel({this.success, this.message, this.products});

  ProductModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  String? sId;
  dynamic? likes;
  String? title;
  String? discription;
  int? price;
  num? rating;
  int? discountPercentage;
  List<String>? productImages;
  dynamic? thumbnail;
  dynamic? category;
  dynamic? brand;
  int? stock;
  List<dynamic>? color;
  List<dynamic>? size;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Products(
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
      this.createdAt,
      this.updatedAt,
      this.iV});

  Products.fromJson(Map<String, dynamic> json) {
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
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
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
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}