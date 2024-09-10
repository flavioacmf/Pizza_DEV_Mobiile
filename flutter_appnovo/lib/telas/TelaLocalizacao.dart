import 'package:flutter/material.dart';
import 'package:flutter_appnovo/telas/CadastroScreen.dart';
import 'package:geolocator/geolocator.dart';

class TelaLocalizacao extends StatefulWidget {
  @override
  _TelaLocalizacaoState createState() => _TelaLocalizacaoState();
}

class _TelaLocalizacaoState extends State<TelaLocalizacao> {
  String _localizacao = 'Localização desconhecida';

  Future<void> _obterPermissaoLocalizacao() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Verifica se o serviço de localização está habilitado
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // O serviço de localização não está habilitado
      setState(() {
        _localizacao = 'Serviço de localização desativado';
      });
      _navegarParaTelaCadastro();
      return;
    }

    // Verifica o status da permissão de localização
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissão negada
        setState(() {
          _localizacao = 'Permissão de localização negada';
        });
        _navegarParaTelaCadastro();
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissão permanentemente negada
      setState(() {
        _localizacao = 'Permissão de localização permanentemente negada';
      });
      _navegarParaTelaCadastro();
      return;
    }

    // Se a permissão foi concedida, obtemos a localização
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      _localizacao =
          'Localização obtida: Lat ${position.latitude}, Long ${position.longitude}';
    });

    // Após obter a localização, navega para a tela de cadastro
    _navegarParaTelaCadastro();
  }

  // Função para navegar para a tela de cadastro
  void _navegarParaTelaCadastro() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CadastroScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF1F0),
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Etapa 2/3'),
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
            SizedBox(height: 30),
            Text(
              'Agora, deixa a gente acessar sua localização?',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            Text(
              'É que, sabendo qual a sua região, conseguimos oferecer os melhores preços e promoções para você curtir sua pizza em casa.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 60),
            ElevatedButton(
              onPressed: _obterPermissaoLocalizacao, // Chama a função ao clicar no botão
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                'Continuar',
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(height: 20),
            // Exibe a localização ou a mensagem de erro
            Text(
              _localizacao,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}

