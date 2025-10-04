import 'package:flutter/material.dart';

class ProductGalleryScreen extends StatelessWidget {
  const ProductGalleryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 🔹 Sample Product Data
    final List<Map<String, dynamic>> products = [
      {
        "title": "Wireless Headphones",
        "price": 59.99,
        "image": "https://cdn-icons-png.flaticon.com/512/3197/3197968.png",
      },
      {
        "title": "Smart Watch",
        "price": 99.99,
        "image": "https://cdn-icons-png.flaticon.com/512/808/808439.png",
      },
      {
        "title": "Bluetooth Speaker",
        "price": 39.99,
        "image": "https://cdn-icons-png.flaticon.com/512/747/747976.png",
      },
      {
        "title": "Laptop Stand",
        "price": 24.99,
        "image": "https://cdn-icons-png.flaticon.com/512/993/993928.png",
      },
      {
        "title": "Wireless Mouse",
        "price": 14.99,
        "image": "https://cdn-icons-png.flaticon.com/512/1170/1170678.png",
      },
      {
        "title": "Mechanical Keyboard",
        "price": 89.99,
        "image": "https://cdn-icons-png.flaticon.com/512/1216/1216890.png",
      },
      {
        "title": "VR Headset",
        "price": 149.99,
        "image": "https://cdn-icons-png.flaticon.com/512/2820/2820469.png",
      },
      {
        "title": "Gaming Controller",
        "price": 49.99,
        "image": "https://cdn-icons-png.flaticon.com/512/833/833314.png",
      },
    ];

    // 🔹 Determine grid columns based on screen width
    final double width = MediaQuery.of(context).size.width;
    int crossAxisCount = width < 600
        ? 2
        : width < 900
        ? 3
        : 4;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Responsive Product Gallery 🧩"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          itemCount: products.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.75,
          ),
          itemBuilder: (context, index) {
            final product = products[index];
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // 🔹 Product Image
                    Expanded(
                      child: Image.network(
                        product["image"],
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(height: 8),

                    // 🔹 Title
                    Text(
                      product["title"],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(height: 4),

                    // 🔹 Price
                    Text(
                      "\$${product["price"].toStringAsFixed(2)}",
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    // 🔹 Add to Cart Button
                    ElevatedButton.icon(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              "${product["title"]} added to cart!",
                            ),
                            duration: const Duration(seconds: 1),
                          ),
                        );
                      },
                      icon: const Icon(Icons.add_shopping_cart),
                      label: const Text("Add to Cart"),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 36),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
