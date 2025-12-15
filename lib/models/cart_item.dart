import 'menu.dart';

class CartItem {
  final Menu menu;
  final DateTime addedAt;

  CartItem({
    required this.menu,
    required this.addedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': menu.id,
      'name': menu.name,
      'imageUrl': menu.imageUrl,
      'price': menu.price,
      'category': menu.category,
      'displayOrder': menu.displayOrder,
      'addedAt': addedAt.toIso8601String(),
    };
  }

  factory CartItem.fromMap(Map<String, dynamic> map) {
    return CartItem(
      menu: Menu(
        id: map['id'] as String,
        name: map['name'] as String,
        imageUrl: map['imageUrl'] as String,
        price: map['price'] as int,
        category: map['category'] as String,
        displayOrder: map['displayOrder'] as int,
      ),
      addedAt: DateTime.parse(map['addedAt']),
    );
  }
}
