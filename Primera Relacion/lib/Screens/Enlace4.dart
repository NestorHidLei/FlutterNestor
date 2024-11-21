import 'package:flutter/material.dart';
import 'package:flutter_application_2/Screens/MenuLateral.dart';

class Enlace4 extends StatelessWidget {
  const Enlace4({super.key});

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.teal,
          title: const Center(child: Text("Relacion Ejercicios 1")),
        ),
      drawer: const MenuLateral(),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.teal,  // Color de inicio del degradado
              Colors.lightGreen, // Color final del degradado
            ],
            begin: Alignment.topLeft,  // Comienza desde la esquina superior izquierda
            end: Alignment.bottomRight, // Termina en la esquina inferior derecha
          ),
        ),
        child: const Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Icono 1
              Icon(
                Icons.home,
                size: 50,
                color: Colors.white,
              ),
              SizedBox(width: 20), // Espacio horizontal entre iconos
              // Icono 2
              Icon(
                Icons.favorite,
                size: 50,
                color: Colors.white,
              ),
              SizedBox(width: 20), // Espacio horizontal entre iconos
              // Icono 3
              Icon(
                Icons.settings,
                size: 50,
                color: Colors.white,
              ),
              SizedBox(width: 20), // Espacio horizontal entre iconos
              // Icono 4
              Icon(
                Icons.share,
                size: 50,
                color: Colors.white,
              ),
              SizedBox(width: 20), // Espacio horizontal entre iconos
              // Icono 5
              Icon(
                Icons.info,
                size: 50,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
