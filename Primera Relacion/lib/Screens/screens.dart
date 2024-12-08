import 'package:flutter/material.dart';
import 'package:flutter_application_2/Screens/Enlace1.dart';
import 'package:flutter_application_2/Screens/Enlace2.dart';
import 'package:flutter_application_2/Screens/Enlace3.dart';
import 'package:flutter_application_2/Screens/Enlace4.dart';
import 'package:flutter_application_2/Screens/Enlace5.dart';
import 'package:flutter_application_2/Screens/Enlace9.dart';
import 'package:flutter_application_2/Screens/Piramide.dart';
import 'package:flutter_application_2/Screens/filas_columnas.dart';
import 'package:flutter_application_2/Screens/instagram.dart';
import 'package:flutter_application_2/Screens/ContadorApp.dart';
import 'package:flutter_application_2/Screens/sieteYMedia.dart';
import 'package:flutter_application_2/Screens/formulario.dart';


class AppRoutes {
  static const String contadorApp = '/contadorApp';
  static const String enlace1 = '/enlace1';
  static const String enlace2 = '/enlace2';
  static const String enlace3 = '/enlace3';
  static const String enlace4 = '/enlace4';
  static const String enlace5 = '/enlace5';
  static const String enlace9 = '/enlace9';
  static const String piramide = '/piramide';
  static const String filasColumnas = '/filasColumnas';
  static const String instagram = '/instagram';
  static const String sieteYMedia = '/sieteYMedia';
  static const String Formulario = '/FormularioPage';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case contadorApp:
        return MaterialPageRoute(builder: (_) => const ContadorApp());
      case enlace1:
        return MaterialPageRoute(builder: (_) => const Enlace1());
      case enlace2:
        return MaterialPageRoute(builder: (_) => const Enlace2());
      case enlace3:
        return MaterialPageRoute(builder: (_) => const Enlace3());
      case enlace4:
        return MaterialPageRoute(builder: (_) => const Enlace4());
      case enlace5:
        return MaterialPageRoute(builder: (_) => const Enlace5());
      case enlace9:
        return MaterialPageRoute(builder: (_) => const Enlace9());
      case piramide:
        return MaterialPageRoute(builder: (_) =>  Piramide());
      case filasColumnas:
        return MaterialPageRoute(builder: (_) => const FilasColumnas());
      case instagram:
        return MaterialPageRoute(builder: (_) => const InstagramProfileClone());
      case sieteYMedia:
        return MaterialPageRoute(builder: (_) => const GameScreen());
      case Formulario:
        return MaterialPageRoute(builder: (_) => const FormularioPage());
      default:
        return MaterialPageRoute(builder: (_) => const ContadorApp());
    }
  }
}

