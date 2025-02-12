import 'package:flutter/material.dart';
import 'package:store_application/widget/customcard.dart';

class ListCustomCard extends StatelessWidget {
  const ListCustomCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(19, 65, 19, 19),
      child: GridView.builder(
          primary: false,
          physics:const BouncingScrollPhysics(),
          clipBehavior: Clip.none,
          itemCount: 10,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.1,
              mainAxisSpacing: 100,
              crossAxisSpacing: 10),
          itemBuilder: (context, index) {
            return const CustomCard();
          }),
    );
  }
}
