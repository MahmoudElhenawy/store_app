import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/services/cart_provider.dart';

class CartPage extends StatelessWidget {
  static String id = 'CartPage';

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '🛒 cart',
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: cartProvider.cartItems.isEmpty
          ? Center(
              child: Text(
              ' The cart is currently empty!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ))
          : ListView.builder(
              itemCount: cartProvider.cartItems.length,
              itemBuilder: (context, index) {
                final product = cartProvider.cartItems[index];
                return ListTile(
                  leading: Image.network(product.image, width: 50, height: 50),
                  title: Text(product.title),
                  subtitle: Text('\$${product.price.toString()}'),
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      cartProvider.removeFromCart(product);
                    },
                  ),
                );
              },
            ),
    );
  }
}
