class Categorymodellist {
  final bool success;
  final String message;
  final List<Category> categories;

  Categorymodellist({
    required this.success,
    required this.message,
    required this.categories,
  });

  factory Categorymodellist.fromJson(Map<String, dynamic> json) {
    return Categorymodellist(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      categories: (json['categories'] as List<dynamic>)
          .map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class Category {
  final String id;
  final String name;
  final String image;

  Category({
    required this.id,
    required this.name,
    required this.image,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      image: json['image'] ?? '',
    );
  }
}
