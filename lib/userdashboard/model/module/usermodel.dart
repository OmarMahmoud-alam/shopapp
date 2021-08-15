class Homedata {
  late bool status;

  List<BannerModel> banner = [];
  List<ProductModel> products = [];

  Homedata.fromjson(Map<String, dynamic> json) {
    this.status = json['status'];
    print(json['data']['banners'].length);
    if (json['data']['banners'] != null) {
      json['data']['banners'].forEach((e) {
        banner.add(BannerModel.fromJson(e));
      });
    }

    if (json['data']['products'] != null) {
      json['data']['products'].forEach((e) {
        products.add(ProductModel.fromjson(e));
      });
    }
  }

  void fromjson(data) {}
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
  dynamic price;
  dynamic oldprice;
  dynamic discount;
  String? image;
  String? name;
  late bool infav;
  late bool incat;

  ProductModel.fromjson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.price = json['price'];
    this.oldprice = json['old_price'];
    this.discount = json['discount'];
    this.image = json['image'];
    this.name = json['name'];
    infav = json["in_favorites"] ?? false;
    incat = json["in_cart"] ?? false;
  }
}
