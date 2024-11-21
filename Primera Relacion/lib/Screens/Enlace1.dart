import 'package:flutter/material.dart';
import 'package:flutter_application_2/Screens/MenuLateral.dart';
import 'package:google_fonts/google_fonts.dart';

class Enlace1 extends StatelessWidget {
  const Enlace1({super.key});

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
                Colors.teal, // Color inicial del degradado
                Colors.lightGreen, // Color final del degradado
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Néstor Hidalgo Leiva',
                  style: GoogleFonts.sigmar(
                    fontSize: 30,
                    color: Colors.white, // Cambia el color del texto si es necesario
                  ),
                ),
                Text(
                  'https://github.com/NestorHidLei/FlutterNestor',
                  style: GoogleFonts.paytoneOne(
                    fontSize: 16,
                    color: Colors.white, // Cambia el color del texto si es necesario
                  ),
                ),
              ],
            ),
          ),
        ),
      );
  }
}
