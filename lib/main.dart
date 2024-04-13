import 'package:flutter/material.dart';
import 'screens/product_list_screen.dart';
//TODO: Add a Loading Screen
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Lato', // Set Lato as the default font
      ),
      home: const ProductListScreen(), // Pass the list of products
    );
  }
}
