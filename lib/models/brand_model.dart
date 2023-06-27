class BrandModel {
  bool? success;
  String? message;
  List<Brands>? brands;

  BrandModel({this.success, this.message, this.brands});

  BrandModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['brands'] != null) {
      brands = <Brands>[];
      json['brands'].forEach((v) {
        brands!.add(new Brands.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.brands != null) {
      data['brands'] = this.brands!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Brands {
  String? sId;
  String? title;
  String? discription;
  String? brandImage;
  String? createdAt;
  String? updatedOn;
  int? iV;

  Brands(
      {this.sId,
      this.title,
      this.discription,
      this.brandImage,
      this.createdAt,
      this.updatedOn,
      this.iV});

  Brands.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    discription = json['discription'];
    brandImage = json['brandImage'];
    createdAt = json['createdAt'];
    updatedOn = json['updatedOn'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['discription'] = this.discription;
    data['brandImage'] = this.brandImage;
    data['createdAt'] = this.createdAt;
    data['updatedOn'] = this.updatedOn;
    data['__v'] = this.iV;
    return data;
  }
}