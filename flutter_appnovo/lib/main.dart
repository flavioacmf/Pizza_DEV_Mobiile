import 'package:flutter/material.dart';

void main() {
  runApp(const PizzaDevApp());
}

class PizzaDevApp extends StatelessWidget {
  const PizzaDevApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BoasVindasScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class BoasVindasScreen extends StatelessWidget {
  const BoasVindasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color.fromARGB(255, 255, 251, 241), // Cor de fundo salmão claro
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Hey, que bom ter você aqui!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Cor do título em preto e negrito
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Image.asset(
                'assets/Red and Beige Illustrative Pizza Restaurant Logo (1)', // Certifique-se de que a imagem está na pasta correta
                height: 150,
              ),
              const SizedBox(height: 20),
              Text(
                'Aqui no app da Pizza Dev, você aproveita nossos produtos e promoções exclusivas pra pedir aquela pizza deliciosa que só a gente tem.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[800], // Cor do texto em cinza escuro
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  // Ação do botão "Próximo"
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, // Cor de fundo do botão
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                child: const Text(
                  'Próximo',
                  style: TextStyle(
                    color: Colors.white, // Cor do texto do botão
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
