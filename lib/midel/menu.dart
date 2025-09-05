import 'package:flutter/cupertino.dart' show Widget;

class MenuItemModel {
  final String name;
  final Widget? page; // nullable page

  MenuItemModel({required this.name, this.page});
}