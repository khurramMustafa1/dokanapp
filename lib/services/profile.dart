import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../midel/profile.dart';

class ProfileService {
  static const String baseUrl = "https://karyana-apis-backend.vercel.app";

  /// Fetch User Profile
  static Future<User?> getProfile() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("token");

      if (token == null) {
        print("⚠️ No token found (guest user)");
        return null;
      }

      final response = await http.get(
        Uri.parse("$baseUrl/api/users/profile"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = json.decode(response.body);
        print("🔥 Profile API Response: $jsonData");

        if (jsonData["success"] == true && jsonData["user"] != null) {
          return User.fromJson(jsonData["user"]);
        } else {
          print("⚠️ API returned success=false or no user object");
          return null;
        }
      } else {
        print("❌ Failed to fetch profile: ${response.body}");
        return null;
      }
    } catch (e) {
      print("❌ Error fetching profile: $e");
      return null;
    }
  }

  /// Update User Profile
  static Future<bool> updateProfile({
    required String name,
    required String shopName,
    required String shopAddress,
  }) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("token");

      if (token == null) {
        print("⚠️ No token found (guest user)");
        return false;
      }

      final response = await http.put(
        Uri.parse("$baseUrl/api/users/profile"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
        body: json.encode({
          "name": name,
          "shopName": shopName,
          "shopAddress": shopAddress,
        }),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = json.decode(response.body);
        return jsonData["success"] == true;
      } else {
        print("❌ Failed to update profile: ${response.body}");
        return false;
      }
    } catch (e) {
      print("❌ Error updating profile: $e");
      return false;
    }
  }
}
