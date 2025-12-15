import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
                            Text('Rp ${item.menu.price}'),
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
            trailing: Text('Rp ${price['subtotal']}'),
          ),
          ListTile(
            title: const Text('Service Charge (7.5%)'),
            trailing: Text('Rp ${price['serviceCharge']}'),
          ),
          ListTile(
            title: const Text('PB1 (10%)'),
            trailing: Text('Rp ${price['pb1']}'),
          ),
          ListTile(
            title: const Text(
              'Total',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            trailing: Text(
              'Rp ${price['total']}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
