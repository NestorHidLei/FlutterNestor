import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(Enlace9());
}

class Enlace9 extends StatelessWidget {
  const Enlace9({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Juego de Clics',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ClickGame(),
    );
  }
}

class ClickGame extends StatefulWidget {
  @override
  _ClickGameState createState() => _ClickGameState();
}

class _ClickGameState extends State<ClickGame> {
  int score = 0;
  Random random = Random();
  double imageX = 0;
  double imageY = 0;
  Timer? timer;
  int timeLeft = 3; // Tiempo en segundos para hacer clic en la imagen

  @override
  void initState() {
    super.initState();
    // Esperar a que el widget esté completamente montado para obtener las dimensiones
    WidgetsBinding.instance.addPostFrameCallback((_) {
      startGame();
    });
  }

  void startGame() {
    generateRandomPosition();
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
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
      // Generar una posición aleatoria para la imagen una vez que las dimensiones son accesibles
      imageX = random.nextDouble() * (MediaQuery.of(context).size.width - 100);
      imageY = random.nextDouble() * (MediaQuery.of(context).size.height - 100);
      timeLeft = 3; // Reiniciar el tiempo para cada nueva imagen
    });
  }

  void clickedImage() {
    timer?.cancel();
    setState(() {
      score += 1;
    });
    generateRandomPosition();
    startTimer();
  }

  void missedImage() {
    setState(() {
      score -= 2;
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Juego de Clics'),
      ),
      body: Stack(
        children: [
          Positioned(
            left: imageX,
            top: imageY,
            child: GestureDetector(
              onTap: clickedImage,
              child: Image.asset(
                'assets/image.png', // Coloca aquí la ruta de tu imagen en assets
                width: 100,
                height: 100,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    'Puntaje: $score',
                    style: TextStyle(fontSize: 24),
                  ),
                  Text(
                    'Tiempo restante: $timeLeft',
                    style: TextStyle(fontSize: 18, color: Colors.red),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
