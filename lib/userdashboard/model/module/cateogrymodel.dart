class Cateogrey {
  late bool state;
  List<Cateoritem> items = [];
  Cateogrey.fromjson(Map<String, dynamic> json) {
    state = json['status'];
    json['data']['data'].forEach((e) {
      items.add(Cateoritem.fromjson(e));
    });
  }
}

class Cateoritem {
  int? id;
  String? image;
  String? name;
  Cateoritem.fromjson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    image = json["image"];
  }
}
