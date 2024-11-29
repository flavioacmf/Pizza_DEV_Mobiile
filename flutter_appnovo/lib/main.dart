import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Importação de Telas
import 'telas/boas_vindas_screen.dart';
import 'telas/perfil_screen.dart';
import 'telas/login_screen.dart';
import 'telas/menu_screen.dart';
import 'telas/cardapio_screen.dart';
import 'telas/cupons_screen.dart';
import 'telas/pedidos_screen.dart';
import 'telas/cart_screen.dart'; // Correção do import

// Provider
import 'telas/cart_provider.dart'; // Ajuste no caminho do CartProvider

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pizza App',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/', // Tela inicial definida como BoasVindasScreen
      routes: {
        '/': (context) => const BoasVindasScreen(),
        '/menu': (context) => const MenuScreen(),
        '/cardapio': (context) => const CardapioScreen(),
        '/cupons': (context) => CuponsScreen(),
        '/pedidos': (context) => PedidosScreen(),
        '/perfil': (context) => const PerfilScreen(),
        '/login': (context) => const LoginScreen(),
        '/carrinho': (context) =>
            const CartScreen(), // Adicionado rota para CartScreen
      },
    );
  }
}
