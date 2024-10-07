import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Screens/MenuLateral.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

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
          // Utiliza un Container para el fondo
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.teal, // Color inicial del degradado
                Colors.lightGreen, // Color final del degradado
              ],
              begin: Alignment.topLeft, // Dirección del degradado
              end: Alignment.bottomRight, // Dirección del degradado
            ),
          ),
          child: Center(
            child: Text(
              'Relacion Ejercicios 1',
              style: GoogleFonts.sigmar(
                fontSize: 30,
                color: Colors.white, // Cambia el color del texto para mejor contraste
              ),
            ),
          ),
        ),
      ),
    );
  }
}
