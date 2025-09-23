// lib/provider/brandprovider.dart
import 'package:flutter/material.dart';
import 'package:internshipproject2/services/servicebrand.dart';
import '../midel/brand.dart'; // contains Brandlist, Brand, Category
class BrandProvider with ChangeNotifier {
  List<Brand> _brands = [];
  bool _isLoading = false;

  List<Brand> get brands => _brands;
  bool get isLoading => _isLoading;

  Future<void> loadBrands() async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await BrandService.getBrands(); // returns Brandlist?

      if (response != null && response.brands != null) {
        _brands = response.brands!;
        print("✔ Loaded ${_brands.length} brands from API");
      } else {
        _brands = [];
        print("❌ No brands found in API response");
      }
    } catch (e) {
      print("⚠️ Exception in provider: $e");
      _brands = [];
    }

    _isLoading = false;
    notifyListeners();
  }
}
