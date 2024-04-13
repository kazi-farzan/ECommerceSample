import 'package:flutter/material.dart';

class ProductListScreen extends StatelessWidget {
  final List<dynamic> products;

  const ProductListScreen({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Image.network(
              products[index]['thumbnail'],
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
            title: Text(products[index]['title']),
            subtitle: Text(products[index]['description']),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailsScreen(product: products[index]),
                ),
              );
            },
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shop),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Bag',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Colors.blue, // Change the color as needed
        unselectedItemColor: Colors.grey, // Change the color as needed
      ),
    );
  }
}

class ProductDetailsScreen extends StatelessWidget {
  final dynamic product;

  const ProductDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name: ${product['title']}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            product['images'] != null && product['images'].isNotEmpty
                ? Image.network(
              product['images'][0],
              width: MediaQuery.of(context).size.width,
              height: 200,
              fit: BoxFit.cover,
            )
                : const SizedBox(),
            const SizedBox(height: 8),
            Text('Price: \$${product['price']}'),
            const SizedBox(height: 8),
            Text('Description: ${product['description']}'),
          ],
        ),
      ),
    );
  }
}
