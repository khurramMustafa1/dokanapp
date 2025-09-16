import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../midel/usermodel.dart' show User, UserModel, userModelFromJson;
class UserService {
  static const String baseUrl = "https://karyana-apis-backend.vercel.app"; // 🔹 change this
  static Future<UserModel?> register({
    required String name,
    required String email,
    required String password,
    required String phoneNumber,
    required String shopName,
    required String shopAddress,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/api/users/register'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "name": name,
          "email": email,
          "password": password,
          "phoneNumber": phoneNumber,
          "shopName": shopName,
          "shopAddress": shopAddress,
        }),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final userModel = userModelFromJson(response.body);
        if (userModel.token != null) {
          await _saveUser(userModel);
        }
        return userModel;
      } else {
        print("Register failed: ${response.body}");
        return null;
      }
    } catch (e) {
      print("Register error: $e");
      return null;
    }
  }
  static Future<UserModel?> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/api/users/login'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "email": email,
          "password": password,
        }),
      );

      if (response.statusCode == 200) {
        final userModel = userModelFromJson(response.body);
        if (userModel.token != null) {
          await _saveUser(userModel);
        }
        return userModel;
      } else {
        print("Login failed: ${response.body}");
        return null;
      }
    } catch (e) {
      print("Login error: $e");
      return null;
    }
  }
  static Future<void> _saveUser(UserModel userModel) async {
    final prefs = await SharedPreferences.getInstance();
    if (userModel.token != null) {
      await prefs.setString("token", userModel.token!);
    }
    if (userModel.user != null) {
      await prefs.setString("user", jsonEncode(userModel.user!.toJson()));
    }
  }
  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("token");
  }

  static Future<User?> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userJson = prefs.getString("user");
    if (userJson != null) {
      return User.fromJson(jsonDecode(userJson));
    }
    return null;
  }
  static Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove("token");
    await prefs.remove("user");
  }
}
