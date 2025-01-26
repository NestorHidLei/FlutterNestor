import 'dart:math';
import 'package:flutter/material.dart';

class GameScreen extends StatefulWidget {
  final bool isSoloMode;

  const GameScreen({super.key, required this.isSoloMode});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  // Frecuencia de letras
  final Map<String, int> letterFrequency = {
    'A': 12, 'E': 12, 'O': 9, 'S': 6, 'I': 6, 'U': 5, 'N': 5, 'R': 6, 'T': 4,
    'D': 5, 'G': 2, 'L': 5,
    'C': 4, 'M': 2, 'B': 2, 'P': 2,
    'F': 1, 'H': 2, 'V': 1, 'Y': 1,
    'Q': 1,
    'J': 1, 'Ñ': 1, 'X': 1,
    'K': 1, 'Z': 1,
  };

  // Puntuación de las letras
  final Map<String, int> letterScores = {
    'A': 1, 'E': 1, 'O': 1, 'S': 1, 'I': 1, 'U': 1, 'N': 1, 'R': 1, 'T': 1,
    'D': 2, 'G': 2, 'L': 2,
    'C': 3, 'M': 3, 'B': 3, 'P': 3,
    'F': 4, 'H': 4, 'V': 4, 'Y': 4,
    'Q': 5,
    'J': 8, 'Ñ': 8, 'X': 8,
    'K': 10, 'Z': 10,
  };

  // Lista del tablero 15x15 con celdas vacías
  List<String?> boardTiles = List<String?>.filled(15 * 15, null);

  // Lista de fichas del jugador
  List<String> playerTiles = [];

  // Lista de fichas seleccionadas
  Set<int> selectedTiles = {};

  // Pool de letras
  late List<String> letterPool;

  @override
  void initState() {
    super.initState();
    _initializeLetterPool();
    _generateRandomTiles();
  }

  // Inicializar el pool de letras según las frecuencias
  void _initializeLetterPool() {
    letterPool = [];
    letterFrequency.forEach((letter, count) {
      letterPool.addAll(List.filled(count, letter));
    });
    letterPool.shuffle(Random());
  }

  // Generar fichas aleatorias para el jugador
  void _generateRandomTiles() {
    if (letterPool.isNotEmpty) {
      final neededTiles = 7 - playerTiles.length; // Cuántas fichas se necesitan
      final newTiles = letterPool.take(neededTiles).toList();
      setState(() {
        playerTiles.addAll(newTiles);
        letterPool.removeRange(0, min(neededTiles, letterPool.length));
      });
    }
  }

  // Descartar las fichas seleccionadas y generar nuevas
  void _discardSelectedTiles() {
    setState(() {
      // Retener solo las fichas que no están seleccionadas y no están en el tablero
      playerTiles = playerTiles
          .asMap()
          .entries
          .where((entry) => !selectedTiles.contains(entry.key))
          .map((entry) => entry.value)
          .toList();
      selectedTiles.clear();
      _generateRandomTiles();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 100,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.red, Colors.blue],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(
                Icons.person,
                color: Colors.red,
                size: 30,
              ),
            ),
            CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(
                Icons.person,
                color: Colors.blue,
                size: 30,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          // Tablero
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 15, // Número de columnas
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 2,
                ),
                itemCount: 15 * 15, // 15x15 casillas
                itemBuilder: (context, index) {
                  return DragTarget<String>(
                    onAccept: (tile) {
                      setState(() {
                        boardTiles[index] = tile;
                        playerTiles.remove(tile);
                        selectedTiles.clear(); // Limpiar selección al mover
                      });
                    },
                    builder: (context, candidateData, rejectedData) {
                      return Container(
                        decoration: BoxDecoration(
                          color: boardTiles[index] == null
                              ? Colors.green[700]
                              : Colors.brown[700],
                          border: Border.all(color: Colors.black, width: 0.5),
                        ),
                        child: Center(
                          child: Text(
                            boardTiles[index] ?? '',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
          // Contenedor para las fichas
          Container(
            padding: const EdgeInsets.all(8.0),
            color: Colors.grey[400],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: playerTiles.asMap().entries.map((entry) {
                final index = entry.key;
                final tile = entry.value;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      // Solo permitir seleccionar fichas no colocadas en el tablero
                      if (!boardTiles.contains(tile)) {
                        if (selectedTiles.contains(index)) {
                          selectedTiles.remove(index);
                        } else {
                          selectedTiles.add(index);
                        }
                      }
                    });
                  },
                  child: Draggable<String>(
                    data: tile,
                    feedback: Material(
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.brown[700],
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: Text(
                            tile,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                    childWhenDragging: const SizedBox.shrink(),
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: selectedTiles.contains(index)
                            ? Colors.red[700]
                            : Colors.brown[700],
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Stack(
                        children: [
                          Center(
                            child: Text(
                              tile,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 2,
                            right: 2,
                            child: Text(
                              '${letterScores[tile]}', // Puntuación de la letra
                              style: const TextStyle(
                                color: Colors.yellow,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          // Botón para descartar fichas seleccionadas
          Container(
            width: double.infinity,
            color: Colors.grey[600],
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: selectedTiles.isNotEmpty ? _discardSelectedTiles : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red[700],
              ),
              child: const Text(
                'Descartar fichas seleccionadas',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
