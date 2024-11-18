import 'package:flutter/material.dart';
import '../models/order_item_model.dart';

class CartItemTile extends StatelessWidget {
  final OrderItem orderItem;
  final VoidCallback onRemove;

  const CartItemTile({
    super.key,
    required this.orderItem,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      title: Text(
        orderItem.product.name,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        'Quantidade: ${orderItem.quantity}\nTotal: R\$ ${(orderItem.product.price * orderItem.quantity).toStringAsFixed(2)}',
        style: const TextStyle(fontSize: 16, color: Colors.black54),
      ),
      trailing: IconButton(
        icon: const Icon(Icons.delete, color: Colors.red),
        onPressed: onRemove,
      ),
    );
  }
}
