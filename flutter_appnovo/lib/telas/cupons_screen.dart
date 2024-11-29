import 'package:flutter/material.dart';

class CuponsScreen extends StatelessWidget {
  final List<Map<String, String>> cupons = [
    {
      'codigo': 'DEV10',
      'descricao': '10% de desconto na sua próxima compra!',
    },
    {
      'codigo': 'FRETEGRATIS',
      'descricao': 'Frete grátis em pedidos acima de R\$50,00!',
    },
  ];

  CuponsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool temCupons = cupons.isNotEmpty;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text(
          'Cupons',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: temCupons
          ? ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: cupons.length,
              itemBuilder: (context, index) {
                final cupom = cupons[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ListTile(
                    leading: const Icon(Icons.local_offer, color: Colors.red),
                    title: Text(
                      cupom['codigo']!,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    subtitle: Text(
                      cupom['descricao']!,
                      style: const TextStyle(color: Colors.black54),
                    ),
                    trailing: TextButton(
                      onPressed: () {
                        // Copia o código do cupom para a área de transferência
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Código ${cupom['codigo']} copiado!'),
                            backgroundColor: Colors.green,
                          ),
                        );
                      },
                      child: const Text(
                        'Copiar',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ),
                );
              },
            )
          : const Center(
              child: Text(
                'Você ainda não possui cupons disponíveis.',
                style: TextStyle(fontSize: 18, color: Colors.black54),
                textAlign: TextAlign.center,
              ),
            ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2, // Define o índice para Cupons
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushReplacementNamed(context, '/menu');
              break;
            case 1:
              Navigator.pushReplacementNamed(context, '/cardapio');
              break;
            case 2:
              break; // Já estamos nesta tela
            case 3:
              Navigator.pushReplacementNamed(context, '/pedidos');
              break;
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
