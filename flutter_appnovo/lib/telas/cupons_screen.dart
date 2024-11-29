import 'package:flutter/material.dart';

class CuponsScreen extends StatelessWidget {
  const CuponsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text(
          'Cupons',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: const Center(
        child: Text(
          'Aqui estão seus cupons!',
          style: TextStyle(fontSize: 18),
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
