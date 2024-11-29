import 'package:flutter/material.dart';
import 'produto.dart'; // Certifique-se de que a classe Produto está implementada corretamente

class PersonalizeMeioMeioScreen extends StatefulWidget {
  final Produto pizza;

  const PersonalizeMeioMeioScreen({
    super.key,
    required this.pizza,
  });

  @override
  State<PersonalizeMeioMeioScreen> createState() =>
      _PersonalizeMeioMeioScreenState();
}

class _PersonalizeMeioMeioScreenState extends State<PersonalizeMeioMeioScreen> {
  int quantity = 1; // Quantidade de pizzas
  Produto? selectedFlavor1; // Primeiro sabor
  Produto? selectedFlavor2; // Segundo sabor

  // Preço total baseado na quantidade e sabores escolhidos
  double get subtotal =>
      quantity *
      (((selectedFlavor1?.preco ?? 0) + (selectedFlavor2?.preco ?? 0)) / 2);

  // Lista de sabores disponíveis
  final List<Produto> flavors = [
    Produto(
      id: '1',
      nome: '1/2 Calabresa e Requeijão',
      preco: 37.99,
      imagem: 'lib/assets/pizzas/calabresa.png',
      categoria: 'Meio a Meio',
      tamanho: 'Médio',
      quantidade: 1,
    ),
    Produto(
      id: '2',
      nome: '1/2 Napolitana',
      preco: 39.99,
      imagem: 'lib/assets/pizzas/napolitana.png',
      categoria: 'Meio a Meio',
      tamanho: 'Médio',
      quantidade: 1,
    ),
    Produto(
      id: '3',
      nome: '1/2 Pepperoni e Requeijão',
      preco: 41.99,
      imagem: 'lib/assets/pizzas/pepperoni.png',
      categoria: 'Meio a Meio',
      tamanho: 'Médio',
      quantidade: 1,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(widget.pizza.nome),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imagem da pizza
            Center(
              child: Image.asset(
                widget.pizza.imagem,
                height: 200,
              ),
            ),
            const SizedBox(height: 20),

            // Nome da pizza
            Center(
              child: Text(
                widget.pizza.nome,
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
            DropdownButtonFormField<Produto>(
              value: selectedFlavor1,
              hint: const Text("Selecione o primeiro sabor"),
              items: flavors.map((flavor) {
                return DropdownMenuItem<Produto>(
                  value: flavor,
                  child: Text(
                      "${flavor.nome} - R\$ ${flavor.preco.toStringAsFixed(2)}"),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedFlavor1 = value;
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
            DropdownButtonFormField<Produto>(
              value: selectedFlavor2,
              hint: const Text("Selecione o segundo sabor"),
              items: flavors.map((flavor) {
                return DropdownMenuItem<Produto>(
                  value: flavor,
                  child: Text(
                      "${flavor.nome} - R\$ ${flavor.preco.toStringAsFixed(2)}"),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedFlavor2 = value;
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
                              "Você adicionou $quantity ${widget.pizza.nome} meio a meio ao carrinho."),
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
