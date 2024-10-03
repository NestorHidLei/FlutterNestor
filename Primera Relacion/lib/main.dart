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
          backgroundColor: Colors.green,
          title: const Center(child: Text("Relacion Ejercicios 1")),
        ),
         drawer: const MenuLateral(),
        body: Center(
          child: Text(
            'Relacion Ejercicios 1',
            style: GoogleFonts.adamina(
              fontSize: 30,
            ),
          ),
        ),
      ),
    );
  }
}

