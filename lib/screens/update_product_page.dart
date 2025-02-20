import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/updat_product.dart';
import 'package:store_app/widgets/custom_botton.dart';
import 'package:store_app/widgets/custom_text_filed.dart';

class UpdateProductPage extends StatefulWidget {
  UpdateProductPage({super.key});

  static String id = 'update product';

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? ProductName, description, image;
  String? price;
  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isloading,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Update Product'),
          centerTitle: true,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                customTextFiled(
                  onChanged: (data) {
                    ProductName = data;
                  },
                  hintText: 'Product Name',
                ),
                SizedBox(
                  height: 15,
                ),
                customTextFiled(
                  onChanged: (data) {
                    description = data;
                  },
                  hintText: 'Description',
                ),
                SizedBox(
                  height: 15,
                ),
                customTextFiled(
                  onChanged: (data) {
                    price = data;
                  },
                  hintText: 'Price',
                  inputType: TextInputType.number,
                ),
                SizedBox(
                  height: 15,
                ),
                customTextFiled(
                  onChanged: (data) {
                    image = data;
                  },
                  hintText: 'Image',
                ),
                SizedBox(
                  height: 40,
                ),
                customButton(
                  text: 'Update',
                  onTap: () async {
                    setState(() {
                      isloading = true;
                    });

                    try {
                      await updatProduct(product);
                      // إظهار رسالة نجاح
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text(
                                'The product has been updated successfully')),
                      );
                    } catch (e) {
                      // إظهار رسالة خطأ
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content:
                                Text('An error occurred: ${e.toString()}')),
                      );
                    } finally {
                      setState(() {
                        isloading = false;
                      });
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updatProduct(ProductModel product) async {
    await UpdatProduct().updatProduct(
      id: product.id,
      title: ProductName ?? product.title,
      price: price ?? product.price.toString(), // تأكد أن السعر يظل String
      description: description ?? product.description,
      image: image ?? product.image,
      category: product.category,
    );
  }
}
