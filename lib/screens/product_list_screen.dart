import 'package:flutter/material.dart';
import 'api_service.dart';
import 'product_details_screen.dart';

//TODO: Seperate Code functionality

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {

  final List<bool> _isSelected = [true, false, false, false, false];

  void _toggleButton(int index) {
    setState(() {
      for (int i = 0; i < _isSelected.length; i++) {
        _isSelected[i] = i == index;
      }
    });
  }

  Widget _buildIconButton(IconData icon, int index) {
    return IconButton(
      icon: Icon(
        icon,
        color: _isSelected[index] ? const Color(0xFFdb3022) : null, // Toggle color based on selection
      ),
      onPressed: () => _toggleButton(index),
    );
  }


  final ApiService _apiService = ApiService();
  late List<dynamic> products = [];

  Future<void> _fetchData() async {
    try {
      final List<dynamic> response = await _apiService.fetchProducts();
      // ignore: avoid_print
      print(response);
      setState(() {
        products = response;
      });
    } catch (e) {
      // ignore: avoid_print
      print('Failed to fetch products: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: products.map((product) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailsScreen(product: product),
                ),
              );
            },
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        width: 100,
                        height: 100,
                        child: Image.network(
                          product['thumbnail'],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            product['title'],
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                            textAlign: TextAlign.end,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '\$${product['price'].toString()}',
                            textAlign: TextAlign.end,
                            style: const TextStyle(color: Colors.red),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            product['description'],
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
        bottomNavigationBar: BottomAppBar(
          height: 50.0,
          child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildIconButton(Icons.home_outlined, 0),
            _buildIconButton(Icons.shopping_cart_outlined, 1),
            _buildIconButton(Icons.shopping_bag_outlined, 2),
            _buildIconButton(Icons.favorite_border_outlined, 3),
            _buildIconButton(Icons.person_3_outlined, 4),
          ],
        ),)
    );
  }
}
