import 'package:flutter/material.dart';
import '../models/product_model.dart';

class ProductController extends ChangeNotifier {
  List<Product> _products = [];

  List<Product> get products => _products;

  // Carregar produtos (mock ou API)
  Future<void> loadProducts() async {
    _products = [
      Product(
          id: 1,
          name: 'Margherita',
          description: 'Tomate, queijo e manjericão',
          price: 30.0,
          category: 'pizza'),
      Product(
          id: 2,
          name: 'Coca-Cola',
          description: 'Refrigerante lata 350ml',
          price: 5.0,
          category: 'bebida'),
      Product(
          id: 3,
          name: 'Brownie',
          description: 'Brownie de chocolate',
          price: 10.0,
          category: 'doce'),
    ];
    notifyListeners();
  }

  // Obter produtos por categoria
  List<Product> getProductsByCategory(String category) {
    return _products.where((product) => product.category == category).toList();
  }
}
