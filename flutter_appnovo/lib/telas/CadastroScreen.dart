import 'package:flutter/material.dart';
import 'package:flutter_appnovo/telas/NovoCadastro.dart';

class CadastroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF1F0),
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Etapa 3/3'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Volta para a tela anterior
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.spaceEvenly, // Espaçamento uniforme
          crossAxisAlignment:
              CrossAxisAlignment.center, // Centraliza horizontalmente
          children: [
            // Ícone de sucesso
            Icon(
              Icons.check_circle_outline,
              color: Colors.red,
              size: 100,
            ),
            // Texto de confirmação
            Text(
              'Oba, tudo certo!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            // Texto explicativo
            Text(
              'Agora é só fazer seu cadastro. Lembrando que se você ainda não permitiu sua localização, iremos solicitá-la novamente.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
              textAlign: TextAlign.center,
            ),
            // Botão "Novo por aqui? Cadastre-se"
            ElevatedButton(
              onPressed: () {
                // Navegar para a tela NovoCadastro
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NovoCadastro()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding: EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                'Novo por aqui? Cadastre-se',
                style: TextStyle(fontSize: 18),
              ),
            ),
            // Botão "Já possui conta? Entrar"
            OutlinedButton(
              onPressed: () {
                // Navegar para a página de login
              },
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.black),
                padding: EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                'Já possui conta? Entrar',
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
            ),
            // Botão "Continuar sem cadastro"
            TextButton(
              onPressed: () {
                // Ação para continuar sem cadastro
              },
              child: Text(
                'Continuar sem cadastro',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
