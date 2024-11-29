import 'package:flutter/material.dart';
import 'item_details_screen.dart';
import 'menu_screen.dart';
import 'personalize_meio_meio_screen.dart';
import 'cupons_screen.dart';
import 'pedidos_screen.dart';
import 'perfil_screen.dart';

class CardapioScreen extends StatefulWidget {
  final int initialTabIndex;

  const CardapioScreen({super.key, this.initialTabIndex = 0});

  @override
  State<CardapioScreen> createState() => _CardapioScreenState();
}

class _CardapioScreenState extends State<CardapioScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 7,
      vsync: this,
      initialIndex: widget.initialTabIndex, // Usa o índice inicial fornecido
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text(
          'Cardápio',
          style: TextStyle(color: Colors.white),
        ),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          isScrollable: true,
          tabs: const [
            Tab(text: 'Pizzas Meio a Meio'),
            Tab(text: 'Pizzas Tradicionais'),
            Tab(text: 'Pizzas Especiais'),
            Tab(text: 'Pizzas Doces'),
            Tab(text: 'Pizzas Brotinho'),
            Tab(text: 'Bebidas'),
            Tab(text: 'Sobremesas'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildMeioAMeioList(_meioAMeio),
          _buildCategoryList(_tradicionais),
          _buildCategoryList(_especiais),
          _buildCategoryList(_doces),
          _buildCategoryList(_brotinho),
          _buildCategoryList(_bebidas),
          _buildCategoryList(_sobremesas),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1, // Índice atual da barra
        onTap: (index) {
          switch (index) {
            case 0: // Home
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MenuScreen()),
              );
              break;
            case 1: // Cardápio (já na tela atual)
              break;
            case 2: // Cupons
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CuponsScreen()),
              );
              break;
            case 3: // Pedidos
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PedidosScreen()),
              );
              break;
            case 4: // Perfil
              Navigator.push(
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

  Widget _buildMeioAMeioList(List<Map<String, String>> items) {
    return ListView.builder(
      padding: const EdgeInsets.all(8.0),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          child: ListTile(
            leading: Image.asset(item['image']!, height: 50, width: 50),
            title: Text(item['name']!),
            subtitle: Text(item['description']!),
            trailing: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PersonalizeMeioMeioScreen(
                      pizzaName: item['name']!,
                      pizzaImage: item['image']!,
                    ),
                  ),
                );
              },
              child: const Text('Personalizar'),
            ),
          ),
        );
      },
    );
  }

  Widget _buildCategoryList(List<Map<String, String>> items) {
    return ListView.builder(
      padding: const EdgeInsets.all(8.0),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          child: ListTile(
            leading: Image.asset(item['image']!, height: 50, width: 50),
            title: Text(item['name']!),
            subtitle: Text(item['description']!),
            trailing: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ItemDetailsScreen(
                      itemName: item['name']!,
                      imagePath: item['image']!,
                      price: item['price']!,
                      ingredients: item['ingredients']!.split(','),
                      category: item['category']!,
                    ),
                  ),
                );
              },
              child: const Text('Detalhes'),
            ),
          ),
        );
      },
    );
  }
}

final _meioAMeio = [
  {
    'name': 'Pizza Média',
    'image': 'lib/assets/pizzas/pizzaMeioAMeio.png',
    'description': 'Pizza com 8 fatias.',
  },
  {
    'name': 'Pizza Grande',
    'image': 'lib/assets/pizzas/pizzaMeioAMeio.png',
    'description': 'Pizza com 12 fatias.',
  },
  {
    'name': 'Pizza Família',
    'image': 'lib/assets/pizzas/pizzaMeioAMeio.png',
    'description': 'Pizza com 16 fatias.',
  },
];

final _tradicionais = [
  {
    'name': 'Calabresa',
    'image': 'lib/assets/pizzas/calabresa.png',
    'description': 'Pizza com calabresa e queijo.',
    'price': '37.99',
    'ingredients': 'Calabresa,Queijo,Molho de tomate,Orégano',
    'category': 'tradicionais',
  },
  {
    'name': 'Marguerita',
    'image': 'lib/assets/pizzas/marguerita.png',
    'description': 'Pizza com manjericão e tomate.',
    'price': '39.99',
    'ingredients': 'Manjericão,Tomate,Queijo,Molho de tomate',
    'category': 'tradicionais',
  },
];

final _especiais = [
  {
    'name': 'Filé Mignon',
    'image': 'lib/assets/pizzas/filemignon.png',
    'description': 'Pizza com filé mignon.',
    'price': '59.99',
    'ingredients': 'Filé mignon,Queijo,Molho especial,Orégano',
    'category': 'especiais',
  },
];

final _doces = [
  {
    'name': 'Chocolate com Morango',
    'image': 'lib/assets/pizzas/chocolatemorango.png',
    'description': 'Pizza doce com morango.',
    'price': '29.99',
    'ingredients': 'Chocolate,Morango',
    'category': 'doces',
  },
];

final _brotinho = [
  {
    'name': 'Mini Calabresa',
    'image': 'lib/assets/pizzas/minicalabresa.png',
    'description': 'Brotinho com calabresa.',
    'price': '19.99',
    'ingredients': 'Calabresa,Queijo,Orégano',
    'category': 'brotinho',
  },
];

final _bebidas = [
  {
    'name': 'Coca-Cola 600ml',
    'image': 'lib/assets/pizzas/coca600.png',
    'description': 'Bebida gelada.',
    'price': '5.99',
    'ingredients': 'Coca-Cola',
    'category': 'bebidas',
  },
];

final _sobremesas = [
  {
    'name': 'Bolo de Morango',
    'image': 'lib/assets/pizzas/bolodemorango.png',
    'description': 'Sobremesa deliciosa.',
    'price': '15.99',
    'ingredients': 'Morango,Creme,Massa fofa',
    'category': 'sobremesas',
  },
];