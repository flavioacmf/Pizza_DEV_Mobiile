import 'package:flutter/material.dart';
import '../models/order_item_model.dart';
import '../models/product_model.dart';
import '../models/order_model.dart';

class OrderController extends ChangeNotifier {
  Order _order = Order(items: [], totalAmount: 0.0);

  Order get order => _order;

  // Adiciona um produto ao pedido
  void addProductToOrder(Product product, int quantity) {
    final existingItem = _order.items.firstWhere(
      (item) => item.product.id == product.id,
      orElse: () => OrderItem(product: product, quantity: 0),
    );

    if (existingItem.quantity > 0) {
      // Atualiza a quantidade se o produto já estiver no pedido
      existingItem.quantity += quantity;
    } else {
      // Adiciona um novo item ao pedido
      _order.items.add(OrderItem(product: product, quantity: quantity));
    }

    _calculateTotal();
    notifyListeners();
  }

  // Remove um produto do pedido
  void removeProductFromOrder(Product product) {
    _order.items.removeWhere((item) => item.product.id == product.id);
    _calculateTotal();
    notifyListeners();
  }

  // Calcula o total do pedido
  void _calculateTotal() {
    _order.totalAmount = _order.items.fold(0, (sum, item) {
      return sum + (item.product.price * item.quantity);
    });
  }

  // Finaliza o pedido (simulação de pagamento)
  Future<void> finalizeOrder() async {
    // Aqui você pode implementar a integração com um serviço de pagamento
    // ou qualquer lógica adicional de finalização do pedido.

    // Após finalizar o pedido, limpar os dados do pedido atual
    _order = Order(items: [], totalAmount: 0.0);
    notifyListeners();
  }
}
