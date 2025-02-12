import 'package:flutter/material.dart';
import 'package:store_application/model/category.dart';
import 'package:store_application/screens/update.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key,required this.model});
  final ProductModel model;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const UpdatePage();
        }));
      },
      child: Stack(clipBehavior: Clip.none, children: [
        Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromARGB(255, 226, 218, 218),
                  blurRadius: 60,
                  offset: Offset(10, 10),
                  spreadRadius: 0,
                )
              ]),
          child: Card(
            elevation: 15,
            child:  Padding(
              padding: const EdgeInsets.all(10),
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    model.title.substring(0,17),
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                const  SizedBox(
                    height: 3,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        r'$ ''${model.price}',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    const  Icon(
                        Icons.favorite,
                        color: Colors.red,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned(
       
          // child: Image.asset(
          //   'assets/color_black.png',
          //   height: 100,
          //   width: 100,
          // ),
          top: -60,
          right: 10,
           child: Image.network(model.image,  height: 100,
            width: 100,)
        )
      ]),
    );
  }
}
