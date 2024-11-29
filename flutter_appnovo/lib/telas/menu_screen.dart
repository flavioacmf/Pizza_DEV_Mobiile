import 'package:flutter/material.dart';
import 'produto.dart'; // Certifique-se de que a classe Produto está implementada corretamente
import 'cart_screen.dart'; // Tela de Carrinho
import 'cardapio_screen.dart'; // Tela do Cardápio
import 'cupons_screen.dart'; // Tela de Cupons
import 'pedidos_screen.dart'; // Tela de Pedidos
import 'perfil_screen.dart'; // Tela de Perfil
import 'item_details_screen.dart'; // Tela de Detalhes do Produto

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
        backgroundColor: Colors.red,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartScreen()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildCategorySection(context, 'Pizzas Tradicionais', 1, [
              Produto(
                id: '1',
                nome: 'Calabresa',
                preco: 37.99,
                imagem: 'lib/assets/pizzas/calabresa.png',
                categoria: 'tradicionais',
                tamanho: 'Média',
                quantidade: 1,
              ),
              Produto(
                id: '2',
                nome: 'Marguerita',
                preco: 39.99,
                imagem: 'lib/assets/pizzas/marguerita.png',
                categoria: 'tradicionais',
                tamanho: 'Média',
                quantidade: 1,
              ),
              Produto(
                id: '3',
                nome: 'Pepperoni',
                preco: 42.99,
                imagem: 'lib/assets/pizzas/pepperoni.png',
                categoria: 'tradicionais',
                tamanho: 'Média',
                quantidade: 1,
              ),
            ]),
            buildCategorySection(context, 'Pizzas Especiais', 2, [
              Produto(
                id: '4',
                nome: 'Filé Mignon',
                preco: 59.99,
                imagem: 'lib/assets/pizzas/filemignon.png',
                categoria: 'especiais',
                tamanho: 'Grande',
                quantidade: 1,
              ),
              Produto(
                id: '5',
                nome: 'Mozarela de Búfala',
                preco: 64.99,
                imagem: 'lib/assets/pizzas/mozarelabuffala.png',
                categoria: 'especiais',
                tamanho: 'Grande',
                quantidade: 1,
              ),
            ]),
            buildCategorySection(context, 'Pizzas Doces', 3, [
              Produto(
                id: '6',
                nome: 'Chocolate com Morango',
                preco: 29.99,
                imagem: 'lib/assets/pizzas/chocolatemorango.png',
                categoria: 'doces',
                tamanho: 'Média',
                quantidade: 1,
              ),
            ]),
            buildCategorySection(context, 'Bebidas', 4, [
              Produto(
                id: '7',
                nome: 'Coca-Cola',
                preco: 5.99,
                imagem: 'lib/assets/pizzas/coca600.png',
                categoria: 'bebidas',
                tamanho: '600ml',
                quantidade: 1,
              ),
            ]),
            buildCategorySection(context, 'Sobremesas', 5, [
              Produto(
                id: '8',
                nome: 'Bolo de Morango',
                preco: 15.99,
                imagem: 'lib/assets/pizzas/bolodemorango.png',
                categoria: 'sobremesas',
                tamanho: 'Individual',
                quantidade: 1,
              ),
            ]),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: (index) {
          switch (index) {
            case 0:
              break;
            case 1:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const CardapioScreen()),
              );
              break;
            case 2:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => CuponsScreen()),
              );
              break;
            case 3:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => PedidosScreen()),
              );
              break;
            case 4:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const PerfilScreen()),
              );
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_pizza),
            label: 'Cardápio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.confirmation_number),
            label: 'Cupons',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.note_add),
            label: 'Pedidos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
      ),
    );
  }

  Widget buildCategorySection(BuildContext context, String title, int tabIndex,
      List<Produto> produtos) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          CardapioScreen(initialTabIndex: tabIndex),
                    ),
                  );
                },
                child: const Text(
                  'Mostrar Mais',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 150,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: produtos.length,
              itemBuilder: (context, index) {
                final produto = produtos[index];
                return buildProductCard(
                  produto,
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ItemDetailsScreen(produto: produto),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildProductCard(Produto produto, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 120,
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(produto.imagem, height: 80),
            const SizedBox(height: 8),
            Text(
              produto.nome,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Text(
              'R\$ ${produto.preco.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
