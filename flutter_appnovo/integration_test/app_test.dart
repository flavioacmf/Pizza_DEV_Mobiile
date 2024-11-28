import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:./lib/main.dart'; // Ajuste o caminho para seu widget principal.

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Teste de botão de incremento', (WidgetTester tester) async {
    // Certifique-se de que o widget principal do app é inicializado corretamente.
    await tester.pumpWidget(const PizzaDevApp()
        as Widget); // Substitua pelo nome correto do seu widget.

    // Localize o botão de incremento e interaja com ele.
    final Finder incrementButton = find.byIcon(Icons.add);
    await tester.tap(incrementButton);

    // Rebuild o widget após a interação.
    await tester.pump();

    // Verifique se o estado mudou.
    expect(find.text('1'), findsOneWidget);
  });
}

class PizzaDevApp {
  const PizzaDevApp();
}
