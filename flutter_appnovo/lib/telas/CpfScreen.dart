import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart'; // Para aplicar a máscara no CPF
import 'CreatePasswordScreen.dart';

class CpfScreen extends StatelessWidget {
  final cpfController = MaskedTextController(mask: '000.000.000-00');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Quase lá, agora precisamos do CPF...",
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
              controller: cpfController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "CPF",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Mas fica de boa que essa informação é só pra garantir mais segurança na hora do pagamento, tá?",
              style: TextStyle(color: Colors.black),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Botão cancelar
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  child: Text(
                    "Cancelar",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            CreatePasswordScreen(), // Vai para CpfScreen
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  child: Text(
                    "Continuar",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
