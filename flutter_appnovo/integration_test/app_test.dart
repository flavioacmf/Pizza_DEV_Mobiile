import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appnovo/main.dart'; // Caminho correto para o arquivo main.dart do seu projeto

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Teste de botão de incremento', (WidgetTester tester) async {
    // Carregar o aplicativo.
    await tester.pumpWidget(const PizzaDevApp()); // Adicione o 'const' aqui


    // Verificar se o valor inicial é 0.
    expect(find.text('0'), findsOneWidget);

    // Simular um clique no botão de incremento.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verificar se o valor foi incrementado.
    expect(find.text('1'), findsOneWidget);
  });
}
