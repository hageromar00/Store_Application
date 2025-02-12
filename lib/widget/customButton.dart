import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({super.key, required this.ontap, required this.text});
  String text;
  VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(30),
          ),
          width: double.infinity,
          height: 50,
          child: Center(
              child: Text(
            text!,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold),
          )),
        ),
      ),
    );
  }
}
