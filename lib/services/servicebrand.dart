// lib/services/servicebrand.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../midel/brand.dart' show Brandlist, brandlistFromJson;

class BrandService {
  static const String baseUrl = "https://karyana-apis-backend.vercel.app";

  static Future<String?> _getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("token");
  }

  static Future<Brandlist?> getBrands() async {
    try {
      final token = await _getToken();

      final response = await http.get(
        Uri.parse("$baseUrl/api/brands/all"), // ✅ FIXED ENDPOINT
        headers: {
          "Content-Type": "application/json",
          if (token != null) "Authorization": "Bearer $token",
        },
      );

      print("🔹 API Response Code: ${response.statusCode}");
      print("🔹 API Response Body: ${response.body}");

      if (response.statusCode == 200) {
        return brandlistFromJson(response.body);
      } else {
        print("❌ Error fetching brands: ${response.body}");
        return null;
      }
    } catch (e) {
      print("⚠️ Exception: $e");
      return null;
    }
  }
}
