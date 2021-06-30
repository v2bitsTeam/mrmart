import 'dart:convert';

MyOrderItems myOrderItemsFromJson(String str) =>
    MyOrderItems.fromJson(json.decode(str));

String myOrderItemsToJson(MyOrderItems data) => json.encode(data.toJson());

class MyOrderItems {
  MyOrderItems({
    this.status,
    this.message,
    this.orderItems,
    this.order,
  });

  bool status;
  String message;
  List<OrderItems> orderItems;
  List<Order> order;

  factory MyOrderItems.fromJson(Map<String, dynamic> json) => MyOrderItems(
        status: json["status"],
        message: json["message"],
        orderItems: List<OrderItems>.from(
            json["data"].map((x) => OrderItems.fromJson(x))),
        order: json["order"] != null && json["order"].length != 0
            ? List<Order>.from(json["order"].map((x) => Order.fromJson(x)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(orderItems.map((x) => x.toJson())),
        "order": List<dynamic>.from(order.map((x) => x.toJson())),
      };
}

class OrderItems {
  OrderItems({
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
    this.datumCreatedOn,
    this.datumModifiedOn,
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
  DateTime datumCreatedOn;
  DateTime datumModifiedOn;

  factory OrderItems.fromJson(Map<String, dynamic> json) => OrderItems(
        id: json["id"],
        uid: json["uid"],
        pid: json["pid"],
        cartId: json["cart_id"],
        oid: json["oid"],
        items: json["items"],
        cartStatus: json["cart_status"],
        createdOn: DateTime.parse(json["createdOn"]),
        modifiedOn: DateTime.parse(json["modifiedOn"]),
        cid: json["cid"],
        name: json["name"],
        description: json["description"],
        featured: json["featured"],
        discount: json["discount"],
        instock: json["instock"],
        image: json["image"],
        price: json["price"],
        datumCreatedOn: json["created_On"] != null
            ? DateTime.parse(json["created_On"])
            : DateTime(2021),
        datumModifiedOn: json["modified_On"] != null
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
        "created_On": datumCreatedOn.toIso8601String(),
        "modified_On": datumModifiedOn.toIso8601String(),
      };
}

class Order {
  Order({
    this.id,
    this.oid,
    this.uid,
    this.deliveryBoyId,
    this.amount,
    this.delivery,
    this.status,
    this.paymentType,
    this.paymentStatus,
    this.location,
    this.city,
    this.state,
    this.pincode,
    this.instructions,
    this.createdOn,
    this.modifiedOn,
  });

  String id;
  String oid;
  String uid;
  String deliveryBoyId;
  String amount;
  String delivery;
  String status;
  String paymentType;
  String paymentStatus;
  String location;
  String city;
  String state;
  String pincode;
  String instructions;
  DateTime createdOn;
  DateTime modifiedOn;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["id"],
        oid: json["oid"],
        uid: json["uid"],
        deliveryBoyId: json["deliveryBoy_id"],
        amount: json["amount"],
        delivery: json["delivery"],
        status: json["status"],
        paymentType: json["payment_type"],
        paymentStatus: json["payment_status"],
        location: json["location"],
        city: json["city"],
        state: json["state"],
        pincode: json["pincode"],
        instructions: json["instructions"],
        createdOn: json["created_On"] != null
            ? DateTime.parse(json["created_On"])
            : DateTime(2021),
        modifiedOn: json["modified_On"] != null
            ? DateTime.parse(json["modified_On"])
            : DateTime(2021),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "oid": oid,
        "uid": uid,
        "deliveryBoy_id": deliveryBoyId,
        "amount": amount,
        "delivery": delivery,
        "status": status,
        "payment_type": paymentType,
        "payment_status": paymentStatus,
        "location": location,
        "city": city,
        "state": state,
        "pincode": pincode,
        "instructions": instructions,
        "created_On": createdOn.toIso8601String(),
        "modified_On": modifiedOn.toIso8601String(),
      };
}
