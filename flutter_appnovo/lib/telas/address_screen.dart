import 'package:flutter/material.dart';
import 'login_screen.dart'; // Importando a tela de login

class AddressScreen extends StatefulWidget {
  final ScrollController scrollController; // Adiciona um controlador de rolagem

  const AddressScreen({super.key, required this.scrollController}); // Construtor atualizado

  @override
  AddressScreenState createState() => AddressScreenState();
}

class AddressScreenState extends State<AddressScreen> {
  final TextEditingController logradouroController = TextEditingController();
  final TextEditingController bairroController = TextEditingController();
  final TextEditingController cepController = TextEditingController();
  final TextEditingController cidadeController = TextEditingController();
  final TextEditingController estadoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        controller: widget.scrollController, // Usa o controlador de rolagem
        child: Column(
          children: [
            TextField(
              controller: logradouroController,
              decoration: const InputDecoration(
                labelText: "Logradouro",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: bairroController,
              decoration: const InputDecoration(
                labelText: "Bairro",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: cidadeController,
                    decoration: const InputDecoration(
                      labelText: "Cidade",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: estadoController,
                    decoration: const InputDecoration(
                      labelText: "Estado",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            TextField(
              controller: cepController,
              decoration: const InputDecoration(
                labelText: "CEP",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Como deseja favoritar esse endereço?",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: const Icon(Icons.home),
                  onPressed: () {},
                  tooltip: "Casa",
                ),
                IconButton(
                  icon: const Icon(Icons.work),
                  onPressed: () {},
                  tooltip: "Trabalho",
                ),
                IconButton(
                  icon: const Icon(Icons.star),
                  onPressed: () {},
                  tooltip: "Outros",
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context); // Voltar para a tela anterior
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.black,
                    side: const BorderSide(color: Colors.black),
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  ),
                  child: const Text("Cancelar"),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Ao clicar em "Salvar endereço", navegar para a tela de login
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginScreen()), // Adiciona const
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  ),
                  child: const Text(
                    "Salvar endereço",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
