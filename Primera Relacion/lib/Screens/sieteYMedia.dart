import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class Card {
  final String name;
  final double value;

  Card(this.name, this.value);
}

class Deck {
  List<Card> cards = [];
  Deck() {
    _initializeDeck();
  }

  // Inicializamos el mazo de cartas (sin 8 y 9)
  void _initializeDeck() {
    List<String> names = ['1', '2', '3', '4', '5', '6', '7', 'sota', 'caballo', 'rey'];
    for (String name in names) {
      double value = (name == 'sota' || name == 'caballo' || name == 'rey') ? 0.5 : double.parse(name);
      cards.add(Card(name, value));
      cards.add(Card(name, value));
      cards.add(Card(name, value));
      cards.add(Card(name, value));
    }
    cards.shuffle(); // Barajamos las cartas al inicio
  }

  Card drawCard() {
    final card = cards.removeAt(0);
    return card;
  }
}

class Game {
  final Deck deck = Deck();
  double playerScore = 0.0;
  double computerScore = 0.0;
  int playerWins = 0;
  int computerWins = 0;
  bool isRoundOver = false;
  double playerScoreAtPlant = 0.0; // Variable para almacenar el puntaje cuando el jugador se planta

  // El jugador pide una carta
  void playerDrawCard() {
    if (!isRoundOver) {
      Card drawnCard = deck.drawCard();
      playerScore += drawnCard.value;
      if (playerScore > 7.5) {
        isRoundOver = true; // El jugador se pasa de 7.5, la ronda termina
      }
    }
  }

  // La máquina pide una carta
  void computerDrawCard() {
    if (!isRoundOver && computerScore < 6.5) {
      Card drawnCard = deck.drawCard();
      computerScore += drawnCard.value;
      if (computerScore > 7.5) {
        isRoundOver = true; // La máquina se pasa de 7.5, la ronda termina
      }
    }
  }

  // La máquina se planta cuando tiene 6.5 o más
  void computerPlant() {
    while (computerScore < 6.5 && !isRoundOver) {
      computerDrawCard();
    }
  }

  // Determinamos quién gana la ronda
  String determineWinner() {
    if (playerScore > 7.5) {
      return 'La máquina gana la ronda';
    } else if (computerScore > 7.5) {
      return 'El jugador gana la ronda';
    } else if (playerScore > computerScore) {
      return 'El jugador gana la ronda';
    } else if (computerScore > playerScore) {
      return 'La máquina gana la ronda';
    } else {
      return 'Empate';
    }
  }

  // Reiniciar la ronda
  void resetRound() {
    playerScore = 0.0;
    computerScore = 0.0;
    deck.cards.clear();
    deck._initializeDeck();
    isRoundOver = false;
    playerScoreAtPlant = 0.0; // Reseteamos el puntaje del jugador cuando se reinicia la ronda
  }

  // Comprobar si el juego ha terminado (cuando un jugador gana 5 partidas)
  bool gameOver() {
    return playerWins == 5 || computerWins == 5;
  }

  // Función para jugar una ronda
  void playRound() {
    // La máquina juega hasta que tenga 6.5 puntos o más
    computerPlant();

    // Determinamos el ganador de la ronda
    String winner = determineWinner();
    if (winner.contains('jugador')) {
      playerWins++;
    } else if (winner.contains('máquina')) {
      computerWins++;
    }

    // Si un jugador gana 5 rondas, el juego termina
    if (gameOver()) {
      String finalWinner = playerWins == 5 ? '¡Jugador gana el juego!' : '¡Máquina gana el juego!';
      resetRound(); // Reiniciar para una nueva partida
      print(finalWinner);
    } else {
      // Reiniciar la ronda después de cada partida
      resetRound();
    }
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '7 y Media',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: GameScreen(),
    );
  }
}

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final Game game = Game();
  bool roundOver = false;
  String resultMessage = '';

  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: const Text('Juego 7 y Media')),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Jugador: ${game.playerScore}',
            textAlign: TextAlign.center, 
          ),
          Text(
            'Máquina: ${game.computerScore}',
            textAlign: TextAlign.center, 
          ),
          Text(
            'Victorias del Jugador: ${game.playerWins}',
            textAlign: TextAlign.center,
          ),
          Text(
            'Victorias de la Máquina: ${game.computerWins}',
            textAlign: TextAlign.center,
          ),
          if (game.gameOver())
            Text(
              game.playerWins == 5
                  ? '¡Jugador gana el juego!'
                  : '¡Máquina gana el juego!',
              textAlign: TextAlign.center, 
            ),
          if (!game.gameOver() && !roundOver) ...[
            ElevatedButton(
              onPressed: () {
                setState(() {
                  game.playerDrawCard();
                  if (game.playerScore > 7.5) {
                    resultMessage = 'Te has pasado de 7.5, la máquina gana la ronda';
                    game.computerWins++;
                    roundOver = true;
                  }
                });
              },
              child: const Text('Pedir carta'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  game.playerScoreAtPlant = game.playerScore;
                  game.computerPlant();
                  resultMessage = game.determineWinner();
                  if (resultMessage.contains('jugador')) {
                    game.playerWins++;
                  } else if (resultMessage.contains('máquina')) {
                    game.computerWins++;
                  }
                  roundOver = true;
                });
              },
              child: const Text('Plantarme'),
            ),
          ],
          if (roundOver) ...[
            Text(
              resultMessage,
              textAlign: TextAlign.center, // Centrar el texto
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  roundOver = false;
                  resultMessage = '';
                  game.resetRound();
                });
              },
              child: const Text('Jugar otra ronda'),
            ),
          ],
          // Restart Game Button if Game Over
          if (game.gameOver()) ...[
            ElevatedButton(
              onPressed: () {
                setState(() {
                  roundOver = false;
                  resultMessage = '';
                });
              },
              child: const Text('Reiniciar el juego'),
            ),
          ]
        ],
      ),
    ),
  );
}

}
