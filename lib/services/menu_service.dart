import '../models/menu.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MenuService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<Menu>> fetchMenus() async {
    final snapshot = await _db
        .collection('menus')
        .orderBy('category')
        .orderBy('displayOrder')
        .get();

    return snapshot.docs
        .map((doc) => Menu.fromMap(doc.data(), doc.id))
        .toList();
  }
}
