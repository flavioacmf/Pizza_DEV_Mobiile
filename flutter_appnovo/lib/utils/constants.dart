import 'package:flutter/material.dart';

class AppConstants {
  // Cores principais
  static const Color primaryColor = Colors.red;
  static const Color secondaryColor = Color(0xFFFFF1F0); // Rosa claro do fundo

  // URL base para APIs
  static const String baseUrl = 'https://api.seuapp.com/';

  // Mensagens padrão
  static const String welcomeMessage = 'Hey, que bom ter você aqui!';
  static const String welcomeDescription =
      'Aqui no app da Pizza Dev, você aproveita nossos produtos e promoções exclusivas.';

  // Outros
  static const double buttonPadding = 20.0;
  static const int maxLoginAttempts = 3;
}
