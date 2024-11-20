import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/Screens/MenuLateral.dart';

class Enlace9 extends StatelessWidget {
  const Enlace9({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Juego de Clics',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ClickGame(),
    );
  }
}

class ClickGame extends StatefulWidget {
  const ClickGame({super.key});

  @override
  _ClickGameState createState() => _ClickGameState();
}

class _ClickGameState extends State<ClickGame> {
  int score = 0;
  Random random = Random();
  double imageX = 0;
  double imageY = 0;
  Timer? timer;
  int timeLeft = 3;
  String currentImage = 'assets/images/kirbi.jpg'; // Imagen inicial
  String message = ''; // Mensaje para mostrar al usuario

  // Lista de rutas de imágenes
  final List<String> images = [
    'assets/images/imagen1.jfif',
    'assets/images/imagen2.jfif',
    'assets/images/imagen3.jfif',
    'assets/images/imagen4.jfif',
    'assets/images/imagen5.jfif',
    'assets/images/imagen6.jfif',
    'assets/images/imagen7.jfif',
    'assets/images/imagen8.jfif',
    'assets/images/imagen9.jfif',
    'assets/images/imagen10.jfif',
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      startGame();
    });
  }

  void startGame() {
    generateRandomPosition();
    startTimer();
    setState(() {
      message = ''; // Asegúrate de que no haya mensaje al inicio
    });
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      if (timeLeft > 0) {
        setState(() {
          timeLeft -= 1;
        });
      } else {
        timer?.cancel();
        missedImage();
      }
    });
  }

  void generateRandomPosition() {
    setState(() {
      // Cambia la posición de la imagen
      imageX = random.nextDouble() * (MediaQuery.of(context).size.width - 100);
      imageY = random.nextDouble() * (MediaQuery.of(context).size.height - 100);
      timeLeft = 3; // Reinicia el tiempo para cada nueva imagen

      // Selecciona una imagen aleatoria de la lista
      currentImage = images[random.nextInt(images.length)];
    });
  }

  void clickedImage() {
    timer?.cancel();
    setState(() {
      score += 1;
      message = '¡Bien Hecho!'; // Mostrar mensaje cuando se hace clic
    });
    generateRandomPosition();
    startTimer();
  }

  void missedImage() {
    setState(() {
      score -= 2;
      message = '¡Perdido!'; // Mostrar mensaje cuando no se hace clic
    });
    generateRandomPosition();
    startTimer();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Juego de Clics'),
        ),
        drawer: const MenuLateral(),
        body: Stack(
          children: [
            Positioned(
              left: imageX,
              top: imageY,
              child: GestureDetector(
                onTap: clickedImage,
                child: Image.asset(
                  currentImage,
                  width: 100,
                  height: 100,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      'Puntaje: $score',
                      style: const TextStyle(fontSize: 24),
                    ),
                    Text(
                      'Tiempo restante: $timeLeft',
                      style: const TextStyle(fontSize: 18, color: Colors.red),
                    ),
                    if (message.isNotEmpty) // Mostrar mensaje solo si no está vacío
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          message,
                          style: const TextStyle(fontSize: 20, color: Colors.green),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
