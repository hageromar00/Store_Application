import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_application/model/category.dart';
import 'package:store_application/screens/add_page.dart';
import 'package:store_application/service/getproduct.dart';
import 'package:store_application/widget/listCustomCard.dart';

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});
//   static String id = 'Home';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(  actions: [
//           IconButton(
//               onPressed: () {},
//               icon: const Icon(
//                 FontAwesomeIcons.cartPlus,
//                 color: Colors.black,
//               ))
//         ],
//           title: const Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 'New ',
//                 style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//               ),
//               Text(
//                 'Trends',
//                 style: TextStyle(
//                     fontSize: 22,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.amber),
//               ),
//             ],
//           ),
//         ),
//         body: FutureBuilder<List<ProductModel>>(
//           future: GetAllProduct().getallproduct(),
//           builder: (context, snapshat) {
//             if (snapshat.hasData) {
//               List<ProductModel> products = snapshat.data!;
//               return ListCustomCard(prod: products);
//             } else {
//               return const Center(child: CircularProgressIndicator());
//             }
//           },
//         )
//         //
//         );
//   }
// }
class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static String id = 'homepage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ProductModel> products = [];

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    List<ProductModel> fetchedProducts = await GetAllProduct().getallproduct();
    setState(() {
      products = fetchedProducts;
    });
  }

  void addNewProduct(ProductModel newProduct) {
    setState(() {
      products.insert(0, newProduct); // إضافة المنتج في بداية القائمة
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () async {
                  final newProduct = await Navigator.push(
                      context, MaterialPageRoute(builder: (context) {
                    return const AddPage();
                  }));

                  if (newProduct != null && newProduct is ProductModel) {
                    addNewProduct(newProduct);
                  }
                },
                icon: const Icon(FontAwesomeIcons.cartPlus))
          ],
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'New ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('Trends',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.amber)),
            ],
          ),
        ),
        body: products.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : ListCustomCard(prod: products));
  }
}
