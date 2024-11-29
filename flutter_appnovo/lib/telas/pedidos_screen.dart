import 'package:flutter/material.dart';
import 'package:flutter_appnovo/telas/produto.dart';
import 'menu_screen.dart'; // Importar o modelo Produto

class PedidosScreen extends StatelessWidget {
  PedidosScreen({super.key});

  // Lista de pedidos simulada
  final List<Map<String, dynamic>> pedidos = [
    {
      'produto': Produto(
        id: '1',
        nome: 'Pizza Média Meio a Meio',
        preco: 42.50,
        imagem: 'lib/assets/pizzas/pizzaMeioAMeio.png',
        categoria: 'Pizzas',
        tamanho: 'Média',
        quantidade: 1,
      ),
      'quantidade': 1,
      'status': 'Em preparo',
    },
    {
      'produto': Produto(
        id: '2',
        nome: 'Pizza Grande Pepperoni',
        preco: 59.99,
        imagem: 'lib/assets/pizzas/pepperoni.png',
        categoria: 'Pizzas',
        tamanho: 'Grande',
        quantidade: 1,
      ),
      'quantidade': 2,
      'status': 'Entregue',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text(
          'Pedidos',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: pedidos.isEmpty
          ? const Center(
              child: Text(
                'Você ainda não fez nenhum pedido!',
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView.builder(
              itemCount: pedidos.length,
              padding: const EdgeInsets.all(8.0),
              itemBuilder: (context, index) {
                final pedido = pedidos[index];
                final produto = pedido['produto'] as Produto;
                final quantidade = pedido['quantidade'] as int;
                final status = pedido['status'] as String;

                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ListTile(
                    leading: Image.asset(produto.imagem, height: 50, width: 50),
                    title: Text(produto.nome),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Quantidade: $quantidade'),
                        Text('Status: $status'),
                      ],
                    ),
                    trailing: Text(
                      'R\$ ${(produto.preco * quantidade).toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                  ),
                );
              },
            ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 3, // Define o índice para Pedidos
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushReplacementNamed(context, '/menu');
              break;
            case 1:
              Navigator.pushReplacementNamed(context, '/cardapio');
              break;
            case 2:
              Navigator.pushReplacementNamed(context, '/cupons');
              break;
            case 3:
              break; // Já estamos nesta tela
            case 4:
              Navigator.pushReplacementNamed(context, '/perfil');
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_pizza), label: 'Cardápio'),
          BottomNavigationBarItem(
              icon: Icon(Icons.confirmation_number), label: 'Cupons'),
          BottomNavigationBarItem(icon: Icon(Icons.note_add), label: 'Pedidos'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
        ],
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
