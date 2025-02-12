import 'package:flutter/material.dart';
import 'package:store_application/model/category.dart';
import 'package:store_application/widget/customcard.dart';

class ListCustomCard extends StatelessWidget {
   ListCustomCard({super.key,required this.prod});
  final List<ProductModel> prod;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(19, 65, 19, 19),
      child: GridView.builder(
          primary: false,
          physics:const BouncingScrollPhysics(),
          clipBehavior: Clip.none,
          itemCount: prod.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.1,
              mainAxisSpacing: 100,
              crossAxisSpacing: 10),
          itemBuilder: (context, index) {
            return  CustomCard(model: prod[index]);
          }),
    );
  }
}
