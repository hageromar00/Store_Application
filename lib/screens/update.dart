import 'package:flutter/material.dart';
import 'package:store_application/widget/customButton.dart';
import 'package:store_application/widget/customFieldText.dart';

class UpdatePage extends StatelessWidget {
  const UpdatePage({super.key});
  static String Id = 'update';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Update Product',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.grey,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          CustomFieldText(text: 'Product', onChag: (data) {}),
          CustomFieldText(text: 'Decribtion', onChag: (data) {}),
          CustomFieldText(text: 'Price', onChag: (data) {}),
          CustomFieldText(text: 'image', onChag: (data) {}),
          CustomButton(
            ontap: () {},
            text: 'UPDATE',
          ),
        ],
      ),
    );
  }
}
