import 'package:flutter/material.dart';
import 'package:flutter_appnovo/telas/payment_screen.dart'; // Tela de pagamento
import 'package:provider/provider.dart';
import 'cart_provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final double deliveryFee = 10.0; // Taxa de entrega fixa
  String? selectedCoupon; // Cupom selecionado
  final Map<String, double> coupons = {
    'DESCONTO10': 10.0,
    'DESCONTO15': 15.0,
  }; // Exemplos de cupons e valores de desconto

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final subtotal = cartProvider.totalAmount;
    final discount = coupons[selectedCoupon] ?? 0.0;
    final total = subtotal + deliveryFee - discount;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrinho'),
        backgroundColor: Colors.red,
      ),
      body: cartProvider.items.isEmpty
          ? const Center(
              child: Text(
                'Seu carrinho está vazio!',
                style: TextStyle(fontSize: 18),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  // Lista de itens no carrinho
                  Expanded(
                    child: ListView.builder(
                      itemCount: cartProvider.items.length,
                      itemBuilder: (context, index) {
                        final item = cartProvider.items.values.toList()[index];
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 8.0),
                          child: ListTile(
                            leading: CircleAvatar(
                              child: Text('${item.quantity}x'),
                            ),
                            title: Text(item.name),
                            subtitle: Text(
                              'R\$ ${item.price.toStringAsFixed(2)}',
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                cartProvider.removeItem(item.id);
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  // Seleção de cupom
                  DropdownButtonFormField<String>(
                    value: selectedCoupon,
                    hint: const Text('Selecione um cupom'),
                    items: coupons.keys.map((String coupon) {
                      return DropdownMenuItem<String>(
                        value: coupon,
                        child: Text(
                            '$coupon (-R\$ ${coupons[coupon]!.toStringAsFixed(2)})'),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedCoupon = value;
                      });
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Cupom de Desconto',
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Resumo do pedido
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Subtotal: R\$ ${subtotal.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Taxa de Entrega: R\$ ${deliveryFee.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      if (selectedCoupon != null)
                        Text(
                          'Desconto: -R\$ ${discount.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                      const Divider(height: 20, color: Colors.black),
                      Text(
                        'Total: R\$ ${total.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Botão Finalizar Pedido
                  ElevatedButton(
                    onPressed: cartProvider.items.isEmpty
                        ? null
                        : () {
                            // Navega para a tela de pagamento
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PaymentScreen(
                                  totalAmount: total,
                                  onPaymentSuccess: () {
                                    cartProvider.finalizarPedido();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                            'Pagamento realizado! Pedido enviado.'),
                                        backgroundColor: Colors.green,
                                      ),
                                    );
                                    Navigator.pop(
                                        context); // Volta do pagamento
                                  },
                                ),
                              ),
                            );
                          },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: const Text(
                      'Finalizar Pedido',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
