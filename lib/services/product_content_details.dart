import 'package:flutter/material.dart';
import 'package:ghibli_shop/constants.dart';
class ProductContentDetails extends StatelessWidget {
  const ProductContentDetails({
    super.key,
    required this.product,
  });

  final product;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 5,
                child: Text(
                  '${product['title']}',
                  style: kTitleTextStyle,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,

                ),
              ),
              Expanded(
                  flex: 2,
                  child: Text('\$${product['price']}',style: kTitleTextStyle,)),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text('Description: ${product['description']}'),
        ),
      ],
    );
  }
}