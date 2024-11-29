import 'package:flutter/material.dart';

class ItemDetailsScreen extends StatefulWidget {
  final String itemName;
  final String imagePath;
  final String price;
  final List<String> ingredients;
  final String category; // Categoria do item (bebida, sobremesa, pizza, etc.)

  const ItemDetailsScreen({
    super.key,
    required this.itemName,
    required this.imagePath,
    required this.price,
    required this.ingredients,
    required this.category,
  });

  @override
  // ignore: library_private_types_in_public_api
  _ItemDetailsScreenState createState() => _ItemDetailsScreenState();
}

class _ItemDetailsScreenState extends State<ItemDetailsScreen> {
  int selectedSizeIndex = 0; // Controla o tamanho selecionado
  int quantity = 1; // Quantidade inicial do item

  // Mapear tamanhos com base na categoria
  late List<Map<String, dynamic>> sizes;

  @override
  void initState() {
    super.initState();
    sizes = _getSizesForCategory(widget.category, widget.itemName);
  }

  List<Map<String, dynamic>> _getSizesForCategory(
      String category, String itemName) {
    if (category == 'bebida') {
      if (itemName == 'Coca-Cola') {
        return [
          {'label': 'Lata (350ml)', 'price': 4.99},
          {'label': '600ml', 'price': 6.99},
          {'label': '1L', 'price': 9.99},
          {'label': '2L', 'price': 12.99},
        ];
      } else if (itemName == 'Suco de Laranja') {
        return [
          {'label': '500ml', 'price': 7.99},
          {'label': '1L', 'price': 12.99},
        ];
      }
    } else if (category == 'brotinho' || category == 'sobremesa') {
      // Apenas quantidade, sem tamanhos
      return [];
    } else {
      // Pizzas grandes e outros itens com tamanhos
      return [
        {'label': 'Pizza Individual (4 fatias)', 'price': 37.99},
        {'label': 'Pizza Média (8 fatias)', 'price': 76.90},
        {'label': 'Pizza Grande (12 fatias)', 'price': 115.79},
        {'label': 'Pizza Tamanho Família (16 fatias)', 'price': 159.95},
      ];
    }
    return [];
  }

  double get subtotal {
    if (sizes.isNotEmpty) {
      return sizes[selectedSizeIndex]['price'] * quantity;
    }
    return double.parse(widget.price) * quantity;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.itemName),
        backgroundColor: Colors.red,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imagem do item
            Center(
              child: Image.asset(
                widget.imagePath,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            // Nome do item
            Text(
              widget.itemName,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            // Descrição do item
            Text(
              "Ingredientes: ${widget.ingredients.join(', ')}",
              style: const TextStyle(fontSize: 16, color: Colors.black54),
            ),
            const SizedBox(height: 10),
            // Preço inicial (se aplicável)
            if (sizes.isNotEmpty)
              Text(
                "A partir de R\$ ${sizes.first['price'].toStringAsFixed(2)}",
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
            const SizedBox(height: 20),
            // Se o item tiver tamanhos
            if (sizes.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Text(
                        "Selecione o tamanho:",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Text(
                        "Obrigatório",
                        style: TextStyle(fontSize: 12, color: Colors.red),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: sizes.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedSizeIndex = index;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 4),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: selectedSizeIndex == index
                                  ? Colors.red
                                  : Colors.grey.shade300,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                sizes[index]['label'],
                                style: const TextStyle(fontSize: 16),
                              ),
                              Text(
                                "R\$ ${sizes[index]['price'].toStringAsFixed(2)}",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: selectedSizeIndex == index
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            // Botões de quantidade
            Row(
              children: [
                IconButton(
                  onPressed: quantity > 1
                      ? () {
                          setState(() {
                            quantity--;
                          });
                        }
                      : null,
                  icon: const Icon(Icons.remove_circle_outline),
                  color: Colors.red,
                ),
                Text(
                  quantity.toString(),
                  style: const TextStyle(fontSize: 16),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      quantity++;
                    });
                  },
                  icon: const Icon(Icons.add_circle_outline),
                  color: Colors.red,
                ),
                const Spacer(),
                Text(
                  "Subtotal: R\$ ${subtotal.toStringAsFixed(2)}",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Botão Adicionar
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                          "${widget.itemName} adicionado ao carrinho! Quantidade: $quantity"),
                      backgroundColor: Colors.green,
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  "Adicionar",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
