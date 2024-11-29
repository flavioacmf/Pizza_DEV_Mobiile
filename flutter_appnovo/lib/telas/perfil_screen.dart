import 'package:flutter/material.dart';

class PerfilScreen extends StatelessWidget {
  const PerfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text(
          'Perfil',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('lib/assets/user_profile.png'),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'João da Silva',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'joao.silva@email.com',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            _buildProfileOption(
              context,
              icon: Icons.edit,
              title: 'Editar Perfil',
              onTap: () {
                // Adicione a navegação para edição de perfil
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Funcionalidade em desenvolvimento.'),
                    backgroundColor: Colors.red,
                  ),
                );
              },
            ),
            const Divider(),
            _buildProfileOption(
              context,
              icon: Icons.lock,
              title: 'Alterar Senha',
              onTap: () {
                // Adicione a navegação para alteração de senha
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Funcionalidade em desenvolvimento.'),
                    backgroundColor: Colors.red,
                  ),
                );
              },
            ),
            const Divider(),
            _buildProfileOption(
              context,
              icon: Icons.notifications,
              title: 'Configurações de Notificações',
              onTap: () {
                // Configurações de notificações
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Funcionalidade em desenvolvimento.'),
                    backgroundColor: Colors.red,
                  ),
                );
              },
            ),
            const Divider(),
            _buildProfileOption(
              context,
              icon: Icons.exit_to_app,
              title: 'Sair da Conta',
              onTap: () {
                _confirmarLogout(context);
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 4, // Define o índice para Perfil
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushReplacementNamed(context, '/menu');
              break;
            case 1:
              Navigator.pushReplacementNamed(context, '/cardapio');
              break;
            case 2:
              Navigator.pushReplacementNamed(context, '/cupons');
              break;
            case 3:
              Navigator.pushReplacementNamed(context, '/pedidos');
              break;
            case 4:
              break; // Já estamos nesta tela
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_pizza), label: 'Cardápio'),
          BottomNavigationBarItem(
              icon: Icon(Icons.confirmation_number), label: 'Cupons'),
          BottomNavigationBarItem(icon: Icon(Icons.note_add), label: 'Pedidos'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
        ],
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
      ),
    );
  }

  // Widget para as opções do perfil
  Widget _buildProfileOption(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.red),
      title: Text(title),
      onTap: onTap,
    );
  }

  // Diálogo de confirmação para logout
  void _confirmarLogout(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Sair da Conta'),
          content: const Text('Tem certeza que deseja sair da sua conta?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Fecha o diálogo
              },
              child:
                  const Text('Cancelar', style: TextStyle(color: Colors.grey)),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName('/login'));
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: const Text('Sair', style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }
}
