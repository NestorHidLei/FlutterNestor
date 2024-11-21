import 'package:flutter/material.dart';
import 'package:flutter_application_2/Screens/screens.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',  // Asegúrate de tener un título adecuado
      theme: ThemeData(
        primaryColor: Colors.teal,
        scaffoldBackgroundColor: Colors.teal[50],
        textTheme: TextTheme(
          headlineLarge: GoogleFonts.sigmar(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.teal[800],
          ),
          bodyLarge: GoogleFonts.roboto(
            fontSize: 16,
            color: Colors.black87,
          ),
          bodyMedium: GoogleFonts.roboto(
            fontSize: 14,
            color: Colors.black54,
          ),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.teal,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          centerTitle: true,
        ),
      ),
      initialRoute: AppRoutes.enlace1, // Asegúrate de que 'AppRoutes.enlace1' esté bien definido
      onGenerateRoute: AppRoutes.generateRoute,  // Usa el generador de rutas que definimos
      debugShowCheckedModeBanner: false,  // Opcional, para quitar la "debug banner"
    );
  }
}
