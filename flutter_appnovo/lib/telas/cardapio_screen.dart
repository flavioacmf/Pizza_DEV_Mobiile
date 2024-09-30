import 'package:flutter/material.dart';

class CardapioScreen extends StatefulWidget {
  const CardapioScreen({super.key});

  @override
  CardapioScreenState createState() => CardapioScreenState();
}

class CardapioScreenState extends State<CardapioScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Cardápio",
          style: TextStyle(color: Colors.red),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            buildSection("Pizzas brotinho", const [
              "Queijo: R\$ 12,99",
              "Calabresa: R\$ 12,99",
              "Frango e catupiry: R\$ 13,99",
            ]),
            buildSection("Pizzas doces", const [
              "Romeu e Julieta: a partir de R\$ 29,99",
            ]),
            buildSection("Pizzas especiais", const [
              "Frango e catupiry: R\$ 13,99",
            ]),
            buildSection("Pizzas tradicionais", const [
              "Queijo: R\$ 12,99",
              "Calabresa: R\$ 12,99",
            ]),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Ação para mostrar mais itens do cardápio
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: const Text(
                "Mostrar mais",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSection(String sectionTitle, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          sectionTitle,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 10),
        ...items.map((item) => Text(
              item,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            )),
        const SizedBox(height: 20),
      ],
    );
  }
}
