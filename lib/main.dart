import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple List App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const ItemListPage(),
    );
  }
}

class ItemListPage extends StatelessWidget {
  const ItemListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Item List'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: sampleItems.length,
        itemBuilder: (context, index) {
          final item = sampleItems[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            elevation: 2,
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  item.imageUrl,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.image_not_supported,
                        color: Colors.grey,
                      ),
                    );
                  },
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Center(child: CircularProgressIndicator()),
                    );
                  },
                ),
              ),
              title: Text(
                item.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              subtitle: Text(
                item.description,
                style: TextStyle(color: Colors.grey[600], fontSize: 14),
              ),
              trailing: Text(
                '\$${item.price}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.green,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class Item {
  final String title;
  final String description;
  final String imageUrl;
  final double price;

  const Item({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.price,
  });
}

final List<Item> sampleItems = [
  const Item(
    title: 'Laptop',
    description: 'High-performance laptop with latest specs',
    imageUrl: 'https://picsum.photos/200/200?random=1',
    price: 999.99,
  ),
  const Item(
    title: 'Smartphone',
    description: 'Latest smartphone with advanced camera',
    imageUrl: 'https://picsum.photos/200/200?random=2',
    price: 699.99,
  ),
  const Item(
    title: 'Headphones',
    description: 'Wireless noise-canceling headphones',
    imageUrl: 'https://picsum.photos/200/200?random=3',
    price: 199.99,
  ),
  const Item(
    title: 'Tablet',
    description: '10-inch tablet perfect for work and entertainment',
    imageUrl: 'https://picsum.photos/200/200?random=4',
    price: 449.99,
  ),
  const Item(
    title: 'Smartwatch',
    description: 'Fitness tracking smartwatch with health monitoring',
    imageUrl: 'https://picsum.photos/200/200?random=5',
    price: 299.99,
  ),
  const Item(
    title: 'Camera',
    description: 'Professional DSLR camera for photography enthusiasts',
    imageUrl: 'https://picsum.photos/200/200?random=6',
    price: 1299.99,
  ),
  const Item(
    title: 'Gaming Console',
    description: 'Next-gen gaming console for immersive gameplay',
    imageUrl: 'https://picsum.photos/200/200?random=7',
    price: 499.99,
  ),
  const Item(
    title: 'Wireless Speaker',
    description: 'Portable Bluetooth speaker with premium sound',
    imageUrl: 'https://picsum.photos/200/200?random=8',
    price: 149.99,
  ),
];
