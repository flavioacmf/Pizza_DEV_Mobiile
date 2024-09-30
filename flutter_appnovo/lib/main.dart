import 'package:flutter/material.dart';
import 'package:flutter_appnovo/telas/boas_vindas_screen.dart'; // Importa a tela de boas-vindas

void main() {
  runApp(const PizzaDevApp());
}

class PizzaDevApp extends StatelessWidget {
  const PizzaDevApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BoasVindasScreen(),
    );
  }
}
