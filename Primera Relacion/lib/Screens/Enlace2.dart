import 'package:flutter/material.dart';
import 'package:flutter_application_2/Screens/MenuLateral.dart';

class Enlace2 extends StatelessWidget {
  const Enlace2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    home: Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.teal,
          title: const Center(child: Text("Relacion Ejercicios 1")),
        ),
      drawer: const MenuLateral(),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.teal,  
              Colors.lightGreen, 
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight, 
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Imagen 1
              Image.network(
                'https://pics.filmaffinity.com/El_Camino_Una_pelaicula_de_Breaking_Bad-106068993-large.jpg',
                height: 150,
                width: 150,
              ),
              const SizedBox(height: 20), 
              // Imagen 2
              Image.network(
                'https://m.media-amazon.com/images/M/MV5BMzU5ZGYzNmQtMTdhYy00OGRiLTg0NmQtYjVjNzliZTg1ZGE4XkEyXkFqcGc@._V1_.jpg',
                height: 150,
                width: 150,
              ),
              const SizedBox(height: 20),
              // Imagen 3
              Image.network(
                'https://m.media-amazon.com/images/M/MV5BMGY4MWIyMzAtMTA1OS00NDc3LWE2ZTktMTQ4NTZmZjIxZjgxXkEyXkFqcGc@._V1_.jpg',
                height: 150,
                width: 150,
              ),
            ],
          ),
        ),
      ),
    )
    );
  }
}
