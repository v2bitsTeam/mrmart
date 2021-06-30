import 'dart:convert';

Products productsFromJson(String str) => Products.fromJson(json.decode(str));

String productsToJson(Products data) => json.encode(data.toJson());

class Products {
  Products({
    this.status,
    this.message,
    this.data,
  });

  bool status;
  String message;
  List<Product> data;

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        status: json["status"],
        message: json["message"],
        data: List<Product>.from(json["data"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Product {
  Product({
    this.id,
    this.pid,
    this.cid,
    this.name,
    this.description,
    this.featured,
    this.discount,
    this.instock,
    this.image,
    this.price,
    this.createdOn,
    this.modifiedOn,
  });

  String id;
  String pid;
  String cid;
  String name;
  String description;
  String featured;
  String discount;
  String instock;
  String image;
  String price;
  DateTime createdOn;
  DateTime modifiedOn;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        pid: json["pid"],
        cid: json["cid"],
        name: json["name"],
        description: json["description"],
        featured: json["featured"],
        discount: json["discount"],
        instock: json["instock"],
        image: json["image"],
        price: json["price"],
        createdOn: json["created_On"] != null
            ? DateTime.parse(json["created_On"])
            : DateTime(2021),
        modifiedOn: json["modified_On"] != null
            ? DateTime.parse(json["modified_On"])
            : DateTime(2021),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "pid": pid,
        "cid": cid,
        "name": name,
        "description": description,
        "featured": featured,
        "discount": discount,
        "instock": instock,
        "image": image,
        "price": price,
        "created_On": createdOn.toIso8601String(),
        "modified_On": modifiedOn == null ? null : modifiedOn.toIso8601String(),
      };
}
