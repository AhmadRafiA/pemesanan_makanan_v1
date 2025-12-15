import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/cart_item.dart';

class CartStorage {
  static const _key = 'cart_items';

  Future<void> saveCart(List<CartItem> items) async {
    final prefs = await SharedPreferences.getInstance();
    final data = items.map((e) => e.toMap()).toList();
    prefs.setString(_key, jsonEncode(data));
  }

  Future<List<CartItem>> loadCart() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_key);

    if (jsonString == null) return [];

    final List decoded = jsonDecode(jsonString);
    return decoded.map((e) => CartItem.fromMap(e)).toList();
  }
}
