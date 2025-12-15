import '../models/menu.dart';

class MenuService {
  Future<List<Menu>> fetchMenus() async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));

    final rawData = [
      {
        "id": "M01",
        "name": "Nasi Goreng",
        "imageUrl": "C:\PBP\pemesanan_makanan_v1\assets\img\nasi_goreng.jpg",
        "price": 20000,
        "category": "Makanan",
        "displayOrder": 1,
      },
      {
        "id": "M02",
        "name": "Mie Ayam",
        "imageUrl": "C:\PBP\pemesanan_makanan_v1\assets\img\mie_goreng.jpg",
        "price": 15000,
        "category": "Makanan",
        "displayOrder": 1,
      },
      {
        "id": "M03",
        "name": "Es Teh",
        "imageUrl": "https://example.com/sate_ayam.jpg",
        "price": 10000,
        "category": "Minuman",
        "displayOrder": 1,
      },
    ];

    final uniqueIds = <String>{};

    return rawData
        .where((e) => uniqueIds.add(e['id'] as String))
        .map((e) => Menu.fromMap(e, e['id'] as String))
        .toList();
  }
}
