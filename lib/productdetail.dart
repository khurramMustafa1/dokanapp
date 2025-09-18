import 'package:flutter/material.dart';
import '../midel/productlistmodel.dart';

class ProductDetailsPage extends StatelessWidget {
  final Product product;

  const ProductDetailsPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.name ?? "Product")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            product.image != null
                ? Image.network(product.image!, height: 200)
                : const Icon(Icons.image, size: 200),
            const SizedBox(height: 20),
            Text(product.name ?? "No name",
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text("Price: Rs. ${product.price ?? 0}"),
            const SizedBox(height: 10),
            Text(product.description ?? "No description available"),
          ],
        ),
      ),
    );
  }
}
