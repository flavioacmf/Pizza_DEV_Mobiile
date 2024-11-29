import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'cpf_screen.dart';

class Usuario {
  final String nome;
  final String apelido;
  final String aniversario;
  final String telefone;
  final String email;

  Usuario({
    required this.nome,
    required this.apelido,
    required this.aniversario,
    required this.telefone,
    required this.email,
  });
}

class NovoCadastro extends StatefulWidget {
  const NovoCadastro({super.key});

  @override
  State<NovoCadastro> createState() => _NovoCadastroState();
}

class _NovoCadastroState extends State<NovoCadastro> {
  // Controladores para os campos de texto com máscara
  final _dataController = MaskedTextController(mask: '00/00/0000');
  final _telefoneController = MaskedTextController(mask: '(00) 00000-0000');

  // Controladores normais para outros campos
  final _nomeController = TextEditingController();
  final _apelidoController = TextEditingController();
  final _emailController = TextEditingController();

  // Chave do formulário
  final _formKey = GlobalKey<FormState>();

  // Função para validar campos
  bool _validarCampos() {
    if (_formKey.currentState?.validate() ?? false) {
      return true;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Por favor, corrija os erros antes de continuar.'),
        backgroundColor: Colors.red,
      ),
    );
    return false;
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
              'Cadastre-se 1/3',
              style: TextStyle(fontSize: 18.0, color: Colors.white),
            ),
            const SizedBox(width: 24),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
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
                  'Beleza, vamos começar!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                _buildTextField(
                  controller: _nomeController,
                  labelText: 'Nome e sobrenome',
                  hintText: 'Ex.: João da Silva',
                  icon: Icons.person,
                  validator: (value) => value == null || value.isEmpty
                      ? 'Campo obrigatório.'
                      : null,
                ),
                const SizedBox(height: 16.0),
                _buildTextField(
                  controller: _apelidoController,
                  labelText: 'Como você quer ser chamado?',
                  hintText: 'Ex.: Joãozinho',
                  icon: Icons.tag,
                  validator: (value) => value == null || value.isEmpty
                      ? 'Campo obrigatório.'
                      : null,
                ),
                const SizedBox(height: 16.0),
                _buildTextField(
                  controller: _dataController,
                  labelText: 'Aniversário',
                  hintText: 'Ex.: 01/01/2000',
                  icon: Icons.cake,
                  keyboardType: TextInputType.datetime,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Campo obrigatório.';
                    }
                    final regex = RegExp(r'^\d{2}/\d{2}/\d{4}$');
                    if (!regex.hasMatch(value)) return 'Data inválida.';
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                _buildTextField(
                  controller: _telefoneController,
                  labelText: 'Telefone',
                  hintText: '(99) 99999-9999',
                  icon: Icons.phone,
                  keyboardType: TextInputType.phone,
                  validator: (value) => value == null || value.isEmpty
                      ? 'Campo obrigatório.'
                      : null,
                ),
                const SizedBox(height: 16.0),
                _buildTextField(
                  controller: _emailController,
                  labelText: 'Email',
                  hintText: 'Ex.: exemplo@email.com',
                  icon: Icons.email,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Campo obrigatório.';
                    }
                    if (!value.contains('@')) return 'Email inválido.';
                    return null;
                  },
                ),
                const SizedBox(height: 32.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: OutlinedButton.styleFrom(
                        backgroundColor: const Color(0xFFFFF1F0),
                        side: const BorderSide(color: Colors.black),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        'Cancelar',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_validarCampos()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CpfScreen(),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 15),
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
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    required String hintText,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      keyboardType: keyboardType,
      validator: validator,
    );
  }
}
