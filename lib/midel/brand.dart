import 'dart:convert';

Brandlist brandlistFromJson(String str) => Brandlist.fromJson(json.decode(str));

String brandlistToJson(Brandlist data) => json.encode(data.toJson());

class Brandlist {
  final bool? success;
  final int? count;
  final List<Brand>? brands;

  Brandlist({
    this.success,
    this.count,
    this.brands,
  });

  factory Brandlist.fromJson(Map<String, dynamic> json) => Brandlist(
    success: json["success"],
    count: json["count"],
    brands: json["brands"] == null
        ? []
        : List<Brand>.from(json["brands"]!.map((x) => Brand.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "count": count,
    "brands": brands == null
        ? []
        : List<dynamic>.from(brands!.map((x) => x.toJson())),
  };
}

class Brand {
  final String? id;
  final String? name;
  final String? image;
  final Category? category;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  Brand({
    this.id,
    this.name,
    this.image,
    this.category,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
    id: json["_id"],
    name: json["name"],
    image: json["image"],
    category: json["category"] == null
        ? null
        : Category.fromJson(json["category"]),
    createdAt: json["createdAt"] == null
        ? null
        : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null
        ? null
        : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "image": image,
    "category": category?.toJson(),
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}

class Category {
  final String? id;
  final String? name;

  Category({
    this.id,
    this.name,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["_id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
  };
}
