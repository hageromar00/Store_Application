import 'package:flutter/material.dart';
import 'package:store_application/widget/customcard.dart';
import 'package:store_application/widget/listCustomCard.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static String id = 'Home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
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
        body: 
        ListCustomCard()
        //
        );
  }
}
