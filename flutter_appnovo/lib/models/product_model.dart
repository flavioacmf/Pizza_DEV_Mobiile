class Product {
  final int id;
  final String name;
  final String description;
  final double price;
  final String category; // pizza, bebida, doce
  final bool available;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.category,
    this.available = true,
  });

  // Construtor para criar a partir de JSON
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['produto_id'],
      name: json['nome'],
      description: json['descricao'],
      price: json['preco'],
      category: json['categoria'],
      available: json['disponivel'] ?? true,
    );
  }

  // Converte para JSON
  Map<String, dynamic> toJson() {
    return {
      'produto_id': id,
      'nome': name,
      'descricao': description,
      'preco': price,
      'categoria': category,
      'disponivel': available,
    };
  }
}
