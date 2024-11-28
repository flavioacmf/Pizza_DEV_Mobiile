import 'package:flutter/material.dart';
import 'address_screen.dart'; // Importa a AddressScreen

class SolicitarLocalizacao extends StatelessWidget {
  const SolicitarLocalizacao({super.key});

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
              const Icon(
                Icons.location_on,
                size: 80,
                color: Colors.red,
              ),
              const SizedBox(height: 20),
              const Text(
                "Precisamos saber a sua localização",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              const Text(
                "Sabendo qual é a sua região, conseguimos oferecer os melhores preços e promoções para você curtir sua pizza em casa.",
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  // Mostra o modal sobrepondo a tela
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(25.0),
                      ),
                    ),
                    builder: (context) {
                      return Stack(
                        children: [
                          DraggableScrollableSheet(
                            expand: false,
                            initialChildSize: 0.75,
                            minChildSize: 0.5,
                            maxChildSize: 0.9,
                            builder: (_, controller) => AddressScreen(
                              scrollController: controller,
                            ),
                          ),
                          const Positioned(
                            top: 10,
                            right: 10,
                            child: CloseButton(), // Adiciona botão "Fechar"
                          ),
                        ],
                      );
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                child: const Text(
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
