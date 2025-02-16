import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_application/model/category.dart';
import 'package:store_application/service/post_product.dart';
import 'package:store_application/widget/customButton.dart';
import 'package:store_application/widget/customFieldText.dart';
class AddPage extends StatefulWidget {
  const AddPage({super.key});
  static String id = 'AddPage';

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  String? prodName, image, price, desc, category;
  bool isLoad = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoad,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: const Text(
            'Add Product',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 10),
              CustomTextField(
                text: 'Product',
                onchang: (data) => prodName = data,
              ),
              CustomTextField(
                text: 'Price',
                type: TextInputType.number,
                onchang: (data) => price = data,
              ),
              CustomTextField(
                text: 'Image URL',
                onchang: (data) => image = data,
              ),
              CustomTextField(
                text: 'Description',
                onchang: (data) => desc = data,
              ),
              CustomTextField(
                text: 'Category',
                onchang: (data) => category = data,
              ),
              const SizedBox(height: 40),
              CustomButton(
                text: 'ADD',
                ontap: () async {
                  setState(() => isLoad = true);

                  try {
                    ProductModel newProduct =
                        await PostProductServices().postProduct(
                      title: prodName!,
                      price: price!,
                      desc: desc!,
                      image: image!,
                      category: category!,
                      id: DateTime.now().millisecondsSinceEpoch, // ID مؤقت
                    );

                    Navigator.pop(context, newProduct);
                  } catch (e) {
                    print('Error: $e');
                  }

                  setState(() => isLoad = false);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
