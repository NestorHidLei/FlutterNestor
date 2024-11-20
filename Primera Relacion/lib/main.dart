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
            child: Text(
              'Relacion Ejercicios 1',
              style: GoogleFonts.sigmar(
                fontSize: 30,
                color: Colors.white, 
              ),
            ),
          ),
        ),
      ),
    );
  }
}
