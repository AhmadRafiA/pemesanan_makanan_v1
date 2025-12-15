import 'package:flutter/material.dart';
import 'package:pemesanan_makanan_v1/utils/price_calculator.dart';
import '../models/cart_item.dart';
import '../models/menu.dart';
import '../services/cart_storage.dart';

class CartProvider extends ChangeNotifier {
  final CartStorage _storage = CartStorage();
  List<CartItem> _items = [];

  List<CartItem> get items => _items;

  Future<void> loadCart() async {
    _items = await _storage.loadCart();
    notifyListeners();
  }

  Future<void> addToCart(Menu menu) async {
    _items.add(
      CartItem(menu: menu, addedAt: DateTime.now()),
    );
    await _storage.saveCart(_items);
    notifyListeners();
  }

  int get subtotal =>
      _items.fold(0, (sum, item) => sum + item.menu.price);

  Map<String, int> get priceDetail {
    return PriceCalculator.calculateTotal(subtotal);
  }

  Future<void> removeFromCart(CartItem item) async {
    _items.remove(item);
    await _storage.saveCart(_items);
    notifyListeners();
  }
}
