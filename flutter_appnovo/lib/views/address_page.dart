import 'package:flutter/material.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_button.dart';

class AddressPage extends StatelessWidget {
  final TextEditingController zipCodeController = TextEditingController();
  final TextEditingController streetController = TextEditingController();
  final TextEditingController cityController = TextEditingController();

  AddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Endereço')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTextField(labelText: 'CEP', controller: zipCodeController),
            CustomTextField(labelText: 'Rua', controller: streetController),
            CustomTextField(labelText: 'Cidade', controller: cityController),
            const SizedBox(height: 30),
            CustomButton(
              text: 'Salvar endereço',
              onPressed: () {
                // Implementar lógica de salvar endereço
              },
            ),
          ],
        ),
      ),
    );
  }
}
