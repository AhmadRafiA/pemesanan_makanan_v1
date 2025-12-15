import 'package:flutter/material.dart';
import '../models/menu.dart';
import '../services/menu_service.dart';

class MenuProvider extends ChangeNotifier {
  final MenuService _service = MenuService();
  List<Menu> _menus = [];

  List<Menu> get menus => _menus;

  Future<void> loadMenus() async {
    _menus = await _service.fetchMenus();

    // Urutkan sesuai displayOrder
    _menus.sort((a, b) => a.displayOrder.compareTo(b.displayOrder));

    notifyListeners();
  }

  List<Menu> getByCategory(String category) {
    return _menus.where((m) => m.category == category).toList();
  }
}
