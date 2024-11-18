class Validators {
  // Validação de e-mail
  static bool isValidEmail(String email) {
    final regex = RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
    return regex.hasMatch(email);
  }

  // Validação de CPF (simples)
  static bool isValidCPF(String cpf) {
    final regex = RegExp(r'^\d{3}\.\d{3}\.\d{3}\-\d{2}$');
    return regex.hasMatch(cpf);
  }

  // Validação de senha (mínimo de 8 caracteres, uma maiúscula, uma minúscula, um número e um caractere especial)
  static bool isValidPassword(String password) {
    final regex = RegExp(
        r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$');
    return regex.hasMatch(password);
  }

  // Validação de número de telefone (formato brasileiro)
  static bool isValidPhoneNumber(String phoneNumber) {
    final regex = RegExp(r'^\(\d{2}\) \d{4,5}\-\d{4}$');
    return regex.hasMatch(phoneNumber);
  }
}
