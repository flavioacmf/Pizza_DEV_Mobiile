import 'order_item_model.dart';
import 'product_model.dart';

class Order {
  final List<OrderItem> items;
  double totalAmount;

  Order({
    required this.items,
    required this.totalAmount,
  });

  // Construtor para criação a partir de JSON
  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      items: (json['items'] as List)
          .map((item) => OrderItem.fromJson(item))
          .toList(),
      totalAmount: json['totalAmount'],
    );
  }

  // Converte para JSON
  Map<String, dynamic> toJson() {
    return {
      'items': items.map((item) => item.toJson()).toList(),
      'totalAmount': totalAmount,
    };
  }

  // Cria uma cópia do pedido com possíveis alterações
  Order copyWith({
    List<OrderItem>? items,
    double? totalAmount,
  }) {
    return Order(
      items: items ?? this.items,
      totalAmount: totalAmount ?? this.totalAmount,
    );
  }
}
