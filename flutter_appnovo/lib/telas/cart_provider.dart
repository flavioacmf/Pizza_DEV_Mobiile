import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String name;
  final double price;
  final int quantity;

  CartItem({
    required this.id,
    required this.name,
    required this.price,
    required this.quantity,
  });
}

class Pedido {
  final String id;
  final List<CartItem> itens;
  final double total;
  String status; // Status do pedido

  Pedido({
    required this.id,
    required this.itens,
    required this.total,
    this.status = 'Em Produção', // Status inicial
  });
}

class CartProvider extends ChangeNotifier {
  final Map<String, CartItem> _items = {};
  final List<Pedido> _pedidos = []; // Lista de pedidos

  Map<String, CartItem> get items => _items;

  List<Pedido> get pedidos => _pedidos;

  double get totalAmount {
    return _items.values.fold(
      0.0,
      (total, item) => total + (item.price * item.quantity),
    );
  }

  void addItem(String id, String name, double price) {
    if (_items.containsKey(id)) {
      _items.update(
        id,
        (existingItem) => CartItem(
          id: existingItem.id,
          name: existingItem.name,
          price: existingItem.price,
          quantity: existingItem.quantity + 1,
        ),
      );
    } else {
      _items.putIfAbsent(
        id,
        () => CartItem(
          id: id,
          name: name,
          price: price,
          quantity: 1,
        ),
      );
    }
    notifyListeners();
  }

  void removeItem(String id) {
    _items.remove(id);
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }

  void finalizarPedido() {
    if (_items.isEmpty) return;

    final novoPedido = Pedido(
      id: DateTime.now().toString(),
      itens: _items.values.toList(),
      total: totalAmount + 10.0, // Adiciona taxa de entrega
    );

    _pedidos.add(novoPedido); // Adiciona o pedido à lista
    clearCart(); // Esvazia o carrinho
    notifyListeners();
  }
}
