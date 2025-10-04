// To parse this JSON data, do
//
//     final privacy = privacyFromJson(jsonString);

import 'dart:convert';

Privacy privacyFromJson(String str) => Privacy.fromJson(json.decode(str));

String privacyToJson(Privacy data) => json.encode(data.toJson());

class Privacy {
  final bool? success;
  final Policies? policies;

  Privacy({
    this.success,
    this.policies,
  });

  factory Privacy.fromJson(Map<String, dynamic> json) => Privacy(
    success: json["success"],
    policies: json["policies"] == null ? null : Policies.fromJson(json["policies"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "policies": policies?.toJson(),
  };
}

class Policies {
  final String? id;
  final String? title;
  final String? description;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  Policies({
    this.id,
    this.title,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Policies.fromJson(Map<String, dynamic> json) => Policies(
    id: json["_id"],
    title: json["title"],
    description: json["description"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "title": title,
    "description": description,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}
