import 'package:flutter/material.dart';

class CustomFieldText extends StatelessWidget {
  CustomFieldText({super.key, required this.text,required this.onChag});
  String text;
  Function(String) onChag;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        onChanged: onChag,
        decoration: InputDecoration(
            hintText: 'Product',
            hintStyle:const TextStyle(color: Colors.grey),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      ),
    );
  }
}
