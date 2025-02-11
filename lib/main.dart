import 'package:flutter/material.dart';
import 'package:store_application/screens/homepage.dart';
import 'package:store_application/screens/update.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomePage.id: (context) => const HomePage(),
        UpdatePage.Id: (context) => const UpdatePage(),
      },
      initialRoute: HomePage.id,
    );
  }
}
