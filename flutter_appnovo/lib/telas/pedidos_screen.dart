import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_provider.dart';

class PedidosScreen extends StatelessWidget {
  const PedidosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final pedidos = cartProvider.pedidos;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Pedidos'),
      ),
      body: pedidos.isEmpty
          ? const Center(
              child: Text(
                'Nenhum pedido realizado.',
                style: TextStyle(fontSize: 16),
              ),
            )
          : ListView.builder(
              itemCount: pedidos.length,
              itemBuilder: (context, index) {
                final pedido = pedidos[index];
                return Card(
                  margin: const EdgeInsets.all(8),
                  child: ListTile(
                    title: Text(
                      'Pedido #${pedido.id}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Status: ${pedido.status}'),
                        Text(
                          'Total: R\$ ${pedido.total.toStringAsFixed(2)}',
                          style: const TextStyle(fontSize: 14),
                        ),
                        const SizedBox(height: 8),
                        ...pedido.itens.map((item) {
                          return Text(
                            '${item.quantity}x ${item.name}',
                            style: const TextStyle(fontSize: 14),
                          );
                        }).toList(),
                      ],
                    ),
                    trailing: ElevatedButton(
                      onPressed: () {
                        // Ação para detalhes ou atualização de status do pedido
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Pedido ${pedido.id} em Produção.'),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                      child: const Text('Ver Detalhes'),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
