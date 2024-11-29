import 'package:flutter/material.dart';

class PersonalizeMeioMeioScreen extends StatefulWidget {
  final String pizzaName;
  final String pizzaImage;

  const PersonalizeMeioMeioScreen({
    super.key,
    required this.pizzaName,
    required this.pizzaImage,
  });

  @override
  State<PersonalizeMeioMeioScreen> createState() =>
      _PersonalizeMeioMeioScreenState();
}

class _PersonalizeMeioMeioScreenState extends State<PersonalizeMeioMeioScreen> {
  int quantity = 1; // Quantidade de pizzas
  String? selectedFlavor1; // Primeiro sabor
  String? selectedFlavor2; // Segundo sabor
  double flavor1Price = 0.0; // Preço do primeiro sabor
  double flavor2Price = 0.0; // Preço do segundo sabor

  // Preço total baseado na quantidade e sabores escolhidos
  double get subtotal => quantity * ((flavor1Price + flavor2Price) / 2);

  // Lista de sabores disponíveis
  final List<Map<String, dynamic>> flavors = [
    {
      'name': '1/2 Calabresa e Requeijão',
      'price': 37.99,
      'image': 'lib/assets/pizzas/calabresa.png'
    },
    {
      'name': '1/2 Napolitana',
      'price': 39.99,
      'image': 'lib/assets/pizzas/napolitana.png'
    },
    {
      'name': '1/2 Pepperoni e Requeijão',
      'price': 41.99,
      'image': 'lib/assets/pizzas/pepperoni.png'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(widget.pizzaName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imagem da pizza
            Center(
              child: Image.asset(
                widget.pizzaImage,
                height: 200,
              ),
            ),
            const SizedBox(height: 20),

            // Nome da pizza
            Center(
              child: Text(
                widget.pizzaName,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Escolha do primeiro sabor
            const Text(
              "Escolha o primeiro sabor:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: selectedFlavor1,
              hint: const Text("Selecione o primeiro sabor"),
              items: flavors.map((flavor) {
                return DropdownMenuItem<String>(
                  value: flavor['name'],
                  child: Text(
                      "${flavor['name']} - R\$ ${flavor['price'].toStringAsFixed(2)}"),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedFlavor1 = value;
                  flavor1Price = flavors
                      .firstWhere((flavor) => flavor['name'] == value)['price'];
                });
              },
            ),
            const SizedBox(height: 20),

            // Escolha do segundo sabor
            const Text(
              "Escolha o segundo sabor:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: selectedFlavor2,
              hint: const Text("Selecione o segundo sabor"),
              items: flavors.map((flavor) {
                return DropdownMenuItem<String>(
                  value: flavor['name'],
                  child: Text(
                      "${flavor['name']} - R\$ ${flavor['price'].toStringAsFixed(2)}"),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedFlavor2 = value;
                  flavor2Price = flavors
                      .firstWhere((flavor) => flavor['name'] == value)['price'];
                });
              },
            ),
            const SizedBox(height: 20),

            // Controle de quantidade
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      if (quantity > 1) quantity--;
                    });
                  },
                  icon: const Icon(Icons.remove_circle_outline),
                  color: Colors.red,
                  iconSize: 32,
                ),
                Text(
                  '$quantity',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      quantity++;
                    });
                  },
                  icon: const Icon(Icons.add_circle_outline),
                  color: Colors.red,
                  iconSize: 32,
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Subtotal
            Center(
              child: Text(
                'Subtotal: R\$ ${subtotal.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const Spacer(),

            // Botão de adicionar ao carrinho
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (selectedFlavor1 == null || selectedFlavor2 == null) {
                    // Exibe alerta se os sabores não foram selecionados
                    showDialog(
                      context: context,
                      builder: (context) => const AlertDialog(
                        title: Text("Seleção Incompleta"),
                        content: Text(
                            "Por favor, escolha os dois sabores antes de continuar."),
                      ),
                    );
                  } else {
                    // Exibe confirmação de adição ao carrinho
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("Pizza Adicionada"),
                          content: Text(
                              "Você adicionou $quantity ${widget.pizzaName} meio a meio ao carrinho."),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text("Continuar"),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 15,
                  ),
                ),
                child: const Text(
                  "Adicionar ao Carrinho",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
