class ShopLogin {
  late final bool status;
  late final String message;
  Userdata? data;
  ShopLogin.fromjson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] == null ? null : Userdata.fromjson(json['data']);
  }
}

class Userdata {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? image;
  int? points;
  int? credit;
  String? token;
  Userdata({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.points,
    this.credit,
    this.token,
  });
  Userdata.fromjson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    points = json['points'];
    credit = json['credit'];
    token = json['token'];
  }
}
