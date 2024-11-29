import 'package:flutter/material.dart';

class CarrinhoScreen extends StatelessWidget {
  final List<Map<String, dynamic>> itensCarrinho = [
    {
      'nome': 'Pizza Calabresa',
      'quantidade': 2,
      'preco': 37.99,
      'imagem': 'lib/assets/pizzas/calabresa.png',
    },
    {
      'nome': 'Refrigerante 2L',
      'quantidade': 1,
      'preco': 9.99,
      'imagem': 'lib/assets/pizzas/coca600.png',
    },
  ];

  CarrinhoScreen({super.key});

  double calcularSubtotal() {
    return itensCarrinho.fold(0.0, (total, item) {
      return total + (item['quantidade'] * item['preco']);
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool carrinhoVazio = itensCarrinho.isEmpty;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrinho'),
        backgroundColor: Colors.red,
        actions: [
          if (!carrinhoVazio)
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                // Implementar lógica para esvaziar o carrinho
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Carrinho esvaziado!'),
                    backgroundColor: Colors.red,
                  ),
                );
              },
            ),
        ],
      ),
      body: carrinhoVazio
          ? const Center(
              child: Text(
                'Seu carrinho está vazio!',
                style: TextStyle(fontSize: 18, color: Colors.black54),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: itensCarrinho.length,
                      itemBuilder: (context, index) {
                        final item = itensCarrinho[index];
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 8.0),
                          child: ListTile(
                            leading: Image.asset(
                              item['imagem'],
                              height: 50,
                              width: 50,
                              fit: BoxFit.cover,
                            ),
                            title: Text(item['nome']),
                            subtitle: Text(
                                'Quantidade: ${item['quantidade']} | Total: R\$ ${(item['quantidade'] * item['preco']).toStringAsFixed(2)}'),
                            trailing: IconButton(
                              icon: const Icon(Icons.remove_circle_outline),
                              onPressed: () {
                                // Implementar lógica para remover item
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                        '${item['nome']} removido do carrinho!'),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Subtotal:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'R\$ ${calcularSubtotal().toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Implementar lógica para avançar para o checkout
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Indo para o checkout...'),
                          backgroundColor: Colors.green,
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      'Finalizar Compra',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
