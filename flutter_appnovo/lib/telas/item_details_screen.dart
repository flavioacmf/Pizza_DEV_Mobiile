import 'package:flutter/material.dart';

class ItemDetailsScreen extends StatefulWidget {
  final String itemName;
  final String imagePath;
  final String price;
  final String category; // Categoria (pizzas, bebidas, etc.)
  final List<String>? sizes; // Lista de tamanhos (apenas para bebidas)

  const ItemDetailsScreen({
    super.key,
    required this.itemName,
    required this.imagePath,
    required this.price,
    required this.category,
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
    if (widget.category == 'bebidas' &&
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
        widget.category == 'bebidas'; // Verifica se é bebida

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(widget.itemName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                widget.imagePath,
                height: 150,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              widget.itemName,
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
                  'Subtotal: R\$ ${(double.parse(widget.price) * quantity).toStringAsFixed(2)}',
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
