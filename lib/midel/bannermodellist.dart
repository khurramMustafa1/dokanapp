// To parse this JSON data, do
//
//     final bannerlistModel = bannerlistModelFromJson(jsonString);

import 'dart:convert';

BannerlistModel bannerlistModelFromJson(String str) => BannerlistModel.fromJson(json.decode(str));

String bannerlistModelToJson(BannerlistModel data) => json.encode(data.toJson());

class BannerlistModel {
  final bool? success;
  final int? count;
  final List<Banner>? banners;

  BannerlistModel({
    this.success,
    this.count,
    this.banners,
  });

  factory BannerlistModel.fromJson(Map<String, dynamic> json) => BannerlistModel(
    success: json["success"],
    count: json["count"],
    banners: json["banners"] == null ? [] : List<Banner>.from(json["banners"]!.map((x) => Banner.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "count": count,
    "banners": banners == null ? [] : List<dynamic>.from(banners!.map((x) => x.toJson())),
  };
}

class Banner {
  final String? id;
  final String? image;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  final String? user;

  Banner({
    this.id,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.user,
  });

  factory Banner.fromJson(Map<String, dynamic> json) => Banner(
    id: json["_id"],
    image: json["image"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    user: json["user"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "image": image,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
    "user": user,
  };
}
