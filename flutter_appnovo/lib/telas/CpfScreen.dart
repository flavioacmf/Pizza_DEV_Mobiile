import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart'; // Para aplicar a máscara no CPF
import 'CreatePasswordScreen.dart';

class CpfScreen extends StatelessWidget {
  final cpfController = MaskedTextController(mask: '000.000.000-00');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF1F0), // Cor de fundo ajustada
      appBar: AppBar(
        automaticallyImplyLeading: false, // Remove o ícone padrão de voltar
        backgroundColor:
            const Color.fromARGB(255, 244, 67, 54), // Barra vermelha
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context); // Voltar para a tela anterior
              },
              color: Colors.white,
            ),
            Text(
              'Etapa 2/3', // Texto da etapa
              style: TextStyle(fontSize: 18.0, color: Colors.white),
            ),
            SizedBox(width: 24), // Espaçamento para alinhar a logo
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 20),
              // Logo posicionada no canto direito e com tamanho maior
              Align(
                alignment: Alignment.centerRight,
                child: Image.asset(
                  'lib/assets/pizza_logo.png', // Insira o caminho correto da logo
                  height: 120, // Tamanho da logo
                ),
              ),
              SizedBox(height: 20),
              // Título "Quase lá, agora precisamos do CPF..."
              Text(
                'Quase lá, agora precisamos do CPF...',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              // Mensagem explicativa
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
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
              SizedBox(height: 40),
              // Campo CPF
              TextField(
                controller: cpfController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "CPF",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              SizedBox(height: 60), // Espaçamento antes dos botões
            ],
          ),
        ),
      ),
      // Botões de cancelar e continuar posicionados no final da tela
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Botão "Cancelar" com fundo igual ao da tela
            OutlinedButton(
              onPressed: () {
                Navigator.pop(context); // Volta para a tela anterior
              },
              style: OutlinedButton.styleFrom(
                backgroundColor:
                    Color(0xFFFFF1F0), // Fundo igual ao fundo da tela
                side: BorderSide(color: Colors.black), // Contorno preto
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                "Cancelar",
                style: TextStyle(color: Colors.black), // Texto preto
              ),
            ),
            // Botão "Continuar" com fundo vermelho
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        CreatePasswordScreen(), // Vai para CreatePasswordScreen
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // Fundo vermelho
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
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
