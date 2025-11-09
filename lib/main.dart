import 'package:flutter/material.dart';
import 'package:lab1_mis/screens/details.dart';
import 'package:lab1_mis/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Распоред за испити - 223209',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink.shade900),
      ),
      initialRoute: "/",
      routes: {
        "/": (context) =>
        const MyHomePage(title: 'Распоред за испити - 223209'),
        "/details": (context) => const DetailsPage(),
      },
    );
  }
}
