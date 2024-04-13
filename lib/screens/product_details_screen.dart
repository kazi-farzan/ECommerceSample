import 'package:flutter/material.dart';
import 'package:ghibli_shop/services/product_image_widget.dart';
import 'package:ghibli_shop/services/product_content_details.dart';

class ProductDetailsScreen extends StatelessWidget {
  final dynamic product;

  const ProductDetailsScreen({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {
              // Add your share functionality here
            },
          ),
        ],
        centerTitle: true, // Center the title
      ),
      body: Column(
        children: [
          Expanded(
            flex: 8,
            child: ProductImageWidget(imageUrls: product['images'] ?? []),
          ), // If no images, display nothing
          // SizedBox(height: 8),
          Expanded(
            flex: 5,
            child: ProductContentDetails(product: product),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0), // Adjust border radius as needed
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5), // Shadow color
                  spreadRadius: 3, // Spread radius
                  blurRadius: 5, // Blur radius
                  offset: Offset(0, 2), // Shadow offset
                ),
              ],
            ),
            padding: const EdgeInsets.fromLTRB(16.0, 16.0,16.0, 8.0), // Adjust vertical padding as needed
            child: TextButton(
              onPressed: () {
                // Add to cart functionality
              },
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(const Size(double.infinity, 60.0)),
                backgroundColor: MaterialStateProperty.all(const Color(0xFFdb3022)),
              ),
              child: const Text('ADD TO CART', style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}



//TODO: Try to add this button on top of Images
// IconButton(
// icon: Icon(Icons.favorite_border),
// onPressed: () {
// // Add your like functionality here
// },
// ),


