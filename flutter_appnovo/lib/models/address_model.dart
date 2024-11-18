class Address {
  final String street;
  final String neighborhood;
  final String zipCode;
  final String city;
  final String state;

  Address({
    required this.street,
    required this.neighborhood,
    required this.zipCode,
    required this.city,
    required this.state,
  });

  // Construtor para criação a partir de JSON
  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      street: json['logradouro'] ?? '',
      neighborhood: json['bairro'] ?? '',
      zipCode: json['cep'] ?? '',
      city: json['localidade'] ?? '',
      state: json['uf'] ?? '',
    );
  }

  // Converte para JSON
  Map<String, dynamic> toJson() {
    return {
      'street': street,
      'neighborhood': neighborhood,
      'zipCode': zipCode,
      'city': city,
      'state': state,
    };
  }

  // Cria uma cópia do endereço com possíveis alterações
  Address copyWith({
    String? street,
    String? neighborhood,
    String? zipCode,
    String? city,
    String? state,
  }) {
    return Address(
      street: street ?? this.street,
      neighborhood: neighborhood ?? this.neighborhood,
      zipCode: zipCode ?? this.zipCode,
      city: city ?? this.city,
      state: state ?? this.state,
    );
  }
}
