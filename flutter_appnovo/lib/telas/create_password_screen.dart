import 'package:flutter/material.dart';
import 'solicitar_localizacao.dart';

class CreatePasswordScreen extends StatefulWidget {
  const CreatePasswordScreen({super.key});

  @override
  CreatePasswordScreenState createState() => CreatePasswordScreenState();
}

class CreatePasswordScreenState extends State<CreatePasswordScreen> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  bool isCheckboxChecked = false;
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;
  String? errorMessage;

  // Método para abrir a tela SolicitarLocalizacao
  void abrirSolicitarLocalizacao(BuildContext context) {
    if (!_validarSenha()) return; // Valida senha antes de abrir o modal

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      builder: (context) => DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.75,
        minChildSize: 0.5,
        maxChildSize: 0.9,
        builder: (_, controller) => const SolicitarLocalizacao(),
      ),
    );
  }

  // Validação de senha
  bool _validarSenha() {
    final senha = passwordController.text;
    final confirmSenha = confirmPasswordController.text;

    if (senha.isEmpty || confirmSenha.isEmpty) {
      setState(() {
        errorMessage = 'Preencha ambos os campos de senha.';
      });
      return false;
    }

    if (senha != confirmSenha) {
      setState(() {
        errorMessage = 'As senhas não correspondem.';
      });
      return false;
    }

    if (senha.length < 8 ||
        !senha.contains(RegExp(r'[A-Z]')) ||
        !senha.contains(RegExp(r'[a-z]')) ||
        !senha.contains(RegExp(r'[0-9]')) ||
        !senha.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      setState(() {
        errorMessage =
            'A senha deve conter pelo menos 8 caracteres, incluindo letras maiúsculas, minúsculas, números e caracteres especiais.';
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
      backgroundColor: const Color(0xFFFFF1F0),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 244, 67, 54),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
              color: Colors.white,
            ),
            const Text(
              'Cadastre-se 3/3',
              style: TextStyle(fontSize: 18.0, color: Colors.white),
            ),
            const SizedBox(width: 24),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerRight,
                child: Image.asset(
                  'lib/assets/pizza_logo.png',
                  height: 100,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Sua Pizza Dev está cada vez mais perto: crie sua senha!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              _buildPasswordField(
                controller: passwordController,
                labelText: "Qual será sua senha?",
                isPasswordVisible: isPasswordVisible,
                onVisibilityToggle: () {
                  setState(() {
                    isPasswordVisible = !isPasswordVisible;
                  });
                },
              ),
              const SizedBox(height: 20),
              RichText(
                textAlign: TextAlign.left,
                text: const TextSpan(
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
              const SizedBox(height: 20),
              _buildPasswordField(
                controller: confirmPasswordController,
                labelText: "Confirme sua senha",
                isPasswordVisible: isConfirmPasswordVisible,
                onVisibilityToggle: () {
                  setState(() {
                    isConfirmPasswordVisible = !isConfirmPasswordVisible;
                  });
                },
              ),
              const SizedBox(height: 20),
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
                  const Expanded(
                    child: Text(
                      "Aceito receber informações, incluindo ofertas especiais, cupons e novidades.",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: OutlinedButton.styleFrom(
                      backgroundColor: const Color(0xFFFFF1F0),
                      side: const BorderSide(color: Colors.black),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      "Cancelar",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      abrirSolicitarLocalizacao(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
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

  Widget _buildPasswordField({
    required TextEditingController controller,
    required String labelText,
    required bool isPasswordVisible,
    required VoidCallback onVisibilityToggle,
  }) {
    return TextField(
      controller: controller,
      obscureText: !isPasswordVisible,
      decoration: InputDecoration(
        labelText: labelText,
        errorText: errorMessage,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        suffixIcon: IconButton(
          icon: Icon(
            isPasswordVisible ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: onVisibilityToggle,
        ),
      ),
    );
  }
}
