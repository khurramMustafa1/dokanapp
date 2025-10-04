// To parse this JSON data, do
//
//     final search = searchFromJson(jsonString);

import 'dart:convert';

Search searchFromJson(String str) => Search.fromJson(json.decode(str));

String searchToJson(Search data) => json.encode(data.toJson());

class Search {
  final bool? success;
  final int? count;
  final Products? products;

  Search({
    this.success,
    this.count,
    this.products,
  });

  factory Search.fromJson(Map<String, dynamic> json) => Search(
    success: json["success"],
    count: json["count"],
    products: json["products"] == null ? null : Products.fromJson(json["products"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "count": count,
    "products": products?.toJson(),
  };
}

class Products {
  final String? id;
  final String? name;
  final String? description;
  final int? price;
  final String? image;
  final Category? category;

  Products({
    this.id,
    this.name,
    this.description,
    this.price,
    this.image,
    this.category,
  });

  factory Products.fromJson(Map<String, dynamic> json) => Products(
    id: json["_id"],
    name: json["name"],
    description: json["description"],
    price: json["price"],
    image: json["image"],
    category: json["category"] == null ? null : Category.fromJson(json["category"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "description": description,
    "price": price,
    "image": image,
    "category": category?.toJson(),
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
