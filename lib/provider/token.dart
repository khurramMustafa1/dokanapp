import 'package:flutter/cupertino.dart';

class Token extends ChangeNotifier {
  String _token = '';

  void setToken(String val) {
    _token = val;
    notifyListeners();
  }

  String getToken() => _token;
}