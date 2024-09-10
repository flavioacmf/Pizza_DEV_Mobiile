import 'package:flutter/material.dart';
import 'package:flutter_appnovo/telas/BoasVindasScreen.dart'; // Importa a tela de boas-vindas

void main() {
  runApp(PizzaDevApp());
}

class PizzaDevApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BoasVindasScreen(),
    );
  }
}
