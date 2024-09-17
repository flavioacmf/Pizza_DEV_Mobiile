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
      backgroundColor: Colors.white, // Cor de fundo da tela
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 244, 67, 54),
        title: Text(
          'Beleza, vamos começar!',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Volta para a tela anterior
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          // Adiciona rolagem para evitar sobreposição
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Campo Nome e Sobrenome
              TextField(
                decoration: InputDecoration(
                  labelText: 'Nome e sobrenome',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16.0),
              // Campo Como você quer ser chamado?
              TextField(
                decoration: InputDecoration(
                  labelText: 'Como você quer ser chamado?',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16.0),
              // Campo Aniversário com máscara
              TextField(
                controller: _dataController,
                decoration: InputDecoration(
                  labelText: 'Aniversário',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.datetime,
              ),
              SizedBox(height: 16.0),
              // Campo Telefone com máscara
              TextField(
                controller: _telefoneController,
                decoration: InputDecoration(
                  labelText: 'Telefone',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 16.0),
              // Campo Email (sem máscara específica, pois é validado diretamente)
              TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
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
                    ),
                    child: Text(
                      'Cancelar',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  // Botão "Continuar"
                  ElevatedButton(
                    onPressed: () {
                      // Ação para continuar o cadastro
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CpfScreen()), // Vai para CpfScreen
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
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
