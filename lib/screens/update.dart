import 'package:flutter/material.dart';
import 'package:store_application/widget/customButton.dart';
import 'package:store_application/widget/customFieldText.dart';

class UpdatePage extends StatefulWidget {
  const UpdatePage({super.key});
  static String Id = 'update';

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  String? prodName, image, price, desc;
  bool isLoad = false;
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
          CustomFieldText(
              text: 'Product',
              onChag: (data) {
                prodName = data;
              }),
          CustomFieldText(
              text: 'Decribtion',
              onChag: (data) {
                desc = data;
              }),
          CustomFieldText(
              text: 'Price',
              type: TextInputType.number,
              onChag: (data) {
                price = data;
              }),
          CustomFieldText(
              text: 'image',
              onChag: (data) {
                image = data;
              }),
          CustomButton(
            ontap: () {},
            text: 'UPDATE',
          ),
        ],
      ),
    );
  }
}
