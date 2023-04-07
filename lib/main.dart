import 'package:flutter/material.dart';
import 'price_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.grey,
        scaffoldBackgroundColor: const Color.fromARGB(255, 78, 78, 78),
      ),
      home: const PriceScreen(),
    );
  }
}
