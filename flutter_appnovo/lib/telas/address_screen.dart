import 'package:flutter/material.dart';
import 'login_screen.dart';

class AddressScreen extends StatefulWidget {
  final ScrollController scrollController;

  const AddressScreen({super.key, required this.scrollController});

  @override
  AddressScreenState createState() => AddressScreenState();
}

class AddressScreenState extends State<AddressScreen> {
  final TextEditingController logradouroController = TextEditingController();
  final TextEditingController bairroController = TextEditingController();
  final TextEditingController cepController = TextEditingController();
  final TextEditingController cidadeController = TextEditingController();
  final TextEditingController estadoController = TextEditingController();

  String? categoriaSelecionada;
  String? errorMessage;

  // Validação dos campos
  bool _validarCampos() {
    if (logradouroController.text.isEmpty ||
        bairroController.text.isEmpty ||
        cepController.text.isEmpty ||
        cidadeController.text.isEmpty ||
        estadoController.text.isEmpty) {
      setState(() {
        errorMessage = 'Preencha todos os campos obrigatórios.';
      });
      return false;
    }
    if (cepController.text.length != 8 ||
        !RegExp(r'^\d{8}$').hasMatch(cepController.text)) {
      setState(() {
        errorMessage = 'Insira um CEP válido (8 dígitos numéricos).';
      });
      return false;
    }
    if (categoriaSelecionada == null) {
      setState(() {
        errorMessage = 'Selecione uma categoria para o endereço.';
      });
      return false;
    }
    setState(() {
      errorMessage = null;
    });
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text(
          "Adicionar Endereço",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          controller: widget.scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildTextField(
                controller: logradouroController,
                labelText: "Logradouro",
                hintText: "Ex.: Rua das Flores",
              ),
              const SizedBox(height: 10),
              _buildTextField(
                controller: bairroController,
                labelText: "Bairro",
                hintText: "Ex.: Centro",
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: _buildTextField(
                      controller: cidadeController,
                      labelText: "Cidade",
                      hintText: "Ex.: São Paulo",
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _buildTextField(
                      controller: estadoController,
                      labelText: "Estado",
                      hintText: "Ex.: SP",
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              _buildTextField(
                controller: cepController,
                labelText: "CEP",
                hintText: "Ex.: 12345678",
                keyboardType: TextInputType.number,
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
                  _buildCategoriaButton('Casa', Icons.home),
                  _buildCategoriaButton('Trabalho', Icons.work),
                  _buildCategoriaButton('Outros', Icons.star),
                ],
              ),
              if (errorMessage != null)
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    errorMessage!,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.black,
                      side: const BorderSide(color: Colors.black),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15),
                    ),
                    child: const Text("Cancelar"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_validarCampos()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Endereço salvo com sucesso!'),
                            backgroundColor: Colors.green,
                          ),
                        );
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15),
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
      ),
    );
  }

  // Campo de texto reutilizável
  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    String? hintText,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        border: const OutlineInputBorder(),
      ),
    );
  }

  // Botão de categoria com destaque
  Widget _buildCategoriaButton(String categoria, IconData icon) {
    final bool isSelected = categoriaSelecionada == categoria;
    return IconButton(
      icon: Icon(
        icon,
        color: isSelected ? Colors.red : Colors.grey,
      ),
      onPressed: () {
        setState(() {
          categoriaSelecionada = categoria;
        });
      },
      tooltip: categoria,
    );
  }
}
