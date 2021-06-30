import 'dart:convert';

Pincodes pincodesFromJson(String str) => Pincodes.fromJson(json.decode(str));

String pincodesToJson(Pincodes data) => json.encode(data.toJson());

class Pincodes {
  Pincodes({
    this.status,
    this.message,
    this.data,
  });

  bool status;
  String message;
  List<PincodeData> data;

  factory Pincodes.fromJson(Map<String, dynamic> json) => Pincodes(
        status: json["status"],
        message: json["message"],
        data: List<PincodeData>.from(
            json["data"].map((x) => PincodeData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class PincodeData {
  PincodeData({
    this.id,
    this.pincode,
    this.address,
    this.status,
    this.createdOn,
  });

  String id;
  String pincode;
  String address;
  String status;
  DateTime createdOn;

  factory PincodeData.fromJson(Map<String, dynamic> json) => PincodeData(
      id: json["id"],
      pincode: json["pincode"],
      address: json["address"],
      status: json["status"],
      createdOn: json["created_On"] != null
          ? DateTime.parse(json["created_On"])
          : DateTime(2021));

  Map<String, dynamic> toJson() => {
        "id": id,
        "pincode": pincode,
        "address": address,
        "status": status,
        "createdOn": createdOn.toIso8601String(),
      };
}
