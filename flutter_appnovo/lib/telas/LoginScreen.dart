import 'package:flutter/material.dart';
import 'NovoCadastro.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Eai? Seja bem vindo!",
          style: TextStyle(color: Colors.red),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: senhaController,
              decoration: InputDecoration(
                labelText: "Senha",
                border: OutlineInputBorder(),
              ),
              obscureText: true, // Oculta a senha enquanto o usuário digita
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Ação para recuperar senha
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              child: Text(
                "Esqueci minha senha",
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Ação para continuar sem login
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              child: Text(
                "Continuar sem login",
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Navegar para a tela NovoCadastro
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NovoCadastro()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              child: Text(
                "Novo por aqui? Cadastre-se",
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                // Ação para entrar no app
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: Text(
                "Entrar no app",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
