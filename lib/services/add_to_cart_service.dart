import 'package:http/http.dart' as http;
import 'dart:convert';

class AddToCartService {
  Future<void> addToCart(int productId) async {
    final response = await http.post(
      Uri.parse('https://fakestoreapi.com/carts'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        "userId": 1,
        "date": "2025-02-24",
        "products": [
          {"productId": productId, "quantity": 1}
        ]
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to add product to cart');
    }
  }
}
