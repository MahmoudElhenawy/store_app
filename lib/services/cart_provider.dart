import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';

class CartProvider extends ChangeNotifier {
  final List<ProductModel> _cartItems = [];

  List<ProductModel> get cartItems => _cartItems;
  int get cartCount => _cartItems.length;

  void addToCart(ProductModel product) {
    // ✅ لازم يستقبل المنتج
    _cartItems.add(product);
    notifyListeners();
  }

  void removeFromCart(ProductModel product) {
    _cartItems.remove(product);
    notifyListeners();
  }
}
