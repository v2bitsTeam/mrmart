import 'dart:convert';

MyOrders myOrdersFromJson(String str) => MyOrders.fromJson(json.decode(str));

String myOrdersToJson(MyOrders data) => json.encode(data.toJson());

class MyOrders {
  MyOrders({
    this.status,
    this.message,
    this.data,
  });

  bool status;
  String message;
  List<MyOrdersData> data;

  factory MyOrders.fromJson(Map<String, dynamic> json) => MyOrders(
        status: json["status"],
        message: json["message"],
        data: List<MyOrdersData>.from(
            json["data"].map((x) => MyOrdersData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class MyOrdersData {
  MyOrdersData({
    this.id,
    this.oid,
    this.uid,
    this.deliveryBoyId,
    this.amount,
    this.delivery,
    this.status,
    this.paymentType,
    this.paymentStatus,
    this.addess,
    this.instructions,
    this.createdOn,
    this.modifiedOn,
  });

  String id;
  String oid;
  String uid;
  String deliveryBoyId;
  String amount;
  dynamic delivery;
  String status;
  String paymentType;
  String paymentStatus;
  String addess;
  String instructions;
  DateTime createdOn;
  DateTime modifiedOn;

  factory MyOrdersData.fromJson(Map<String, dynamic> json) => MyOrdersData(
        id: json["id"],
        oid: json["oid"],
        uid: json["uid"],
        deliveryBoyId: json["deliveryBoy_id"],
        amount: json["amount"],
        delivery: json["delivery"],
        status: json["status"],
        paymentType: json["payment_type"],
        paymentStatus: json["payment_status"],
        addess: json["addess"],
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
        "addess": addess,
        "instructions": instructions,
        "created_On": createdOn.toIso8601String(),
        "modified_On": modifiedOn.toIso8601String(),
      };
}
