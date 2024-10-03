import 'package:flutter/material.dart';
import 'package:flutter_application_2/Screens/MenuLateral.dart';
import 'package:google_fonts/google_fonts.dart';


class Enlace1 extends StatelessWidget {
  const Enlace1({super.key});


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
            'Néstor Hidalgo Leiva',
            style: GoogleFonts.adamina(
              fontSize: 30,
            ),
          ),
        ),
      ),
    );
  }
}
