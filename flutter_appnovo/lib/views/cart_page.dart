import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/order_controller.dart';
import '../widgets/cart_item_tile.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final orderController = Provider.of<OrderController>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Carrinho')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: orderController.order.items.length,
              itemBuilder: (context, index) {
                final orderItem = orderController.order.items[index];
                return CartItemTile(
                  orderItem: orderItem,
                  onRemove: () {
                    orderController.removeProductFromOrder(orderItem.product);
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Total: R\$ ${orderController.order.totalAmount.toStringAsFixed(2)}',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.right,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // Lógica de finalização do pedido
                    orderController.finalizeOrder();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Pedido finalizado com sucesso!')),
                    );
                  },
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
