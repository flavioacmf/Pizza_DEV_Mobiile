import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'create_password_screen.dart';

class CpfScreen extends StatefulWidget {
  const CpfScreen({super.key});

  @override
  State<CpfScreen> createState() => _CpfScreenState();
}

class _CpfScreenState extends State<CpfScreen> {
  final cpfController = MaskedTextController(mask: '000.000.000-00');
  String? errorMessage;

  // Função para validar o CPF
  bool _validarCpf() {
    final cpf = cpfController.text
        .replaceAll(RegExp(r'[^0-9]'), ''); // Remove pontos e traço
    if (!_cpfValido(cpf)) {
      setState(() {
        errorMessage = 'CPF inválido. Certifique-se de que está completo.';
      });
      return false;
    }
    setState(() {
      errorMessage = null; // Limpa a mensagem de erro
    });
    return true;
  }

  // Validação simples de CPF
  bool _cpfValido(String cpf) {
    if (cpf.length != 11) return false;
    // Lógica básica para evitar CPFs repetidos como 111.111.111-11
    if (RegExp(r'^(\d)\1*$').hasMatch(cpf)) return false;

    // Cálculo do dígito verificador
    for (int j = 9; j < 11; j++) {
      int soma = 0;
      for (int i = 0; i < j; i++) {
        soma += int.parse(cpf[i]) * ((j + 1) - i);
      }
      int digito = (soma * 10) % 11;
      if (digito == 10) digito = 0;
      if (digito != int.parse(cpf[j])) return false;
    }
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
              'Etapa 2/3',
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
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerRight,
                child: Image.asset(
                  'lib/assets/pizza_logo.png',
                  height: 120,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Quase lá, agora precisamos do CPF...',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  text:
                      'Mas fica de boa que essa informação é só pra garantir ',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                  children: [
                    TextSpan(
                      text: 'mais segurança na hora do pagamento,',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: ' tá?'),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              TextField(
                controller: cpfController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "CPF",
                  errorText: errorMessage, // Mostra erro caso inválido
                  prefixIcon: const Icon(Icons.credit_card),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              const SizedBox(height: 60),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            OutlinedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: OutlinedButton.styleFrom(
                backgroundColor: const Color(0xFFFFF1F0),
                side: const BorderSide(color: Colors.black),
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
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
                if (_validarCpf()) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CreatePasswordScreen(),
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text(
                "Continuar",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
