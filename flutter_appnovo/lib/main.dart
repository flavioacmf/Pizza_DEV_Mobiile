import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import "package:supabase_flutter/supabase_flutter.dart";
import 'package:flutter_appnovo/views/welcome_page.dart'; // Importa a tela de boas-vindas

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Inicialize o Supabase com a URL e a chave anônima
  await Supabase.initialize(
    url:
        'https://nxfmynfqofjjrrkmovwp.supabase.co', // Substitua pela URL do seu projeto Supabase
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im54Zm15bmZxb2ZqanJya21vdndwIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzE0OTgzNDYsImV4cCI6MjA0NzA3NDM0Nn0.ikEAazHzpb1dwmYeYUEfcZ76N4tU9m-9TQ2uOhXHua4', // Substitua pela chave anônima do seu projeto Supabase
  );

  runApp(const PizzaDevApp());
}

class PizzaDevApp extends StatelessWidget {
  const PizzaDevApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pizza Dev App',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: WelcomePage(),
    );
  }
}
