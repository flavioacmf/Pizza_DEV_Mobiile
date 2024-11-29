import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_provider.dart';
import 'produto.dart';

class ItemDetailsScreen extends StatefulWidget {
  final Produto produto;
  final List<String>? sizes; // Tamanhos opcionais

  const ItemDetailsScreen({
    super.key,
    required this.produto,
    this.sizes,
  });

  @override
  State<ItemDetailsScreen> createState() => _ItemDetailsScreenState();
}

class _ItemDetailsScreenState extends State<ItemDetailsScreen> {
  String? selectedSize; // Tamanho selecionado (se aplicável)
  int quantity = 1; // Quantidade padrão

  @override
  void initState() {
    super.initState();
    if (widget.sizes != null && widget.sizes!.isNotEmpty) {
      selectedSize = widget.sizes!.first; // Define o tamanho padrão
    }
  }

  @override
  Widget build(BuildContext context) {
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
                height: 200,
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
            const SizedBox(height: 8),
            Text(
              widget.produto.categoria,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 16),

            // Exibe tamanhos (se aplicável)
            if (widget.sizes != null && widget.sizes!.isNotEmpty) ...[
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
              const SizedBox(height: 16),
            ],

            // Controle de quantidade
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        if (quantity > 1) {
                          setState(() {
                            quantity--;
                          });
                        }
                      },
                      icon: const Icon(Icons.remove),
                    ),
                    Text(
                      '$quantity',
                      style: const TextStyle(fontSize: 16),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          quantity++;
                        });
                      },
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
                  // Adiciona ao carrinho
                  final cartProvider =
                      Provider.of<CartProvider>(context, listen: false);

                  cartProvider.addItem(
                    widget.produto.id,
                    widget.produto.nome,
                    widget.produto.preco,
                  );

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        '${widget.produto.nome} adicionado ao carrinho!',
                      ),
                      backgroundColor: Colors.green,
                    ),
                  );
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
