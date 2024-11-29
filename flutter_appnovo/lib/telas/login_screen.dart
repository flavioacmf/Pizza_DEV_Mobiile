import 'package:flutter/material.dart';
import 'novo_cadastro.dart';
import 'menu_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  bool isPasswordVisible = false;
  String? errorMessage;

  // Validação de email e senha
  bool _validarCampos() {
    if (emailController.text.isEmpty || senhaController.text.isEmpty) {
      setState(() {
        errorMessage = 'Preencha ambos os campos.';
      });
      return false;
    }
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(emailController.text)) {
      setState(() {
        errorMessage = 'Insira um email válido.';
      });
      return false;
    }
    setState(() {
      errorMessage = null; // Limpa mensagem de erro
    });
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Logo e Saudação
              const SizedBox(height: 20),
              Image.asset(
                'lib/assets/pizza_logo.png',
                height: 80,
              ),
              const SizedBox(height: 20),
              const Text(
                "E aí? Seja bem-vindo!",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),

              // Campos de Login
              _buildTextField(
                controller: emailController,
                labelText: "Email",
                hintText: "Digite seu email",
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 10),
              _buildPasswordField(
                controller: senhaController,
                labelText: "Senha",
                isPasswordVisible: isPasswordVisible,
                onVisibilityToggle: () {
                  setState(() {
                    isPasswordVisible = !isPasswordVisible;
                  });
                },
              ),

              // Esqueci minha senha
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () {
                    // Implementar recuperação de senha
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Funcionalidade em desenvolvimento.'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  },
                  child: const Text(
                    "Esqueci minha senha",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ),

              // Mensagem de erro
              if (errorMessage != null)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Text(
                    errorMessage!,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),

              // Botão Entrar
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_validarCampos()) {
                    // Realizar login (substituir por lógica real futuramente)
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MenuScreen(),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  "Entrar no app",
                  style: TextStyle(color: Colors.white),
                ),
              ),

              // Login com outras contas
              const SizedBox(height: 20),
              const Center(
                child: Text(
                  "Ou use outra conta",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ),
              const SizedBox(height: 10),
              _buildSocialLoginButton(
                context: context,
                icon: Image.asset(
                  'lib/assets/google_icon.png',
                  height: 20,
                  width: 20,
                ),
                label: "Entrar com o Google",
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Login com Google em desenvolvimento.'),
                      backgroundColor: Colors.grey,
                    ),
                  );
                },
              ),
              const SizedBox(height: 10),
              _buildSocialLoginButton(
                context: context,
                icon: const Icon(Icons.apple, color: Colors.black),
                label: "Iniciar sessão com a Apple",
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Login com Apple em desenvolvimento.'),
                      backgroundColor: Colors.grey,
                    ),
                  );
                },
              ),

              // Cadastro e Continuar sem login
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NovoCadastro(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  "Novo por aqui? Cadastre-se",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MenuScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    "Continuar sem login",
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

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
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
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

  Widget _buildSocialLoginButton({
    required BuildContext context,
    required Widget icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: icon,
      label: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        side: const BorderSide(color: Colors.grey),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        padding: const EdgeInsets.symmetric(vertical: 12),
        foregroundColor: Colors.black,
      ),
    );
  }
}
