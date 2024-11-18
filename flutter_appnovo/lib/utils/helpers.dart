class Helpers {
  // Função para formatar CPF
  static String formatCPF(String cpf) {
    if (cpf.length == 11) {
      return '${cpf.substring(0, 3)}.${cpf.substring(3, 6)}.${cpf.substring(6, 9)}-${cpf.substring(9)}';
    }
    return cpf;
  }

  // Função para formatar número de telefone
  static String formatPhoneNumber(String phoneNumber) {
    if (phoneNumber.length == 11) {
      return '(${phoneNumber.substring(0, 2)}) ${phoneNumber.substring(2, 7)}-${phoneNumber.substring(7)}';
    } else if (phoneNumber.length == 10) {
      return '(${phoneNumber.substring(0, 2)}) ${phoneNumber.substring(2, 6)}-${phoneNumber.substring(6)}';
    }
    return phoneNumber;
  }

  // Função para formatar uma data para exibição
  static String formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
  }

  // Função para converter uma string para DateTime
  static DateTime parseDate(String date) {
    final parts = date.split('/');
    return DateTime(
      int.parse(parts[2]),
      int.parse(parts[1]),
      int.parse(parts[0]),
    );
  }

  // Função para arredondar valores monetários
  static double roundToTwoDecimals(double value) {
    return double.parse(value.toStringAsFixed(2));
  }
}
