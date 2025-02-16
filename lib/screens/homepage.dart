import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_application/model/category.dart';
import 'package:store_application/service/getproduct.dart';
import 'package:store_application/widget/listCustomCard.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static String id = 'Home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(  actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                FontAwesomeIcons.cartPlus,
                color: Colors.black,
              ))
        ],
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'New ',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Text(
                'Trends',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.amber),
              ),
            ],
          ),
        ),
        body: FutureBuilder<List<ProductModel>>(
          future: GetAllProduct().getallproduct(),
          builder: (context, snapshat) {
            if (snapshat.hasData) {
              List<ProductModel> products = snapshat.data!;
              return ListCustomCard(prod: products);
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        )
        //
        );
  }
}
