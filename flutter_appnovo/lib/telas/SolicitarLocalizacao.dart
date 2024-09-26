import 'package:flutter/material.dart';
import 'AddressScreen.dart'; // Importa a AddressScreen

class SolicitarLocalizacao extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.location_on,
                size: 80,
                color: Colors.red,
              ),
              SizedBox(height: 20),
              Text(
                "Precisamos saber a sua localização",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                "Sabendo qual é a sua região, conseguimos oferecer os melhores preços e promoções para você curtir sua pizza em casa.",
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  // Mostra o modal sobrepondo a tela
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled:
                        true, // Para permitir que a altura seja personalizada
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(25.0),
                      ),
                    ),
                    builder: (context) => DraggableScrollableSheet(
                      expand: false,
                      initialChildSize:
                          0.75, // Define o tamanho inicial da sobreposição (75% da tela)
                      minChildSize:
                          0.5, // Tamanho mínimo que pode ser arrastado (50% da tela)
                      maxChildSize:
                          0.9, // Tamanho máximo que pode ser arrastado (90% da tela)
                      builder: (_, controller) => AddressScreen(
                        scrollController: controller,
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                child: Text(
                  'Informar endereço',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
