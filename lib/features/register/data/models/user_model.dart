class UserModel {
  String? name;
  String? email;
  String? phone;
  String? image;
  String? uId;
  UserModel({this.name, this.email, this.phone, this.uId, this.image});
  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    uId = json['uid'];
  }
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'image': image,
      'uid': uId
    };
  }
}
