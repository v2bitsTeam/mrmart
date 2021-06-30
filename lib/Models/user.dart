import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.status,
    this.message,
    this.data,
  });

  bool status;
  String message;
  List<UserDetails> data;

  factory User.fromJson(Map<String, dynamic> json) => User(
        status: json["status"],
        message: json["message"],
        data: List<UserDetails>.from(
            json["data"].map((x) => UserDetails.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class UserDetails {
  UserDetails({
    this.id,
    this.uid,
    this.name,
    this.mobile,
    this.password,
    this.registeredShopId,
    this.gstNumber,
    this.location,
    this.city,
    this.state,
    this.pincode,
    this.role,
    this.profileImage,
    this.createdOn,
    this.modifiedOn,
  });

  String id;
  String uid;
  String name;
  String mobile;
  String password;
  String registeredShopId;
  String gstNumber;
  String location;
  String city;
  String state;
  String pincode;
  String role;
  String profileImage;
  DateTime createdOn;
  DateTime modifiedOn;

  factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
        id: json["id"],
        uid: json["uid"],
        name: json["name"],
        mobile: json["mobile"],
        password: json["password"],
        registeredShopId: json["registered_shop_id"],
        gstNumber: json["gst_number"],
        location: json["location"],
        city: json["city"],
        state: json["state"],
        pincode: json["pincode"],
        role: json["role"],
        profileImage: json["profile_image"],
        createdOn: json["created_on"] != null
            ? DateTime.parse(json["created_on"])
            : DateTime(2021),
        modifiedOn: json["modified_on"] != null
            ? DateTime.parse(json["modified_on"])
            : DateTime(2021),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "uid": uid,
        "name": name,
        "mobile": mobile,
        "password": password,
        "registered_shop_id": registeredShopId,
        "gst_number": gstNumber,
        "location": location,
        "city": city,
        "state": state,
        "pincode": pincode,
        "role": role,
        "profile_image": profileImage,
        "created_on": createdOn.toIso8601String(),
        "modified_on": modifiedOn.toIso8601String(),
      };
}
