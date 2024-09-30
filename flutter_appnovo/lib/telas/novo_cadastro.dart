import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'cpf_screen.dart';

class NovoCadastro extends StatelessWidget {
  // Controladores para os campos de texto com máscara
  final _dataController = MaskedTextController(mask: '00/00/0000');
  final _telefoneController = MaskedTextController(mask: '(00) 00000-0000');

  NovoCadastro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF1F0), // Cor de fundo ajustada
      appBar: AppBar(
        automaticallyImplyLeading: false, // Remove o ícone padrão de voltar
        backgroundColor: const Color.fromARGB(255, 244, 67, 54),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Ícone de voltar (seta)
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context); // Volta para a tela anterior
              },
              color: Colors.white,
            ),
            // Texto 'Cadastre-se 1/3'
            const Text(
              'Cadastre-se 1/3',
              style: TextStyle(fontSize: 18.0, color: Colors.white),
            ),
            // Espaço vazio para alinhar a logo fora da barra
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
              // Logo fora da AppBar, no canto direito e com tamanho maior
              Align(
                alignment: Alignment.centerRight,
                child: Image.asset(
                  'lib/assets/pizza_logo.png',
                  height: 120, // Aumenta o tamanho da logo
                ),
              ),
              const SizedBox(height: 20),
              // Título 'Beleza, vamos começar!'
              const Text(
                'Beleza, vamos começar!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              // Campo Nome e Sobrenome
              TextField(
                decoration: InputDecoration(
                  labelText: 'Nome e sobrenome',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              // Campo Como você quer ser chamado?
              TextField(
                decoration: InputDecoration(
                  labelText: 'Como você quer ser chamado?',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              // Campo Aniversário
              TextField(
                controller: _dataController,
                decoration: InputDecoration(
                  labelText: 'Aniversário',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                keyboardType: TextInputType.datetime,
              ),
              const SizedBox(height: 16.0),
              // Campo Telefone
              TextField(
                controller: _telefoneController,
                decoration: InputDecoration(
                  labelText: 'Telefone',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 16.0),
              // Campo Email
              TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 32.0),
              // Botões
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Botão "Cancelar" com cor do fundo e contorno preto
                  OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context); // Volta para a tela anterior
                    },
                    style: OutlinedButton.styleFrom(
                      backgroundColor: const Color(0xFFFFF1F0), // Cor igual ao fundo
                      side: const BorderSide(color: Colors.black), // Contorno preto
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 15,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      'Cancelar',
                      style: TextStyle(color: Colors.black), // Texto preto
                    ),
                  ),
                  // Botão "Continuar" com fundo vermelho
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CpfScreen()), // Adiciona const
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red, // Fundo vermelho
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 15,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      'Continuar',
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
}
