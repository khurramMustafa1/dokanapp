import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../midel/searchlist.dart'; // ✅ adjust path according to your project

class SearchService {
  static const String baseUrl = "https://karyana-apis-backend.vercel.app";

  /// 🔍 Search Products
  static Future<Searchlist?> searchProducts(String query) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("token");

      final response = await http.get(
        Uri.parse("$baseUrl/api/products/search?name=$query"),
        headers: {
          "Content-Type": "application/json",
          if (token != null) "Authorization": "Bearer $token",
        },
      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        return Searchlist.fromJson(jsonData);
      } else {
        print("❌ Search API failed: ${response.body}");
        return null;
      }
    } catch (e) {
      print("❌ Error in searchProducts: $e");
      return null;
    }
  }
}
