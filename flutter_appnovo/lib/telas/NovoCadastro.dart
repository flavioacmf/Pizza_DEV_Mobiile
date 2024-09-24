import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'CpfScreen.dart';

class NovoCadastro extends StatelessWidget {
  // Controladores para os campos de texto com máscara
  final _dataController = MaskedTextController(mask: '00/00/0000');
  final _telefoneController = MaskedTextController(mask: '(00) 00000-0000');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false, // Remove o ícone padrão de voltar
        backgroundColor: const Color.fromARGB(255, 244, 67, 54),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Ícone de voltar
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context); // Volta para a tela anterior
              },
              color: Colors.white,
            ),
            // Texto 'Cadastre-se 1/3'
            Text(
              'Cadastre-se 1/3',
              style: TextStyle(fontSize: 18.0, color: Colors.white),
            ),
            // Espaço vazio para alinhar a logo à direita
            SizedBox(width: 24),
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
              // Logo fora da AppBar, no canto direito
              Align(
                alignment: Alignment.centerRight,
                child: Image.asset(
                  'lib/assets/pizza_logo.png',
                  height: 70, // Aumenta a logo em 70%
                ),
              ),
              SizedBox(height: 20),
              // Título 'Beleza, vamos começar!'
              Text(
                'Beleza, vamos começar!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              // Campo Nome e Sobrenome
              TextField(
                decoration: InputDecoration(
                  labelText: 'Nome e sobrenome',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              // Campo Como você quer ser chamado?
              TextField(
                decoration: InputDecoration(
                  labelText: 'Como você quer ser chamado?',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
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
              SizedBox(height: 16.0),
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
              SizedBox(height: 16.0),
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
              SizedBox(height: 32.0),
              // Botões
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Botão "Cancelar"
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context); // Volta para a tela anterior
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 15,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      'Cancelar',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  // Botão "Continuar"
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CpfScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 15,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
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
