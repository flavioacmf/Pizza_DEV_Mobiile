class Produto {
  final String id;
  final String nome;
  final double preco;
  final String imagem;
  final String categoria;
  final String tamanho;
  int quantidade;

  Produto({
    required this.id,
    required this.nome,
    required this.preco,
    required this.imagem,
    required this.categoria,
    required this.tamanho,
    this.quantidade = 1,
  });

  // Getter para calcular o preço total com base na quantidade
  double get precoTotal => preco * quantidade;
}
