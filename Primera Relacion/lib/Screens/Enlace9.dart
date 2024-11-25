import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/Screens/MenuLateral.dart';

void main() {
  runApp(const Enlace9());
}

class Enlace9 extends StatelessWidget {
  const Enlace9({super.key});

  @override
  Widget build(BuildContext context) {
    return const ClickGame();
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
      final screenWidth = MediaQuery.of(context).size.width;
      final screenHeight = MediaQuery.of(context).size.height;

      // Ajuste para evitar solaparse con el área de texto (considera una altura de 250 para evitar solapamientos)
      imageX = random.nextDouble() * (screenWidth - 100);  // 100 es el ancho de la imagen
      imageY = random.nextDouble() * (screenHeight - 300); // 300 es el espacio utilizado por el puntaje, tiempo y margen

      timeLeft = 3; // Reinicia el tiempo para cada nueva imagen

      // Selecciona una imagen aleatoria de la lista
      currentImage = images[random.nextInt(images.length)];
    });
  }

  void clickedImage() {
    timer?.cancel();
    setState(() {
      score += 1;
    });
    generateRandomPosition();
    startTimer();

    // Verificar si el puntaje es múltiplo de 5
    if (score % 5 == 0) {
      // Mostrar Snackbar con mensaje "¡Bien Hecho!" solo si el puntaje es múltiplo de 5
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('¡Bien Hecho!')),
      );
    }
  }

  void missedImage() {
    setState(() {
      score -= 2;
    });
    generateRandomPosition();
    startTimer();

    // Verificar si el puntaje es múltiplo de 5 después de fallar
    if (score % 5 == 0) {
      // Mostrar Snackbar con mensaje "¡Fallaste!" solo si el puntaje es múltiplo de 5
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('¡Fallaste!')),
      );
    }
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
        title: const Text('Juego de Clics'),
      ),
      drawer: const MenuLateral(),
      body: SafeArea( // Agregamos SafeArea para evitar que los elementos queden ocultos por el sistema de barras y muescas
        child: Column(
          children: [
            // Este es el área fija para los textos de puntaje y tiempo
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Puntaje: $score',
                    style: const TextStyle(fontSize: 24),
                  ),
                  Text(
                    'Tiempo restante: $timeLeft',
                    style: const TextStyle(fontSize: 18, color: Colors.red),
                  ),
                ],
              ),
            ),
            // Aquí usamos un Expanded para permitir que las imágenes aparezcan en el espacio restante
            Expanded(
              child: Stack(
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
                        errorBuilder: (context, error, stackTrace) => const Icon(Icons.error, size: 100),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
