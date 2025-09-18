// To parse this JSON data, do
//
//     final productlistmodel = productlistmodelFromJson(jsonString);

import 'dart:convert';

Productlistmodel productlistmodelFromJson(String str) => Productlistmodel.fromJson(json.decode(str));

String productlistmodelToJson(Productlistmodel data) => json.encode(data.toJson());

class Productlistmodel {
  final bool? success;
  final int? count;
  final List<Product>? products;

  Productlistmodel({
    this.success,
    this.count,
    this.products,
  });

  factory Productlistmodel.fromJson(Map<String, dynamic> json) => Productlistmodel(
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
  final Brand? category;
  final Brand? brand;
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
    category: json["category"] == null ? null : Brand.fromJson(json["category"]),
    brand: json["brand"] == null ? null : Brand.fromJson(json["brand"]),
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
    "brand": brand?.toJson(),
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}

class Brand {
  final String? id;
  final String? name;

  Brand({
    this.id,
    this.name,
  });

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
    id: json["_id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
  };
}
