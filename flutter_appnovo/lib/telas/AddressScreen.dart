import 'package:flutter/material.dart';
import 'LoginScreen.dart'; // Importando a tela de login

class AddressScreen extends StatefulWidget {
  final ScrollController scrollController; // Adiciona um controlador de rolagem

  AddressScreen({required this.scrollController}); // Construtor atualizado

  @override
  _AddressScreenState createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
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
              decoration: InputDecoration(
                labelText: "Logradouro",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: bairroController,
              decoration: InputDecoration(
                labelText: "Bairro",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: cidadeController,
                    decoration: InputDecoration(
                      labelText: "Cidade",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: estadoController,
                    decoration: InputDecoration(
                      labelText: "Estado",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            TextField(
              controller: cepController,
              decoration: InputDecoration(
                labelText: "CEP",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Como deseja favoritar esse endereço?",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: Icon(Icons.home),
                  onPressed: () {},
                  tooltip: "Casa",
                ),
                IconButton(
                  icon: Icon(Icons.work),
                  onPressed: () {},
                  tooltip: "Trabalho",
                ),
                IconButton(
                  icon: Icon(Icons.star),
                  onPressed: () {},
                  tooltip: "Outros",
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context); // Voltar para a tela anterior
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.black,
                    side: BorderSide(color: Colors.black),
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  ),
                  child: Text("Cancelar"),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Ao clicar em "Salvar endereço", navegar para a tela de login
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  ),
                  child: Text(
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
