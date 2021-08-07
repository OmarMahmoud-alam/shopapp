class Homedata {
  late bool status;
  String? message;
  List<BannerModel> banner = [];
  List<ProductModel> products = [];

  Homedata.fromjson(Map<String, dynamic> json) {
    this.status = json['status'];
    this.message = json['message'];
    json['banners'].foreach((e) {
      banner.add(BannerModel.fromJson(e));
    });
    json['products'].foreach((e) {
      products.add(ProductModel.fromjson(e));
    });
  }
}

class BannerModel {
  int? id;
  String? image;

  BannerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
  }
}

class ProductModel {
  int? id;
  int? price;
  int? oldprice;
  int? discount;
  String? image;
  ProductModel.fromjson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.price = json['price'];
    this.oldprice = json['old_price'];
    this.discount = json['discount'];
    this.image = json['image'];
  }
}
