import 'package:flutter/material.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_button.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTextField(labelText: 'E-mail', controller: emailController),
            const SizedBox(height: 16),
            CustomTextField(
                labelText: 'Senha',
                controller: passwordController,
                obscureText: true),
            const SizedBox(height: 30),
            CustomButton(
              text: 'Entrar',
              onPressed: () {
                // Implementar lógica de login
              },
            ),
          ],
        ),
      ),
    );
  }
}
