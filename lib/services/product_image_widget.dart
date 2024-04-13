// widgets/product_image_widget.dart
import 'package:flutter/material.dart';

class ProductImageWidget extends StatelessWidget {
  final List<dynamic> imageUrls; // Change the type to List<dynamic>

  const ProductImageWidget({Key? key, required this.imageUrls}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Explicitly cast imageUrls to List<String>
    final List<String> urls = List<String>.from(imageUrls.map((dynamic url) => url.toString()));

    return urls.isNotEmpty
        ? ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: urls.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.network(
            urls[index],
            width: MediaQuery.of(context).size.width,
            height: 200,
            fit: BoxFit.cover,
          ),
        );
      },
    )
        : const SizedBox();
  }
}
