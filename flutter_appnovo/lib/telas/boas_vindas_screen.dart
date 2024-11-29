import 'package:flutter/material.dart';
import 'tela_localizacao.dart'; // Certifique-se de que o caminho esteja correto

class BoasVindasScreen extends StatelessWidget {
  const BoasVindasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF1F0), // Fundo rosa claro
      body: Column(
        children: [
          // Barra vermelha no topo
          Container(
            height: 50, // Altura da barra
            width: double.infinity,
            color: Colors.red,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 16.0), // Espaçamento horizontal
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.center, // Centraliza verticalmente
                crossAxisAlignment:
                    CrossAxisAlignment.center, // Centraliza horizontalmente
                children: [
                  // Logo da Pizza Dev
                  Image.asset(
                    'lib/assets/pizza_logo.png',
                    height: 300, // Tamanho da logo
                  ),
                  const SizedBox(
                      height:
                          40), // Espaçamento entre logo e texto de boas-vindas

                  // Texto de boas-vindas
                  const Text(
                    'Hey, que bom ter você aqui!',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                      height: 16), // Espaçamento entre o título e a descrição

                  // Descrição
                  const Text(
                    'Aqui no app da Pizza Dev, você aproveita nossos produtos e promoções exclusivas pra pedir aquela pizza deliciosa que só a gente tem.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                      height: 80), // Espaçamento entre o texto e o botão

                  // Botão "Próximo"
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TelaLocalizacao(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 100,
                        vertical: 20,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
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
