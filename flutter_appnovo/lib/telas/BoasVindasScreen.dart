import 'package:flutter/material.dart';
import 'TelaLocalizacao.dart'; // Certifique-se de que o caminho esteja correto

class BoasVindasScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF1F0), // Fundo rosa claro
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center, // Centraliza horizontalmente
        children: [
          // Barra vermelha no topo
          Container(
            height: 50, // Altura da barra conforme necessário
            width: double.infinity,
            color: Colors.red,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0), // Padding horizontal
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center, // Centraliza verticalmente
                crossAxisAlignment: CrossAxisAlignment.center, // Centraliza horizontalmente
                children: [
                  // Logo da Pizza Dev
                  Center(
                    child: Image.asset(
                      'lib/assets/pizza_logo.png',
                      height: 300, // Tamanho da logo
                    ),
                  ),
                  SizedBox(height: 40), // Espaçamento entre logo e o texto de boas-vindas
                  // Texto de boas-vindas
                  Text(
                    'Hey, que bom ter você aqui!',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16), // Espaçamento entre o título e a descrição
                  // Descrição
                  Text(
                    'Aqui no app da Pizza Dev, você aproveita nossos produtos e promoções exclusivas pra pedir aquela pizza deliciosa que só a gente tem.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 80), // Espaçamento entre o texto e o botão
                  // Botão "Próximo"
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TelaLocalizacao(), // Vai para TelaLocalizacao
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      'Próximo',
                      style: TextStyle(
                        fontSize: 25, 
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
