import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/updat_product.dart';

class UpdateProductPage extends StatelessWidget {
  static String id = 'update_product';

  final ProductModel product;

  const UpdateProductPage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Update Product')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Center(
              child: Image.network(
                product.image,
                height: 150,
                width: 150,
              ),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Product Name',
                border: OutlineInputBorder(),
              ),
              controller: TextEditingController(text: product.title),
            ),
            SizedBox(height: 15),
            TextField(
              decoration: InputDecoration(
                labelText: 'Price',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              controller: TextEditingController(text: product.price.toString()),
            ),
            SizedBox(height: 15),
            TextField(
              decoration: InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(),
              ),
              controller: TextEditingController(text: product.description),
              maxLines: 3,
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text(
                        'Update Successful 🎉',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      content: Text(
                        'The product has been updated successfully!',
                        textAlign: TextAlign.center,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.pop(context, UpdatProduct);
                          },
                          child: Text(
                            'OK',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                child: Text('Update Product'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
