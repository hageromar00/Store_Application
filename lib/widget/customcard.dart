import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(clipBehavior: Clip.none, children: [
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
        child: const Card(
          elevation: 15,
          child: const Padding(
            padding: const EdgeInsets.all(10),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "hgjhgjh",
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 3,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      r'$ 199',
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Icon(
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
        child: Image.asset(
          'assets/color_black.png',
          height: 100,
          width: 100,
        ),
        top: -60,
        right: 10,
      )
    ]);
  }
}
