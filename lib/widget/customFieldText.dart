import 'package:flutter/material.dart';

// class CustomFieldText extends StatelessWidget {
//   CustomFieldText({super.key, required this.text, required this.onChag, this.type});
//   String text;
//   Function(String) onChag;
//   TextInputType? type;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: TextField(
//         keyboardType: type,
//         onChanged: onChag,
//         decoration: InputDecoration(
//             hintText: 'Product',
//             hintStyle: const TextStyle(color: Colors.grey),
//             border:
//                 OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
//       ),
//     );
//   }
// }

class CustomTextField extends StatelessWidget {
  final String text;
  final TextInputType? type;
  final Function(String)? onchang;
  final String? initialValue;  

  const CustomTextField({
    super.key,
    required this.text,
    this.type,
    this.onchang,
    this.initialValue,  
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: TextFormField(
        keyboardType: type,
        initialValue: initialValue, 
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          hintText: text,
          hintStyle: const TextStyle(color: Colors.grey),
        ),
        onChanged: onchang, 
      ),
    );
  }
}