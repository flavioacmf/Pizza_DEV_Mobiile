import 'package:flutter/material.dart';
import 'package:flutter_appnovo/telas/produto.dart';
import 'menu_screen.dart'; // Certifique-se de importar a classe Produto

class ItemDetailsScreen extends StatefulWidget {
  final Produto produto;
  final List<String>? sizes; // Lista de tamanhos (apenas para bebidas)

  const ItemDetailsScreen({
    super.key,
    required this.produto,
    this.sizes,
  });

  @override
  State<ItemDetailsScreen> createState() => _ItemDetailsScreenState();
}

class _ItemDetailsScreenState extends State<ItemDetailsScreen> {
  int quantity = 1;
  String? selectedSize;

  @override
  void initState() {
    super.initState();
    if (widget.produto.categoria == 'bebidas' &&
        widget.sizes != null &&
        widget.sizes!.isNotEmpty) {
      // Seleciona o primeiro tamanho disponível para bebidas
      selectedSize = widget.sizes!.first;
    }
  }

  void _incrementQuantity() {
    setState(() {
      quantity++;
    });
  }

  void _decrementQuantity() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isBeverage =
        widget.produto.categoria == 'bebidas'; // Verifica se é bebida

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(widget.produto.nome),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                widget.produto.imagem,
                height: 150,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              widget.produto.nome,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            if (isBeverage &&
                widget.sizes != null &&
                widget.sizes!.isNotEmpty) ...[
              const Text(
                'Selecione o tamanho:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              const SizedBox(height: 8),
              Column(
                children: widget.sizes!.map((size) {
                  return RadioListTile<String>(
                    title: Text(size),
                    value: size,
                    groupValue: selectedSize,
                    onChanged: (value) {
                      setState(() {
                        selectedSize = value;
                      });
                    },
                  );
                }).toList(),
              ),
            ],
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: _decrementQuantity,
                      icon: const Icon(Icons.remove),
                    ),
                    Text(
                      '$quantity',
                      style: const TextStyle(fontSize: 16),
                    ),
                    IconButton(
                      onPressed: _incrementQuantity,
                      icon: const Icon(Icons.add),
                    ),
                  ],
                ),
                Text(
                  'Subtotal: R\$ ${(widget.produto.preco * quantity).toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Ação de adicionar ao carrinho
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: const Text('Adicionar ao Carrinho'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
