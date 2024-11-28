import 'package:flutter/material.dart';
import 'package:flutter_appnovo/telas/cadastro_screen.dart';
import 'package:geolocator/geolocator.dart';

class TelaLocalizacao extends StatefulWidget {
  const TelaLocalizacao({super.key});

  @override
  TelaLocalizacaoState createState() => TelaLocalizacaoState();
}

class TelaLocalizacaoState extends State<TelaLocalizacao> {
  String _localizacao = 'Localização desconhecida';

  Future<void> _obterPermissaoLocalizacao() async {
    setState(() {
      _localizacao = 'Obtendo sua localização...'; // Feedback visual inicial
    });

    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        setState(() {
          _localizacao = 'Serviço de localização desativado';
        });
        _navegarParaTelaCadastro();
        return;
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          setState(() {
            _localizacao = 'Permissão de localização negada';
          });
          _navegarParaTelaCadastro();
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        setState(() {
          _localizacao = 'Permissão de localização permanentemente negada';
        });
        _navegarParaTelaCadastro();
        return;
      }

      Position position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
        ),
      );

      setState(() {
        _localizacao =
            'Localização obtida:\nLat: ${position.latitude}, Long: ${position.longitude}';
      });
    } catch (e) {
      setState(() {
        _localizacao = 'Erro ao obter localização: $e';
      });
    }

    // Após obter ou falhar na localização, navega para o cadastro
    _navegarParaTelaCadastro();
  }

  // Função para navegar para a tela de cadastro
  void _navegarParaTelaCadastro() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const CadastroScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF1F0),
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Etapa 2/3'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'lib/assets/location_icon.png', // Ícone da localização
              height: 200,
            ),
            const SizedBox(height: 30),
            const Text(
              'Agora, deixa a gente acessar sua localização?',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            const Text(
              'É que, sabendo qual a sua região, conseguimos oferecer os melhores preços e promoções para você curtir sua pizza em casa.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 60),
            ElevatedButton(
              onPressed:
                  _obterPermissaoLocalizacao, // Chama a função ao clicar no botão
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding:
                    const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text(
                'Continuar',
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 20),
            // Exibe a localização ou a mensagem de erro
            Text(
              _localizacao,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
