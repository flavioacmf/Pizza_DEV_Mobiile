import 'package:flutter/material.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_button.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController nicknameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastro')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTextField(
                labelText: 'Nome Completo', controller: nameController),
            const SizedBox(height: 16),
            CustomTextField(
                labelText: 'Apelido', controller: nicknameController),
            const SizedBox(height: 16),
            CustomTextField(labelText: 'E-mail', controller: emailController),
            const SizedBox(height: 30),
            CustomButton(
              text: 'Registrar',
              onPressed: () {
                // Implementar lógica de cadastro
              },
            ),
          ],
        ),
      ),
    );
  }
}
