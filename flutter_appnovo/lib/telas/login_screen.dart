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
  bool isPasswordVisible = false; // Controle de visibilidade da senha

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        // Permite rolagem da tela
        child: Column(
          children: [
            // Barra vermelha menor no topo
            Container(
              color: Colors.red,
              height: 40, // Tamanho ajustado da barra vermelha
            ),
            const SizedBox(height: 20), // Espaçamento entre a barra e a logo

            // Logo da aplicação
            Image.asset(
              'lib/assets/pizza_logo.png',
              height: 80,
            ),

            const SizedBox(height: 10), // Espaçamento entre a logo e o texto

            // Título abaixo da logo
            const Text(
              "Eai? Seja bem vindo!",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black, // Cor preta
              ),
            ),

            const SizedBox(
                height: 20), // Espaçamento antes dos campos de email e senha

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Campo de email menor
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30), // Arredondado
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Campo de senha menor com opção de visualizar
                  TextField(
                    controller: senhaController,
                    obscureText: !isPasswordVisible,
                    decoration: InputDecoration(
                      labelText: "Senha",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30), // Arredondado
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
                  const SizedBox(
                      height:
                          5), // Espaçamento menor antes do "Esqueci minha senha"

                  // Texto "Esqueci minha senha" em vermelho
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      onPressed: () {
                        // Ação de "Esqueci minha senha"
                      },
                      child: const Text(
                        "Esqueci minha senha",
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Botão "Entrar no app" reduzido
                  ElevatedButton(
                    onPressed: () {
                      // Ação de entrar no app
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: const EdgeInsets.symmetric(vertical: 12), // Reduzido
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      "Entrar no app",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 15),

                  // Texto pequeno "Ou use outra conta"
                  const Center(
                    child: Text(
                      "Ou use outra conta",
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Botão "Entrar com o Google" com ícone, reduzido
                  ElevatedButton.icon(
                    onPressed: () {
                      // Ação de entrar com o Google
                    },
                    icon: Image.asset(
                      'lib/assets/google_icon.png',
                      height: 20,
                      width: 20,
                    ),
                    label: const Text("Entrar com o Google"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      side: const BorderSide(color: Colors.grey),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12), // Reduzido
                      foregroundColor: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Botão "Iniciar sessão com a Apple" com ícone, reduzido
                  ElevatedButton.icon(
                    onPressed: () {
                      // Ação de entrar com a Apple
                    },
                    icon: const Icon(Icons.apple, color: Colors.black),
                    label: const Text("Iniciar sessão com a Apple"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      side: const BorderSide(color: Colors.grey),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12), // Reduzido
                      foregroundColor: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 15),

                  // Botão "Novo por aqui? Cadastre-se" reduzido
                  ElevatedButton(
                    onPressed: () {
                      // Navegar para a tela de cadastro
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NovoCadastro()), // Adiciona const
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 12), // Reduzido
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

                  // Texto pequeno "Continuar sem login"
                  Center(
                    child: TextButton(
                      onPressed: () {
                        // Ação de continuar sem login
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const MenuScreen(), // Adiciona const
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
          ],
        ),
      ),
    );
  }
}
