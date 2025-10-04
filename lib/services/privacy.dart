import 'dart:convert';
import 'package:http/http.dart' as http;
import '../midel/privacylist.dart'; // ✅ adjust path to your model

class PrivacyService {
  static const String baseUrl = "https://karyana-apis-backend.vercel.app/"; // 🔹 change this to your API base

  /// Fetch Privacy Policy List
  static Future<Privacylist?> getPrivacyPolicies() async {
    try {
      final response = await http.get(Uri.parse("$baseUrl/api/privacy-policies")); // 🔹 endpoint adjust karo

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return Privacylist.fromJson(data);
      } else {
        print("❌ Error: ${response.statusCode} - ${response.body}");
        return null;
      }
    } catch (e) {
      print("⚠️ Exception in getPrivacyPolicies: $e");
      return null;
    }
  }
}
