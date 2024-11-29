import 'dart:async';
import 'produto.dart';

class CarrinhoBloc {
  // StreamController com capacidade de transmitir múltiplos ouvintes (broadcast)
  final _carrinhoController = StreamController<List<Produto>>.broadcast();

  // Lista interna de produtos no carrinho
  final List<Produto> _produtos = [];

  // Exposição do Stream para escuta
  Stream<List<Produto>> get carrinhoStream => _carrinhoController.stream;

  /// Adiciona um produto ao carrinho
  void adicionarProduto(Produto produto) {
    _produtos.add(produto);
    _atualizarStream();
  }

  /// Remove um produto específico do carrinho
  void removerProduto(Produto produto) {
    _produtos.remove(produto);
    _atualizarStream();
  }

  /// Limpa todos os produtos do carrinho
  void esvaziarCarrinho() {
    _produtos.clear();
    _atualizarStream();
  }

  /// Calcula o subtotal do carrinho
  double get subtotal =>
      _produtos.fold(0.0, (total, produto) => total + produto.precoTotal);

  /// Fecha o StreamController para evitar vazamento de memória
  void dispose() {
    _carrinhoController.close();
  }

  /// Atualiza a stream com o estado atual do carrinho
  void _atualizarStream() {
    _carrinhoController.sink.add(List.unmodifiable(_produtos));
  }
}
