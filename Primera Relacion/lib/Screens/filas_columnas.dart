import 'package:flutter/material.dart';
import 'package:flutter_application_2/Screens/MenuLateral.dart';

class FilasColumnas extends StatelessWidget {
  const FilasColumnas({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Ejemplo de filas y columnas'),
        ),
        drawer: const MenuLateral(),

        body: const Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Primera fila
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  // Primer icono: Teléfono
                  Column(
                    children: <Widget>[
                      Icon(Icons.phone, size: 50),
                      SizedBox(height: 10),
                      Text('Llamar por teléfono'),
                    ],
                  ),
                  // Segundo icono: Correo
                  Column(
                    children: <Widget>[
                      Icon(Icons.email, size: 50),
                      SizedBox(height: 10),
                      Text('Enviar mensaje'),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 40), // Espacio entre las filas
              // Segunda fila
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  // Icono de Instagram (similar usando icono de cámara)
                  Column(
                    children: <Widget>[
                      Icon(Icons.camera_alt, size: 50, color: Colors.purple),
                      SizedBox(height: 10),
                      Text('Instagram'),
                    ],
                  ),
                  // Icono de WhatsApp (similar usando icono de chat)
                  Column(
                    children: <Widget>[
                      Icon(Icons.chat, size: 50, color: Colors.green),
                      SizedBox(height: 10),
                      Text('WhatsApp'),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
