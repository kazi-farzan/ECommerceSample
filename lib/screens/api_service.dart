import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<dynamic>> fetchProducts() async {
    final response = await http.get(Uri.parse('https://dummyjson.com/products'));
    if (response.statusCode == 200) {
      Map<String, dynamic> responseData = jsonDecode(response.body);
      List<dynamic> products = responseData['products']; // Assuming 'products' is the key containing the list
      return products;
    } else {
      throw Exception('Failed to load products');
    }
  }
}

