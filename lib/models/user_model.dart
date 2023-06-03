class UserModel {
  String? sId;
  String? userId;
  String? fullName;
  String? email;
  String? number;
  String? password;
  String? images;
  String? birthdate;
  String? address;
  String? token;
  int? progress;

  UserModel(
      {this.sId,
      this.userId,
      this.fullName,
      this.email,
      this.number,
      this.password,
      this.images,
      this.birthdate,
      this.address,
      this.token,
      this.progress});

  UserModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userId = json['userId'];
    fullName = json['fullName'];
    email = json['email'];
    number = json['number'];
    password = json['password'];
    images = json['images'];
    birthdate = json['birthdate'];
    address = json['address'];
    token = json['token'];
    progress = json['progress'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['userId'] = this.userId;
    data['fullName'] = this.fullName;
    data['email'] = this.email;
    data['number'] = this.number;
    data['password'] = this.password;
    data['images'] = this.images;
    data['birthdate'] = this.birthdate;
    data['address'] = this.address;
    data['token'] = this.token;
    data['progress'] = this.progress;
    return data;
  }
}
