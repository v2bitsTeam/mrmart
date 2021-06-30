import 'dart:convert';

Cart cartFromJson(String str) => Cart.fromJson(json.decode(str));

String cartToJson(Cart data) => json.encode(data.toJson());

class Cart {
  Cart({
    this.status,
    this.message,
    this.data,
  });

  bool status;
  String message;
  List<CartItem> data;

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        status: json["status"],
        message: json["message"],
        data:
            List<CartItem>.from(json["data"].map((x) => CartItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class CartItem {
  CartItem({
    this.id,
    this.uid,
    this.pid,
    this.cartId,
    this.oid,
    this.items,
    this.cartStatus,
    this.createdOn,
    this.modifiedOn,
    this.cid,
    this.name,
    this.description,
    this.featured,
    this.discount,
    this.instock,
    this.image,
    this.price,
    this.productCreatedOn,
    this.productModifiedOn,
  });

  String id;
  String uid;
  String pid;
  String cartId;
  String oid;
  String items;
  String cartStatus;
  DateTime createdOn;
  DateTime modifiedOn;
  String cid;
  String name;
  String description;
  String featured;
  String discount;
  String instock;
  String image;
  String price;
  DateTime productCreatedOn;
  DateTime productModifiedOn;

  factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
        id: json["id"],
        uid: json["uid"],
        pid: json["pid"],
        cartId: json["cart_id"],
        oid: json["oid"],
        items: json["items"],
        cartStatus: json["cart_status"],
        createdOn: json["createdOn"] != null
            ? DateTime.parse(json["createdOn"])
            : DateTime(2021),
        modifiedOn: json["modifiedOn"] != null
            ? DateTime.parse(json["modifiedOn"])
            : DateTime(2021),
        cid: json["cid"],
        name: json["name"],
        description: json["description"],
        featured: json["featured"],
        discount: json["discount"],
        instock: json["instock"],
        image: json["image"],
        price: json["price"],
        productCreatedOn: json["created_On"] != null
            ? DateTime.parse(json["created_On"])
            : DateTime(2021),
        productModifiedOn: json["modified_On"] != null
            ? DateTime.parse(json["modified_On"])
            : DateTime(2021),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "uid": uid,
        "pid": pid,
        "cart_id": cartId,
        "oid": oid,
        "items": items,
        "cart_status": cartStatus,
        "createdOn": createdOn.toIso8601String(),
        "modifiedOn": modifiedOn.toIso8601String(),
        "cid": cid,
        "name": name,
        "description": description,
        "featured": featured,
        "discount": discount,
        "instock": instock,
        "image": image,
        "price": price,
        "created_On": productCreatedOn.toIso8601String(),
        "modified_On": productModifiedOn.toIso8601String(),
      };
}
