import 'package:flutter/material.dart';
import 'package:flutter_application_2/Screens/MenuLateral.dart';

class Piramide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Ejemplo de filas y columnas anidadas'),
        ),
      drawer: const MenuLateral(),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Fila superior con un solo ícono centrado
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(child: CallIconWidget()), // Agregamos Flexible
                ],
              ),
              SizedBox(height: 16), // Espacio entre filas

              // Fila con dos íconos
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(child: CallIconWidget()), // Agregamos Flexible
                  SizedBox(width: 16), // Espacio entre íconos
                  Flexible(child: CallIconWidget()), // Agregamos Flexible
                ],
              ),
              SizedBox(height: 16), // Espacio entre filas

              // Fila con tres íconos
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(child: CallIconWidget()), // Agregamos Flexible
                  SizedBox(width: 16),
                  Flexible(child: CallIconWidget()), // Agregamos Flexible
                  SizedBox(width: 16),
                  Flexible(child: CallIconWidget()), // Agregamos Flexible
                ],
              ),
            ],
          ),
        ),
      );
  }
}

class CallIconWidget extends StatelessWidget {
  const CallIconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min, // Evita que el Column use más espacio del necesario
      children: [
        Icon(
          Icons.phone,
          size: 48,
          color: Colors.black,
        ),
        SizedBox(height: 8),
        FittedBox( // Envolver el texto en FittedBox para que se ajuste al espacio
          child: Text(
            'Llamar por teléfono',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12), // Ajusta el tamaño de fuente si es necesario
          ),
        ),
      ],
    );
  }
}
