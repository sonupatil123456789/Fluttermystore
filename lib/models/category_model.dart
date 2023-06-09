class CategoryModel {
  bool? success;
  String? message;
  List<Categorys>? categorys;

  CategoryModel({this.success, this.message, this.categorys});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['categorys'] != null) {
      categorys = <Categorys>[];
      json['categorys'].forEach((v) {
        categorys!.add(new Categorys.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.categorys != null) {
      data['categorys'] = this.categorys!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Categorys {
  String? sId;
  String? title;
  String? discription;
  String? createdAt;
  String? updatedOn;
  int? iV;

  Categorys(
      {this.sId,
      this.title,
      this.discription,
      this.createdAt,
      this.updatedOn,
      this.iV});

  Categorys.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    discription = json['discription'];
    createdAt = json['createdAt'];
    updatedOn = json['updatedOn'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['discription'] = this.discription;
    data['createdAt'] = this.createdAt;
    data['updatedOn'] = this.updatedOn;
    data['__v'] = this.iV;
    return data;
  }
}