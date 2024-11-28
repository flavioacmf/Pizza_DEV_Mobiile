import 'package:flutter/material.dart';
import 'ItemDetailsScreen.dart';

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
        case 0:
          break;
        case 1:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CardapioScreen()),
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

  List<String> _getIngredientsForItem(String itemName) {
    switch (itemName) {
      case 'Calabresa':
        return ["Calabresa fatiada", "Queijo mozarela", "Cebola", "Orégano"];
      case 'Marguerita':
        return [
          "Tomate fresco",
          "Queijo mozarela",
          "Manjericão",
          "Azeite de oliva"
        ];
      case 'Pepperoni':
        return ["Pepperoni", "Queijo mozarela", "Molho de tomate", "Orégano"];
      case 'Quatro Queijos':
        return [
          "Queijo mozarela",
          "Queijo parmesão",
          "Queijo gorgonzola",
          "Queijo provolone"
        ];
      case 'Vegetariana':
        return [
          "Tomate fresco",
          "Cebola",
          "Pimentão",
          "Cogumelos",
          "Queijo mozarela"
        ];
      case 'Filé Mignon':
        return ["Filé mignon", "Queijo mozarela", "Molho especial", "Orégano"];
      case 'Mozarela de Búfala':
        return [
          "Queijo mozarela de búfala",
          "Tomate cereja",
          "Manjericão",
          "Azeite de oliva"
        ];
      case 'Queijo Bacon':
        return [
          "Queijo mozarela",
          "Bacon crocante",
          "Molho especial",
          "Orégano"
        ];
      case 'Mini Calabresa':
        return ["Calabresa fatiada", "Queijo mozarela", "Cebola", "Orégano"];
      case 'Mini Frango Catupiry':
        return ["Frango desfiado", "Catupiry", "Molho de tomate", "Orégano"];
      case 'Mini Queijo':
        return ["Queijo mozarela", "Molho de tomate", "Orégano"];
      case 'Chocolate com Morango':
        return ["Chocolate ao leite", "Morangos frescos", "Creme doce"];
      case 'Romeu e Julieta':
        return ["Queijo mozarela", "Goiabada cremosa"];
      case 'Doce de Leite':
        return ["Doce de leite artesanal", "Queijo mozarela", "Creme doce"];
      case 'Suco de Laranja':
        return ["Laranja natural", "Sem adição de açúcar"];
      case 'Heineken':
        return ["Cerveja puro malte", "330ml", "Teor alcoólico: 5%"];
      case 'Bolo de Morango':
        return [
          "Massa fofa",
          "Recheio de creme",
          "Cobertura de morango fresco"
        ];
      default:
        return ["Descrição não disponível"];
    }
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
                        builder: (context) => const CardapioScreen()),
                  );
                },
                child: Text(
                  actionText,
                  style: const TextStyle(
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
                    price: 'R\$ 7,99',
                    ingredients: _getIngredientsForItem(
                        items[index]['name']!), // Adicionado
                  ),
                ),
              );
            },
            child: buildItemCard(
              items[index]['name']!,
              items[index]['image']!,
              'R\$ 7,99',
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

class CardapioScreen extends StatelessWidget {
  const CardapioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cardápio',
          style: TextStyle(color: Colors.red),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: const Center(
        child: Text('Conteúdo do Cardápio'),
      ),
    );
  }
}
