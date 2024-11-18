import 'package:flutter/material.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pagamento')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Detalhes do pedido e endereço aqui'),
            ElevatedButton(
              onPressed: () {
                // Lógica de pagamento
              },
              child: const Text('Realizar pedido'),
            ),
          ],
        ),
      ),
    );
  }
}
