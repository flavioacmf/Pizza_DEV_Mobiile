import 'product_model.dart';

class OrderItem {
  final Product product;
  late final int quantity;

  OrderItem({
    required this.product,
    required this.quantity,
  });

  // Construtor para criar a partir de JSON
  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      product: Product.fromJson(json['produto']),
      quantity: json['quantidade'],
    );
  }

  // Converte para JSON
  Map<String, dynamic> toJson() {
    return {
      'produto': product.toJson(),
      'quantidade': quantity,
    };
  }

  // Preço total do item
  double get totalPrice => product.price * quantity;
}
