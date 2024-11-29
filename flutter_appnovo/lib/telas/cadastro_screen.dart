import 'package:flutter/material.dart';
import 'package:flutter_appnovo/telas/novo_cadastro.dart';
import 'login_screen.dart';
import 'menu_screen.dart';

class CadastroScreen extends StatelessWidget {
  const CadastroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF1F0),
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Etapa 3/3'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
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
            const Icon(
              Icons.check_circle_outline,
              color: Colors.red,
              size: 150,
            ),
            // Texto de confirmação
            const Text(
              'Oba, tudo certo!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            // Texto explicativo
            const Text(
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
                  MaterialPageRoute(
                      builder: (context) =>
                          const NovoCadastro()), // Remove const
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black, // Mantém o fundo preto
                padding:
                    const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text(
                'Novo por aqui? Cadastre-se',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white, // Altera a cor do texto para branco
                ),
              ),
            ),
            // Botão "Já possui conta? Entrar"
            OutlinedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(), // Remove const
                  ),
                );
              },
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.black),
                padding:
                    const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text(
                'Já possui conta? Entrar',
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
            ),
            // Botão "Continuar sem cadastro"
            TextButton(
              onPressed: () {
                // Ação para continuar sem cadastro
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MenuScreen(), // Remove const
                  ),
                );
              },
              child: const Text(
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
