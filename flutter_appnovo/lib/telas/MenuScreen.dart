import 'package:flutter/material.dart';

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch (index) {
        case 0:
          break;
        case 1:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CardapioScreen()),
          );
          break;
        case 2:
          break;
        case 3:
          break;
        case 4:
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Menu Inicial',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
        automaticallyImplyLeading: false, // Remove a seta de navegação
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildCategorySection('Pizzas tradicionais', 'Mostrar Mais', [
              {'name': 'Calabresa', 'image': 'lib/assets/pizzas/calabresa.png'},
              {
                'name': 'Marguerita',
                'image': 'lib/assets/pizzas/marguerita.png'
              },
              {'name': 'Pepperoni', 'image': 'lib/assets/pizzas/pepperoni.png'},
              {
                'name': 'Quatro Queijos',
                'image': 'lib/assets/pizzas/quatroqueijos.png'
              },
              {
                'name': 'Vegetariana',
                'image': 'lib/assets/pizzas/vegetariana.png'
              },
            ]),
            buildCategorySection('Pizzas especiais', 'Mostrar Mais', [
              {
                'name': 'Filé Mignon',
                'image': 'lib/assets/pizzas/filemignon.png'
              },
              {
                'name': 'Mozarela de Búfala',
                'image': 'lib/assets/pizzas/mozarelabuffala.png'
              },
              {
                'name': 'Queijo Bacon',
                'image': 'lib/assets/pizzas/queijobacon.png'
              },
            ]),
            buildCategorySection('Pizza brotinho', 'Mostrar Mais', [
              {
                'name': 'Mini Calabresa',
                'image': 'lib/assets/pizzas/minicalabresa.png'
              },
              {
                'name': 'Mini Frango Catupiry',
                'image': 'lib/assets/pizzas/minifrangocatupiry.png'
              },
              {
                'name': 'Mini Queijo',
                'image': 'lib/assets/pizzas/miniqueijo.png'
              },
            ]),
            buildCategorySection('Pizzas doces', 'Mostrar Mais', [
              {
                'name': 'Chocolate com Morango',
                'image': 'lib/assets/pizzas/chocolatemorango.png'
              },
              {
                'name': 'Romeu e Julieta',
                'image': 'lib/assets/pizzas/romeujulieta.png'
              },
              {
                'name': 'Doce de Leite',
                'image': 'lib/assets/pizzas/docedeleite.png'
              },
            ]),
            buildCategorySection('Bebidas', 'Mostrar Mais', [
              {
                'name': 'Suco de Laranja',
                'image': 'lib/assets/pizzas/sucodelaranja.png'
              },
              {
                'name': 'Heineken',
                'image': 'lib/assets/pizzas/heinekenlongneck.png'
              },
            ]),
            buildCategorySection('Sobremesas', 'Mostrar Mais', [
              {
                'name': 'Bolo de Morango',
                'image': 'lib/assets/pizzas/bolodemorango.png'
              },
            ]),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
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
      String category, String actionText, List<Map<String, String>> items) {
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
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CardapioScreen()),
                  );
                },
                child: Text(
                  actionText,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          buildItemList(items), // Usar lista com rolagem horizontal
          SizedBox(height: 20),
        ],
      ),
    );
  }

  // Função para exibir itens em rolagem horizontal
  Widget buildItemList(List<Map<String, String>> items) {
    return SizedBox(
      height: 150, // Altura definida para os itens
      child: ListView.builder(
        scrollDirection: Axis.horizontal, // Rolagem horizontal
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
                    price: 'R\$ 7,99', // Defina o preço padrão
                  ),
                ),
              );
            },
            child: buildItemCard(items[index]['name']!, items[index]['image']!,
                'R\$ 7,99'), // Preço padrão
          );
        },
      ),
    );
  }

  Widget buildItemCard(String name, String imagePath, String price) {
    return Container(
      width: 120, // Largura fixa para cada item
      margin: EdgeInsets.only(right: 10), // Espaçamento entre itens
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imagePath, height: 80),
          SizedBox(height: 8),
          Text(
            name,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 4),
          Text(
            price,
            style: TextStyle(
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

class ItemDetailsScreen extends StatelessWidget {
  final String itemName;
  final String imagePath;
  final String price;

  ItemDetailsScreen({
    required this.itemName,
    required this.imagePath,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(itemName),
        backgroundColor: Colors.red,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          Image.asset(imagePath, height: 200),
          SizedBox(height: 20),
          Text(
            itemName,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            price,
            style: TextStyle(fontSize: 20, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

class CardapioScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cardápio',
          style: TextStyle(color: Colors.red),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Center(
        child: Text('Conteúdo do Cardápio'),
      ),
    );
  }
}
