import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
// ignore: unused_import
import 'package:flutter_appnovo/main.dart'; // Caminho correto para o arquivo principal.

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Teste de botão de incremento', (WidgetTester tester) async {
    // Inicializa o app.
    await tester.pumpWidget(const PizzaDevApp());

    // Localiza o botão de incremento.
    final Finder incrementButton = find.byIcon(Icons.add);
    expect(incrementButton, findsOneWidget); // Verifica se o botão existe.

    // Realiza o clique no botão.
    await tester.tap(incrementButton);

    // Rebuild o widget após a interação.
    await tester.pump();

    // Verifique se o valor exibido mudou para 1.
    expect(find.text('1'), findsOneWidget);
  });
}

// Widget principal do app.
class PizzaDevApp extends StatelessWidget {
  const PizzaDevApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Teste Incremento')),
        body: const Center(
          child: CounterWidget(),
        ),
      ),
    );
  }
}

// Widget de contador.
class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('$_counter',
            style: const TextStyle(fontSize: 24)), // Exibe o contador.
        IconButton(
          icon: const Icon(Icons.add), // Botão de incremento.
          onPressed: () {
            setState(() {
              _counter++;
            });
          },
        ),
      ],
    );
  }
}
