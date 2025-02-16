import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_application/model/category.dart';
import 'package:store_application/service/update_product.dart';
import 'package:store_application/widget/customButton.dart';
import 'package:store_application/widget/customFieldText.dart';class UpdatePage extends StatefulWidget {
  const UpdatePage({super.key});
  static String id = 'update';
  @override
  State<UpdatePage> createState() => _UpdatePageState();
}
class _UpdatePageState extends State<UpdatePage> {
  String? prodName, image, price, desc;
  bool isLoad = false;
  @override
  Widget build(BuildContext context) {
    ProductModel prod =
        ModalRoute.of(context)!.settings.arguments as ProductModel;

    return ModalProgressHUD(
      inAsyncCall: isLoad,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: const Text(
            'Update Product',
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
                initialValue: prod.title, // عرض القيمة الحالية
                onchang: (data) {
                  prodName = data;
                },
              ),
              CustomTextField(
                text: 'Price',
                type: TextInputType.number,
                initialValue: prod.price.toString(),
                onchang: (data) {
                  price = data;
                },
              ),
              CustomTextField(
                text: 'Image URL',
                initialValue: prod.image,
                onchang: (data) {
                  image = data;
                },
              ),
              CustomTextField(
                text: 'Description',
                initialValue: prod.description,
                onchang: (data) {
                  desc = data;
                },
              ),
              const SizedBox(height: 40),
              CustomButton(text: 'UPDATE',
  ontap: () async {
    isLoad = true;
    setState(() {});

    try {
      await updat(prod);
      print('success');
      Navigator.pop(context, ProductModel(
        id: prod.id,
        title: prodName ?? prod.title,
        price: double.parse(price ?? prod.price.toString()),
        description: desc ?? prod.description,
        image: image ?? prod.image,
        category: prod.category, 
        // rating: null,
      ));
    } catch (e) {
      print(e.toString());
    }

    isLoad = false;
    setState(() {});
  },
)

            ],
          ),
        ),
      ),
    );
  }

  // ✅ تحديث المنتج فعليًا
  Future<void> updat(ProductModel prode) async {
    await UpdateProductServices().updateProduct(
      id: prode.id,
      title: prodName ?? prode.title, // الاحتفاظ بالقيمة القديمة إذا لم يتم التغيير
      price: price ?? prode.price.toString(),
      desc: desc ?? prode.description,
      image: image ?? prode.image,
      category: prode.category,
    );
  }
}


// class UpdatePage extends StatefulWidget {
//   const UpdatePage({super.key});
//   static String Id = 'update';

//   @override
//   State<UpdatePage> createState() => _UpdatePageState();
// }

// class _UpdatePageState extends State<UpdatePage> {
//   String? prodName, image, price, desc;
//   bool isLoad = false;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Update Product',
//           style: TextStyle(
//             color: Colors.black,
//           ),
//         ),
//         backgroundColor: Colors.grey,
//       ),
//       body: Column(
//         children: [
//           const SizedBox(
//             height: 20,
//           ),
//           CustomFieldText(
//               text: 'Product',
//               onChag: (data) {
//                 prodName = data;
//               }),
//           CustomFieldText(
//               text: 'Decribtion',
//               onChag: (data) {
//                 desc = data;
//               }),
//           CustomFieldText(
//               text: 'Price',
//               type: TextInputType.number,
//               onChag: (data) {
//                 price = data;
//               }),
//           CustomFieldText(
//               text: 'image',
//               onChag: (data) {
//                 image = data;
//               }),
//           CustomButton(
//             ontap: () {},
//             text: 'UPDATE',
//           ),
//         ],
//       ),
//     );
//   }
// }
