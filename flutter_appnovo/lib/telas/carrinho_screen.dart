import 'package:flutter/material.dart';

class CarrinhoScreen extends StatelessWidget {
  const CarrinhoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrinho'),
        backgroundColor: Colors.red,
      ),
      body: const Center(
        child: Text(
          'Seu carrinho está vazio!',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
