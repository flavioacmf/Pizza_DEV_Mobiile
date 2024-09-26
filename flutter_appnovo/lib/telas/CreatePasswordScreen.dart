import 'package:flutter/material.dart';
import 'SolicitarLocalizacao.dart'; // Certifique-se de importar corretamente a tela SolicitarLocalizacao

class CreatePasswordScreen extends StatefulWidget {
  @override
  _CreatePasswordScreenState createState() => _CreatePasswordScreenState();
}

class _CreatePasswordScreenState extends State<CreatePasswordScreen> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  bool isCheckboxChecked = false;
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  // Método para abrir a tela SolicitarLocalizacao
  void abrirSolicitarLocalizacao(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      builder: (context) => DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.75, // Tamanho inicial do modal
        minChildSize: 0.5,
        maxChildSize: 0.9,
        builder: (_, controller) =>
            SolicitarLocalizacao(), // Chama a tela SolicitarLocalizacao
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF1F0),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 244, 67, 54),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
              color: Colors.white,
            ),
            Text(
              'Cadastre-se 3/3',
              style: TextStyle(fontSize: 18.0, color: Colors.white),
            ),
            SizedBox(width: 24),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 10),
              Align(
                alignment: Alignment.centerRight,
                child: Image.asset(
                  'lib/assets/pizza_logo.png',
                  height: 100,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Sua Pizza Dev está cada vez mais perto: crie sua senha!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              TextField(
                controller: passwordController,
                obscureText: !isPasswordVisible,
                decoration: InputDecoration(
                  labelText: "Qual será sua senha?",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        isPasswordVisible = !isPasswordVisible;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Senha com pelo menos 8 caracteres, contendo:',
                style: TextStyle(
                    fontSize: 16, color: const Color.fromARGB(255, 0, 0, 0)),
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 10),
              RichText(
                textAlign: TextAlign.left,
                text: TextSpan(
                  style: TextStyle(fontSize: 16, color: Colors.red),
                  children: [
                    TextSpan(text: '• Mínimo 8 caracteres\n'),
                    TextSpan(text: '• Letra maiúscula. Ex: A-Z\n'),
                    TextSpan(text: '• Letra minúscula. Ex: a-z\n'),
                    TextSpan(text: '• Números de 0-9. Ex: 2, 6, 9\n'),
                    TextSpan(text: '• Caracteres especiais. Ex: !@#\$%&\n'),
                  ],
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: confirmPasswordController,
                obscureText: !isConfirmPasswordVisible,
                decoration: InputDecoration(
                  labelText: "Confirme sua senha",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      isConfirmPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        isConfirmPasswordVisible = !isConfirmPasswordVisible;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Checkbox(
                    value: isCheckboxChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isCheckboxChecked = value ?? false;
                      });
                    },
                  ),
                  Expanded(
                    child: Text(
                      "Aceito receber informações, incluindo ofertas especiais, cupons e novidades.",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Color(0xFFFFF1F0),
                      side: BorderSide(color: Colors.black),
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      "Cancelar",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      abrirSolicitarLocalizacao(
                          context); // Chama a função para abrir a tela de localização
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      "Concluir",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
