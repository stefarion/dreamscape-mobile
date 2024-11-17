import 'package:flutter/material.dart';
import 'package:dreamscape_mobile/models/product_entry.dart';

class ProductDetails extends StatelessWidget {
  final Fields item;

  const ProductDetails({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
              'Product Details',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.name,
              style: const TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Category: ${item.category}",
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 10),
            Text(
              "Price: Rp${item.price}",
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 10),
            Text(
              "Description: \n${item.description}",
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
                child: const Text(
                'Back to Product List',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}