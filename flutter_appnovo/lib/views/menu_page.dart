import 'package:flutter/material.dart';
import '../controllers/product_controller.dart';
import '../widgets/product_card.dart';
import 'package:provider/provider.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    final productController = Provider.of<ProductController>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Cardápio')),
      body: ListView.builder(
        itemCount: productController.products.length,
        itemBuilder: (context, index) {
          final product = productController.products[index];
          return ProductCard(
            product: product,
            onAddToCart: () {
              // Lógica para adicionar ao carrinho
            },
          );
        },
      ),
    );
  }
}
