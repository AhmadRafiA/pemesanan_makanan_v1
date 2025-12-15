class Menu {
  final String id;
  final String name;
  final String imageUrl;
  final int price;
  final String category;
  final int displayOrder;

  Menu({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.category,
    required this.displayOrder,
  });

  factory Menu.fromMap(Map<String, dynamic> map, String id) {
    return Menu(
      id: id,
      name: map['name'] ?? 'Tanpa nama',
      imageUrl: map['imageUrl'] ?? '',
      price: map['price'] ?? '',
      category: map['category'] ?? '',
      displayOrder: map['displayOrder'] ?? 0,
    );
  }
}
