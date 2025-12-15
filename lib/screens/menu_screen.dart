import 'package:flutter/material.dart';
import 'package:pemesanan_makanan_v1/widgets/price_text.dart';
import 'package:provider/provider.dart';
import '../providers/menu_provider.dart';
import '../providers/cart_provider.dart';
import '../models/menu.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<MenuProvider>().loadMenus();
      context.read<CartProvider>().loadCart();
    });
  }

  @override
  Widget build(BuildContext context) {
    final menuProvider = context.watch<MenuProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Menu'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.pushNamed(context, '/cart');
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: menuProvider.menus.length,
        itemBuilder: (context, index) {
          final Menu menu = menuProvider.menus[index];
          return ListTile(
            leading: Image.network(menu.imageUrl, width: 50),
            title: Text(menu.name),
            subtitle: PriceText(menu.price),
            trailing: IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                context.read<CartProvider>().addToCart(menu);
              },
            ),
          );
        },
      ),
    );
  }
}
