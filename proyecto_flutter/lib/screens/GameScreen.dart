import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GameScreen extends StatefulWidget {
  final bool isSoloMode;

  const GameScreen({super.key, required this.isSoloMode});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  static const int boardSize = 9;
  static const int playerTilesCount = 7;

  final Map<String, int> letterFrequency = {
    'A': 9, 'B': 2, 'C': 2, 'D': 4, 'E': 12, 'F': 2, 'G': 3, 'H': 2, 'I': 9,
    'J': 1, 'K': 1, 'L': 4, 'M': 2, 'N': 6, 'O': 8, 'P': 2, 'Q': 1, 'R': 6,
    'S': 4, 'T': 6, 'U': 4, 'V': 2, 'W': 2, 'X': 1, 'Y': 2, 'Z': 1
  };

  final Map<String, int> letterScores = {
    'A': 1, 'B': 3, 'C': 3, 'D': 2, 'E': 1, 'F': 4, 'G': 2, 'H': 4, 'I': 1,
    'J': 8, 'K': 5, 'L': 1, 'M': 3, 'N': 1, 'O': 1, 'P': 3, 'Q': 10, 'R': 1,
    'S': 1, 'T': 1, 'U': 1, 'V': 4, 'W': 4, 'X': 8, 'Y': 4, 'Z': 10
  };

  List<String?> boardTiles = List<String?>.filled(boardSize * boardSize, null);
  List<String> playerTiles = [];
  List<String> selectedTilesForWord = [];
  late List<String> letterPool;
  String? draggableWord;
  bool isHorizontal = true;
  String? selectedBoardWord;
  int? selectedBoardWordStartIndex;

  @override
  void initState() {
    super.initState();
    _initializeLetterPool();
    _generateRandomTiles();
  }

  void _initializeLetterPool() {
    letterPool = [];
    letterFrequency.forEach((letter, count) {
      letterPool.addAll(List.filled(count, letter));
    });
    letterPool.shuffle(Random());
  }

  void _generateRandomTiles() {
    if (letterPool.isNotEmpty) {
      final neededTiles = playerTilesCount - playerTiles.length;
      final newTiles = letterPool.take(neededTiles).toList();
      setState(() {
        playerTiles.addAll(newTiles);
        letterPool.removeRange(0, min(neededTiles, letterPool.length));
      });
    } else {
      _showErrorMessage('No hay más letras disponibles en el pool.');
    }
  }

  Future<bool> validateWord(String word) async {
    try {
      final response = await http.get(Uri.parse('https://api.dictionaryapi.dev/api/v2/entries/en/$word'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data is List && data.isNotEmpty;
      }
    } catch (e) {
      debugPrint('Error al validar palabra: $e');
    }
    return false;
  }

  Future<void> tryPlaceWordOnBoard() async {
    if (selectedTilesForWord.isEmpty) return;

    String word = selectedTilesForWord.join();
    bool isValid = await validateWord(word);

    if (isValid) {
      setState(() {
        draggableWord = word;
      });
    } else {
      _returnTilesToPlayer();
      _showInvalidWordMessage(word);
    }
  }

  void _placeWordOnBoard(int startIndex) {
    if (draggableWord == null) return;

    int wordLength = draggableWord!.length;
    int row = startIndex ~/ boardSize;
    int col = startIndex % boardSize;

    if (isHorizontal ? col + wordLength > boardSize : row + wordLength > boardSize) {
      _showInvalidPlacementMessage();
      return;
    }

    setState(() {
      for (int i = 0; i < wordLength; i++) {
        int index = isHorizontal ? startIndex + i : startIndex + (i * boardSize);
        boardTiles[index] = draggableWord![i];
      }
      draggableWord = null;
      _updatePlayerTiles();
    });
  }

  void _selectWordOnBoard(int startIndex) {
    int row = startIndex ~/ boardSize;
    int col = startIndex % boardSize;

    String horizontalWord = _getWordInDirection(row, col, 0, 1);
    String verticalWord = _getWordInDirection(row, col, 1, 0);

    if (horizontalWord.length > verticalWord.length) {
      setState(() {
        selectedBoardWord = horizontalWord;
        selectedBoardWordStartIndex = row * boardSize + (col - (horizontalWord.length - 1));
        isHorizontal = true;
      });
    } else {
      setState(() {
        selectedBoardWord = verticalWord;
        selectedBoardWordStartIndex = (row - (verticalWord.length - 1)) * boardSize + col;
        isHorizontal = false;
      });
    }
  }

  String _getWordInDirection(int row, int col, int rowIncrement, int colIncrement) {
    String word = '';
    int i = 0;
    while (row >= 0 && row < boardSize && col >= 0 && col < boardSize && boardTiles[row * boardSize + col] != null) {
      word = rowIncrement == 1 ? word + boardTiles[row * boardSize + col]! : boardTiles[row * boardSize + col]! + word;
      row += rowIncrement;
      col += colIncrement;
    }
    return word;
  }

  Future<void> _extendWordOnBoard({bool extendForward = true}) async {
    if (selectedBoardWord == null || selectedBoardWordStartIndex == null || selectedTilesForWord.isEmpty) {
      _showErrorMessage('Selecciona una palabra y letras para extender.');
      return;
    }

    String newWord = extendForward ? selectedBoardWord! + selectedTilesForWord.join() : selectedTilesForWord.join() + selectedBoardWord!;
    bool isValid = await validateWord(newWord);

    if (!isValid) {
      _showInvalidWordMessage(newWord);
      return;
    }

    int startIndex = selectedBoardWordStartIndex!;
    int wordLength = newWord.length;
    int row = startIndex ~/ boardSize;
    int col = startIndex % boardSize;

    if (!extendForward) {
      startIndex -= isHorizontal ? selectedTilesForWord.length : selectedTilesForWord.length * boardSize;
    }

    if (isHorizontal ? col + wordLength > boardSize || startIndex < 0 : row + wordLength > boardSize || startIndex < 0) {
      _showInvalidPlacementMessage();
      return;
    }

    setState(() {
      for (int i = 0; i < wordLength; i++) {
        int index = isHorizontal ? startIndex + i : startIndex + (i * boardSize);
        boardTiles[index] = newWord[i];
      }
      selectedBoardWord = null;
      selectedBoardWordStartIndex = null;
      _updatePlayerTiles();
    });
  }

  void _updatePlayerTiles() {
    playerTiles.removeWhere((tile) => selectedTilesForWord.contains(tile));
    selectedTilesForWord.clear();
    _generateRandomTiles();
  }

  void _returnTilesToPlayer() {
    setState(() {
      playerTiles.insertAll(0, selectedTilesForWord);
      selectedTilesForWord.clear();
    });
  }

  void _showErrorMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  void _showInvalidWordMessage(String word) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('"$word" no es una palabra válida.'),
        backgroundColor: Colors.red,
      ),
    );
  }

  void _showInvalidPlacementMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('No hay suficiente espacio para colocar la palabra.'),
        backgroundColor: Colors.red,
      ),
    );
  }

  void _discardSelectedTiles() {
    setState(() {
      letterPool.addAll(selectedTilesForWord);
      playerTiles.removeWhere((tile) => selectedTilesForWord.contains(tile));
      selectedTilesForWord.clear();
      letterPool.shuffle(Random());
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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: boardSize,
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 2,
                ),
                itemCount: boardSize * boardSize,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => _selectWordOnBoard(index),
                    child: DragTarget<String>(
                      onAccept: (data) => _placeWordOnBoard(index),
                      builder: (context, candidateData, rejectedData) {
                        return Container(
                          decoration: BoxDecoration(
                            color: boardTiles[index] == null
                                ? const Color.fromARGB(255, 83, 146, 75)
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
                    ),
                  );
                },
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            color: Colors.grey[400],
            child: Column(
              children: [
                if (selectedTilesForWord.isNotEmpty)
                  Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: Wrap(
                      spacing: 5,
                      children: selectedTilesForWord.map((tile) {
                        return Chip(
                          label: Text(tile),
                          onDeleted: () {
                            setState(() {
                              selectedTilesForWord.remove(tile);
                              playerTiles.add(tile);
                            });
                          },
                        );
                      }).toList(),
                    ),
                  ),
                Wrap(
                  spacing: 5,
                  children: playerTiles.map((tile) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedTilesForWord.add(tile);
                          playerTiles.remove(tile);
                        });
                      },
                      child: Chip(
                        label: Text(tile),
                      ),
                    );
                  }).toList(),
                ),
                if (draggableWord != null)
                  Column(
                    children: [
                      Text(
                        'Palabra: $draggableWord',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Dirección:'),
                          Switch(
                            value: isHorizontal,
                            onChanged: (value) {
                              setState(() {
                                isHorizontal = value;
                              });
                            },
                          ),
                          Text(isHorizontal ? 'Horizontal' : 'Vertical'),
                        ],
                      ),
                      Draggable<String>(
                        data: draggableWord,
                        feedback: Material(
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            color: Colors.blue.withOpacity(0.5),
                            child: Text(
                              draggableWord!,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          color: Colors.blue,
                          child: Text(
                            draggableWord!,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                if (selectedBoardWord != null)
                  Column(
                    children: [
                      Text(
                        'Palabra seleccionada: $selectedBoardWord',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () => _extendWordOnBoard(extendForward: true),
                            child: const Text('Extender hacia adelante'),
                          ),
                          const SizedBox(width: 10),
                          ElevatedButton(
                            onPressed: () => _extendWordOnBoard(extendForward: false),
                            child: const Text('Extender hacia atrás'),
                          ),
                        ],
                      ),
                    ],
                  ),
                Container(
                  width: double.infinity,
                  color: Colors.grey[600],
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: selectedTilesForWord.isNotEmpty ? _discardSelectedTiles : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red[700],
                        ),
                        child: const Text(
                          'Descartar',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: selectedTilesForWord.isNotEmpty ? tryPlaceWordOnBoard : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue[700],
                        ),
                        child: const Text(
                          'Validar y colocar',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}