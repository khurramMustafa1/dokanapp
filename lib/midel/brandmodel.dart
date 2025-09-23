// To parse this JSON data, do
//
//     final brand = brandFromJson(jsonString);

import 'dart:convert';

Brand brandFromJson(String str) => Brand.fromJson(json.decode(str));

String brandToJson(Brand data) => json.encode(data.toJson());

class Brand {
  final bool? success;
  final int? count;
  final Brands? brands;

  Brand({
    this.success,
    this.count,
    this.brands,
  });

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
    success: json["success"],
    count: json["count"],
    brands: json["brands"] == null ? null : Brands.fromJson(json["brands"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "count": count,
    "brands": brands?.toJson(),
  };
}

class Brands {
  final String? id;
  final String? name;
  final String? image;
  final dynamic category;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  Brands({
    this.id,
    this.name,
    this.image,
    this.category,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Brands.fromJson(Map<String, dynamic> json) => Brands(
    id: json["_id"],
    name: json["name"],
    image: json["image"],
    category: json["category"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "image": image,
    "category": category,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}
