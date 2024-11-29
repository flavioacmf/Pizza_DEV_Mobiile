import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final cartItems = cartProvider.items.values.toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrinho'),
        backgroundColor: Colors.red,
      ),
      body: cartItems.isEmpty
          ? const Center(
              child: Text(
                'O carrinho está vazio!',
                style: TextStyle(fontSize: 18),
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final item = cartItems[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 6),
                        child: ListTile(
                          leading: CircleAvatar(
                            child: Text('${item.quantity}x'),
                          ),
                          title: Text(item.name),
                          subtitle: Text(
                              'R\$ ${(item.price * item.quantity).toStringAsFixed(2)}'),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              // Remove o item do carrinho
                              cartProvider.removeItem(item.id);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                      '${item.name} removido do carrinho.'),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: const Border(
                      top: BorderSide(width: 1, color: Colors.grey),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total: R\$ ${cartProvider.totalAmount.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: cartItems.isEmpty
                            ? null
                            : () {
                                cartProvider.clearCart();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Carrinho esvaziado!'),
                                  ),
                                );
                              },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),
                        child: const Text('Finalizar Pedido'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
