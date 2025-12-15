import 'package:flutter/material.dart';
import '../models/cart_item.dart';
import '../models/menu.dart';
import '../services/cart_storage.dart';
import '../utils/price_calculator.dart';

class CartProvider extends ChangeNotifier {
  final CartStorage _storage = CartStorage();
  List<CartItem> _items = [];

  List<CartItem> get items => _items;

  /// Load cart dari local storage
  Future<void> loadCart() async {
    _items = await _storage.loadCart();
    notifyListeners();
  }

  /// Tambah item ke cart
  Future<void> addToCart(Menu menu) async {
    _items.add(CartItem(menu: menu, addedAt: DateTime.now()));
    await _storage.saveCart(_items);
    notifyListeners();
  }

  /// Hapus item di index tertentu
  Future<void> removeAt(int index) async {
    if (index < 0 || index >= _items.length) return;
    _items.removeAt(index);
    await _storage.saveCart(_items);
    notifyListeners();
  }

  /// Hitung subtotal
  int get subtotal => _items.fold(0, (sum, item) => sum + item.menu.price);

  /// Detail harga (subtotal, service, pb1, total)
  Map<String, int> get priceDetail {
    return PriceCalculator.calculateTotal(subtotal);
  }
}
