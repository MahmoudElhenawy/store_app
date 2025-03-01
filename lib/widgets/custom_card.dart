import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/screens/update_product_page.dart';
import '../services/cart_provider.dart';

class CustomCard extends StatelessWidget {
  final ProductModel product;

  const CustomCard({
    Key? key,
    required this.product,
    required Null Function() onAddToCart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, UpdateProductPage.id, arguments: product);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 130,
            width: 220,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 40,
                  color: Colors.grey.withOpacity(.2),
                  offset: Offset(10, 10),
                ),
              ],
            ),
            child: Card(
              elevation: 10,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title.substring(0, 6),
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          r'$' '${product.price.toString()}',
                          style: TextStyle(fontSize: 16),
                        ),
                        // ✅ إضافة المنتج عند الضغط على القلب
                        IconButton(
                          icon: Icon(Icons.favorite, color: Colors.red),
                          onPressed: () {
                            Provider.of<CartProvider>(context, listen: false)
                                .addToCart(product);

                            // ✅ إظهار نافذة منبثقة (AlertDialog)
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text(
                                  'تمت الإضافة 🛒',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                content: Text(
                                  '${product.title} تمت إضافته للسلة بنجاح!',
                                  textAlign: TextAlign.center,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      'حسناً',
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: 15,
            top: -60,
            child: Image.network(
              product.image,
              height: 100,
              width: 100,
            ),
          ),
        ],
      ),
    );
  }
}
