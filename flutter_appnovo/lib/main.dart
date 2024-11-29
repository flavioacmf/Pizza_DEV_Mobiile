import 'package:flutter/material.dart';
import 'telas/perfil_screen.dart'; // Import corrigido
import 'telas/login_screen.dart';
import 'telas/menu_screen.dart';
import 'telas/cardapio_screen.dart';
import 'telas/cupons_screen.dart';
import 'telas/pedidos_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pizza App',
      theme: ThemeData(primarySwatch: Colors.red),
      initialRoute: '/menu', // Página inicial definida como Menu
      routes: {
        '/menu': (context) => const MenuScreen(), // Tela do Menu
        '/cardapio': (context) => const CardapioScreen(), // Tela do Cardápio
        '/cupons': (context) => const CuponsScreen(), // Tela de Cupons
        '/pedidos': (context) => const PedidosScreen(), // Tela de Pedidos
        '/perfil': (context) => const PerfilScreen(), // Tela de Perfil
        '/login': (context) => const LoginScreen(), // Tela de Login
      },
    );
  }
}
