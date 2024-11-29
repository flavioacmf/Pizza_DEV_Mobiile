import 'package:flutter/material.dart';
import 'item_details_screen.dart';
import 'menu_screen.dart';
import 'cupons_screen.dart';
import 'pedidos_screen.dart';
import 'perfil_screen.dart';
import 'produto.dart';
import 'menu_screen.dart';

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
      initialIndex: widget.initialTabIndex,
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
        currentIndex: 1,
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MenuScreen()),
              );
              break;
            case 1:
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CuponsScreen()),
              );
              break;
            case 3:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PedidosScreen()),
              );
              break;
            case 4:
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

  Widget _buildMeioAMeioList(List<Produto> produtos) {
    return ListView.builder(
      padding: const EdgeInsets.all(8.0),
      itemCount: produtos.length,
      itemBuilder: (context, index) {
        final produto = produtos[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          child: ListTile(
            leading: Image.asset(produto.imagem, height: 50, width: 50),
            title: Text(produto.nome),
            subtitle: Text(produto.categoria),
            trailing: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ItemDetailsScreen(
                      produto: produto,
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

  Widget _buildCategoryList(List<Produto> produtos) {
    return ListView.builder(
      padding: const EdgeInsets.all(8.0),
      itemCount: produtos.length,
      itemBuilder: (context, index) {
        final produto = produtos[index];
        final isBeverage = produto.categoria == 'bebidas';
        final sizes = isBeverage ? ['Lata', '600ml', '1L', '2L'] : null;

        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          child: ListTile(
            leading: Image.asset(produto.imagem, height: 50, width: 50),
            title: Text(produto.nome),
            subtitle: Text(produto.categoria),
            trailing: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ItemDetailsScreen(
                      produto: produto,
                      sizes: sizes, // Passa tamanhos apenas para bebidas
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

final List<Produto> _meioAMeio = [
  Produto(
    id: '1',
    nome: 'Pizza Média',
    preco: 37.99,
    imagem: 'lib/assets/pizzas/pizzaMeioAMeio.png',
    categoria: 'Pizza com 8 fatias.',
    tamanho: 'Média',
    quantidade: 1,
  ),
  Produto(
    id: '2',
    nome: 'Pizza Grande',
    preco: 47.99,
    imagem: 'lib/assets/pizzas/pizzaMeioAMeio.png',
    categoria: 'Pizza com 12 fatias.',
    tamanho: 'Grande',
    quantidade: 1,
  ),
  Produto(
    id: '3',
    nome: 'Pizza Família',
    preco: 57.99,
    imagem: 'lib/assets/pizzas/pizzaMeioAMeio.png',
    categoria: 'Pizza com 16 fatias.',
    tamanho: 'Família',
    quantidade: 1,
  ),
];

final List<Produto> _tradicionais = [
  Produto(
    id: '4',
    nome: 'Calabresa',
    preco: 37.99,
    imagem: 'lib/assets/pizzas/calabresa.png',
    categoria: 'Pizza com calabresa e queijo.',
    tamanho: 'Único',
    quantidade: 1,
  ),
  Produto(
    id: '5',
    nome: 'Marguerita',
    preco: 39.99,
    imagem: 'lib/assets/pizzas/marguerita.png',
    categoria: 'Pizza com manjericão e tomate.',
    tamanho: 'Único',
    quantidade: 1,
  ),
];

final List<Produto> _especiais = [
  Produto(
    id: '6',
    nome: 'Filé Mignon',
    preco: 59.99,
    imagem: 'lib/assets/pizzas/filemignon.png',
    categoria: 'Pizza com filé mignon.',
    tamanho: 'Único',
    quantidade: 1,
  ),
  Produto(
    id: '7',
    nome: 'Mozarela de Búfala',
    preco: 54.99,
    imagem: 'lib/assets/pizzas/mozarelabuffala.png',
    categoria: 'Pizza com mozarela de búfala e manjericão.',
    tamanho: 'Único',
    quantidade: 1,
  ),
];

final List<Produto> _doces = [
  Produto(
    id: '8',
    nome: 'Chocolate com Morango',
    preco: 29.99,
    imagem: 'lib/assets/pizzas/chocolatemorango.png',
    categoria: 'Pizza doce com chocolate e morangos frescos.',
    tamanho: 'Único',
    quantidade: 1,
  ),
  Produto(
    id: '9',
    nome: 'Romeu e Julieta',
    preco: 27.99,
    imagem: 'lib/assets/pizzas/romeujulieta.png',
    categoria: 'Queijo e goiabada cremosa.',
    tamanho: 'Único',
    quantidade: 1,
  ),
];

final List<Produto> _brotinho = [
  Produto(
    id: '10',
    nome: 'Mini Calabresa',
    preco: 19.99,
    imagem: 'lib/assets/pizzas/minicalabresa.png',
    categoria: 'Brotinho com calabresa.',
    tamanho: 'Brotinho',
    quantidade: 1,
  ),
  Produto(
    id: '11',
    nome: 'Mini Frango Catupiry',
    preco: 21.99,
    imagem: 'lib/assets/pizzas/minifrangocatupiry.png',
    categoria: 'Brotinho com frango e catupiry.',
    tamanho: 'Brotinho',
    quantidade: 1,
  ),
];

final List<Produto> _bebidas = [
  Produto(
    id: '12',
    nome: 'Coca-Cola',
    preco: 5.99,
    imagem: 'lib/assets/pizzas/coca600.png',
    categoria: 'Bebida gelada.',
    tamanho: '600ml',
    quantidade: 1,
  ),
  Produto(
    id: '13',
    nome: 'Suco de Laranja',
    preco: 4.99,
    imagem: 'lib/assets/pizzas/sucodelaranja.png',
    categoria: 'Laranja natural, sem adição de açúcar.',
    tamanho: '300ml',
    quantidade: 1,
  ),
];

final List<Produto> _sobremesas = [
  Produto(
    id: '14',
    nome: 'Bolo de Morango',
    preco: 15.99,
    imagem: 'lib/assets/pizzas/bolodemorango.png',
    categoria: 'Bolo com recheio e cobertura de morangos frescos.',
    tamanho: 'Individual',
    quantidade: 1,
  ),
  Produto(
    id: '15',
    nome: 'Torta de Limão',
    preco: 12.99,
    imagem: 'lib/assets/pizzas/tortadelimao.png',
    categoria: 'Torta doce com creme de limão.',
    tamanho: 'Individual',
    quantidade: 1,
  ),
];
