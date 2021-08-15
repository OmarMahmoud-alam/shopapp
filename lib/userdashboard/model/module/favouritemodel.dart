class ChangedFavoriproduct {
  late bool status;
  String? message;
  ProductModel2? prodict;
  ChangedFavoriproduct.fromjson(Map<String, dynamic> json) {
    this.status = json['status'];
    this.message = json['message'];
    prodict = ProductModel2.fromjson(json['data']['product']);
  }
}

class Favouritedata {
  late bool status;
  List<ProductModel2> products = [];

  Favouritedata.fromjson(Map<String, dynamic> json) {
    this.status = json['status'];

    if (json['data']['data'] != null) {
      json['data']['data'].forEach((e) {
        products.add(ProductModel2.fromjson(e['product']));
      });
    }
  }
}

class ProductModel2 {
  dynamic id;
  dynamic price;
  dynamic oldprice;
  dynamic discount;
  String? image;
  String? name;

  ProductModel2.fromjson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.price = json['price'];
    this.oldprice = json['old_price'];
    this.discount = json['discount'];
    this.image = json['image'];
    this.name = json['name'];
  }
}
