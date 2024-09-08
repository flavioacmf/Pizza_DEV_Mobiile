import 'package:flutter/material.dart';
import 'package:flutter_appnovo/telas/BoasVindasScreen.dart'; // Importa a tela de boas-vindas
import 'package:flutter_appnovo/telas/TelaLocalizacao.dart'; // Importa a tela de localização
import 'package:flutter_appnovo/telas/CadastroScreen.dart'; // Importa a tela de cadastro

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
