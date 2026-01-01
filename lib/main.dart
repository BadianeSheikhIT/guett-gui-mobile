import 'package:flutter/material.dart';
import 'mes_ecrans/home_page.dart';


void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GuettGui App',
      home: HomePage(),
    );
  }
}
