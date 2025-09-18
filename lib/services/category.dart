import 'dart:convert';
import 'package:http/http.dart' as http;
import '../midel/categorylisrmodel.dart';

class CategoryService {
  final String baseUrl = "https://karyana-apis-backend.vercel.app";

  Future<Categorymodellist?> fetchCategories() async {
    try {
      final response = await http.get(Uri.parse("$baseUrl/api/categories/all"));

      print("🔹 Fetch Categories Response: ${response.statusCode}");
      print("🔹 Body: ${response.body}");

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        return Categorymodellist.fromJson(data);
      } else {
        throw Exception("Failed to load categories: ${response.statusCode}");
      }
    } catch (e) {
      print("❌ Error fetching categories: $e");
      return null;
    }
  }
}
