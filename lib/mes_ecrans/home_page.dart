// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'connexion.dart';
class HomePage extends StatelessWidget {


  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const Connexion()),
      );
    });


    return Scaffold(
     appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Guett Gui', 
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,
          fontWeight: FontWeight.bold,
          height: 1.5,
        ),
        ),
        centerTitle: true,
      ),
      body: const Center(
        
        child: Image(image:   AssetImage('assets/images/logoColor.jpg'),
                fit: BoxFit.cover,
        ),
    ),
    );
  }
}