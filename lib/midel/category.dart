// To parse this JSON data, do
//
//     final categorymodel = categorymodelFromJson(jsonString);

import 'dart:convert';

Categorymodel categorymodelFromJson(String str) => Categorymodel.fromJson(json.decode(str));

String categorymodelToJson(Categorymodel data) => json.encode(data.toJson());

class Categorymodel {
  final bool? success;
  final int? count;
  final Categories? categories;

  Categorymodel({
    this.success,
    this.count,
    this.categories,
  });

  factory Categorymodel.fromJson(Map<String, dynamic> json) => Categorymodel(
    success: json["success"],
    count: json["count"],
    categories: json["categories"] == null ? null : Categories.fromJson(json["categories"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "count": count,
    "categories": categories?.toJson(),
  };
}

class Categories {
  final String? id;
  final String? name;
  final String? image;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  Categories({
    this.id,
    this.name,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Categories.fromJson(Map<String, dynamic> json) => Categories(
    id: json["_id"],
    name: json["name"],
    image: json["image"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "image": image,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}
