import 'package:flutter/material.dart';
import 'package:pemesanan_makanan_v1/widgets/price_text.dart';
import 'package:provider/provider.dart';
import '../utils/currency_formatter.dart';
import '../providers/cart_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>();
    final price = cart.priceDetail;

    return Scaffold(
      appBar: AppBar(title: const Text('Keranjang')),
      body: Column(
        children: [
          /// list item di keranjang
          Expanded(
            child: cart.items.isEmpty
                ? const Center(
                    child: Text(
                      'Keranjang masih kosong',
                      style: TextStyle(color: Colors.grey),
                    ),
                  )
                : ListView.builder(
                    itemCount: cart.items.length,
                    itemBuilder: (context, index) {
                      final item = cart.items[index];

                      return ListTile(
                        title: Text(item.menu.name),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            PriceText(item.menu.price),
                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                context.read<CartProvider>().removeAt(index);
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
          ),

          /// tampilan harga
          const Divider(),
          ListTile(
            title: const Text('Subtotal'),
            trailing: PriceText(price['subtotal'] ?? 0),
          ),
          ListTile(
            title: const Text('Service Charge (7.5%)'),
            trailing: PriceText(price['serviceCharge'] ?? 0),
          ),
          ListTile(
            title: const Text('PB1 (10%)'),
            trailing: PriceText(price['pb1'] ?? 0),
          ),
          ListTile(
            title: const Text(
              'Total',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            trailing: PriceText(
              price['total'] ?? 0,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
