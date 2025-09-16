import 'dart:convert';
import 'package:http/http.dart' as http;
import '../midel/bannermodellist.dart' show bannerlistModelFromJson, BannerlistModel; // 👈 adjust path to where your model is

class BannerListService {
  String baseUrl = "https://karyana-apis-backend.vercel.app"; // ✅ change if needed
  Future<BannerlistModel?> getBanners(String token) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/api/banners'));

      if (response.statusCode == 200 || response.statusCode == 201) {
        return BannerlistModel.fromJson(jsonDecode(response.body));
      } else {
        throw response.reasonPhrase.toString();
      }
    } catch (e) {
      rethrow;
    }
  }
}
