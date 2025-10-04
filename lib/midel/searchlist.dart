// To parse this JSON data, do
//
//     final searchlist = searchlistFromJson(jsonString);

import 'dart:convert';

Searchlist searchlistFromJson(String str) => Searchlist.fromJson(json.decode(str));

String searchlistToJson(Searchlist data) => json.encode(data.toJson());

class Searchlist {
  final bool? success;
  final int? count;
  final List<Product>? products;

  Searchlist({
    this.success,
    this.count,
    this.products,
  });

  factory Searchlist.fromJson(Map<String, dynamic> json) => Searchlist(
    success: json["success"],
    count: json["count"],
    products: json["products"] == null ? [] : List<Product>.from(json["products"]!.map((x) => Product.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "count": count,
    "products": products == null ? [] : List<dynamic>.from(products!.map((x) => x.toJson())),
  };
}

class Product {
  final String? id;
  final String? name;
  final String? description;
  final int? price;
  final String? image;
  final Category? category;
  final dynamic brand;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  Product({
    this.id,
    this.name,
    this.description,
    this.price,
    this.image,
    this.category,
    this.brand,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["_id"],
    name: json["name"],
    description: json["description"],
    price: json["price"],
    image: json["image"],
    category: json["category"] == null ? null : Category.fromJson(json["category"]),
    brand: json["brand"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "description": description,
    "price": price,
    "image": image,
    "category": category?.toJson(),
    "brand": brand,
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
