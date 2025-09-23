import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:internshipproject2/midel/modellist.dart';

class OrderService {
  final String baseUrl = "https://karyana-apis-backend.vercel.app";

  // 🔹 Common headers with Bearer token
  Map<String, String> _headers(String token) => {
    "Content-Type": "application/json",
    "Authorization": "Bearer $token",
  };

  /// Get Pending Orders
  Future<Orderlist> getPendingOrders(String token) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/api/orders/'),
        headers: _headers(token),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = json.decode(response.body);
        return Orderlist.fromJson(data);
      } else {
        throw Exception(
          "Failed to load pending orders: ${response.statusCode} → ${response.body}",
        );
      }
    } catch (e) {
      throw Exception("Error fetching pending orders: $e");
    }
  }

  /// Get Completed Orders
  Future<Orderlist> getCompletedOrders(String token) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/api/orders/'),
        headers: _headers(token),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = json.decode(response.body);
        return Orderlist.fromJson(data);
      } else {
        throw Exception(
          "Failed to load completed orders: ${response.statusCode} → ${response.body}",
        );
      }
    } catch (e) {
      throw Exception("Error fetching completed orders: $e");
    }
  }

  /// Get Cancelled Orders
  Future<Orderlist> getCancelledOrders(String token) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/api/orders/'),
        headers: _headers(token),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = json.decode(response.body);
        return Orderlist.fromJson(data);
      } else {
        throw Exception(
          "Failed to load cancelled orders: ${response.statusCode} → ${response.body}",
        );
      }
    } catch (e) {
      throw Exception("Error fetching cancelled orders: $e");
    }
  }
}