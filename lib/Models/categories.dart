import 'dart:convert';

Categories categoriesFromJson(String str) =>
    Categories.fromJson(json.decode(str));

String categoriesToJson(Categories data) => json.encode(data.toJson());

class Categories {
  Categories({
    this.status,
    this.message,
    this.data,
  });

  bool status;
  String message;
  List<Category> data;

  factory Categories.fromJson(Map<String, dynamic> json) => Categories(
        status: json["status"],
        message: json["message"],
        data:
            List<Category>.from(json["data"].map((x) => Category.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Category {
  Category({
    this.id,
    this.cid,
    this.categoryName,
    this.categoryImage,
    this.featured,
    this.createdOn,
    this.modifiedOn,
  });

  String id;
  String cid;
  String categoryName;
  String categoryImage;
  String featured;
  DateTime createdOn;
  DateTime modifiedOn;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        cid: json["cid"],
        categoryName: json["category_name"],
        categoryImage: json["category_image"],
        featured: json["featured"],
        createdOn: json["created_on"] != null
            ? DateTime.parse(json["created_on"])
            : DateTime(2021),
        modifiedOn: json["modified_on"] != null
            ? DateTime.parse(json["modified_on"])
            : DateTime(2021),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "cid": cid,
        "category_name": categoryName,
        "category_image": categoryImage,
        "featured": featured,
        "created_on": createdOn.toIso8601String(),
        "modified_on": modifiedOn == null ? null : modifiedOn.toIso8601String(),
      };
}
