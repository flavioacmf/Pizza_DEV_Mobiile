import 'package:flutter/material.dart';
import 'cardapio_screen.dart';
import 'cupons_screen.dart';
import 'pedidos_screen.dart';
import 'perfil_screen.dart';
import 'item_details_screen.dart';
import 'carrinho_screen.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  MenuScreenState createState() => MenuScreenState();
}

class MenuScreenState extends State<MenuScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch (index) {
        case 0: // Menu
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const MenuScreen()),
          );
          break;
        case 1: // Cardápio
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const CardapioScreen()),
          );
          break;
        case 2: // Cupons
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const CuponsScreen()),
          );
          break;
        case 3: // Pedidos
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const PedidosScreen()),
          );
          break;
        case 4: // Perfil
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const PerfilScreen()),
          );
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Menu Inicial',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CarrinhoScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildCategorySection('Pizzas Tradicionais', 1, [
              {
                'name': 'Calabresa',
                'image': 'lib/assets/pizzas/calabresa.png',
                'price': '37.99',
                'category': 'tradicionais'
              },
              {
                'name': 'Marguerita',
                'image': 'lib/assets/pizzas/marguerita.png',
                'price': '39.99',
                'category': 'tradicionais'
              },
              {
                'name': 'Pepperoni',
                'image': 'lib/assets/pizzas/pepperoni.png',
                'price': '42.99',
                'category': 'tradicionais'
              },
            ]),
            buildCategorySection('Pizzas Especiais', 2, [
              {
                'name': 'Filé Mignon',
                'image': 'lib/assets/pizzas/filemignon.png',
                'price': '59.99',
                'category': 'especiais'
              },
              {
                'name': 'Mozarela de Búfala',
                'image': 'lib/assets/pizzas/mozarelabuffala.png',
                'price': '64.99',
                'category': 'especiais'
              },
            ]),
            buildCategorySection('Pizzas Doces', 3, [
              {
                'name': 'Chocolate com Morango',
                'image': 'lib/assets/pizzas/chocolatemorango.png',
                'price': '29.99',
                'category': 'doces'
              },
            ]),
            buildCategorySection('Bebidas', 4, [
              {
                'name': 'Coca-Cola',
                'image': 'lib/assets/pizzas/coca600.png',
                'price': '5.99',
                'category': 'bebidas'
              },
            ]),
            buildCategorySection('Sobremesas', 5, [
              {
                'name': 'Bolo de Morango',
                'image': 'lib/assets/pizzas/bolodemorango.png',
                'price': '15.99',
                'category': 'sobremesas'
              },
            ]),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
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

  Widget buildCategorySection(
      String category, int tabIndex, List<Map<String, String>> items) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                category,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
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
          buildItemList(items),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget buildItemList(List<Map<String, String>> items) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ItemDetailsScreen(
                    itemName: items[index]['name']!,
                    imagePath: items[index]['image']!,
                    price: items[index]['price']!,
                    category: items[index]['category']!,
                  ),
                ),
              );
            },
            child: buildItemCard(
              items[index]['name']!,
              items[index]['image']!,
              'R\$ ${items[index]['price']}',
            ),
          );
        },
      ),
    );
  }

  Widget buildItemCard(String name, String imagePath, String price) {
    return Container(
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
          Image.asset(imagePath, height: 80),
          const SizedBox(height: 8),
          Text(
            name,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            price,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
