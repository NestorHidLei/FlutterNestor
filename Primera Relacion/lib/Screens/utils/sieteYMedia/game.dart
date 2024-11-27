import 'package:flutter_application_2/Screens/utils/sieteYMedia/card.dart';

class Game {
  final Deck deck = Deck();
  double playerScore = 0.0;
  double computerScore = 0.0;
  int playerWins = 0;
  int computerWins = 0;

  // El jugador pide una carta
  void playerDrawCard() {
    Card drawnCard = deck.drawCard();
    playerScore += drawnCard.value;
  }

  // La máquina pide una carta
  void computerDrawCard() {
    Card drawnCard = deck.drawCard();
    computerScore += drawnCard.value;
  }

  // Determinar el ganador de la partida
  String determineWinner() {
    if (playerScore > 7.5) {
      return 'La máquina gana la partida';
    } else if (computerScore > 7.5) {
      return 'El jugador gana la partida';
    } else if (playerScore > computerScore) {
      return 'El jugador gana la partida';
    } else if (computerScore > playerScore) {
      return 'La máquina gana la partida';
    } else {
      return 'Empate';
    }
  }

  // La máquina se planta cuando tiene 6.5 o más
  void computerPlant() {
    while (computerScore < 6.5) {
      computerDrawCard();
    }
  }

  // Resetear el estado para una nueva partida
  void resetRound() {
    playerScore = 0.0;
    computerScore = 0.0;
    deck.cards.shuffle();
  }
  
  // Verificar si alguno ha ganado 5 partidas
  bool gameOver() {
    return playerWins == 5 || computerWins == 5;
  }

  void playRound() {
    // El jugador juega hasta plantarse
    while (playerScore < 7.5) {
      // Aquí es donde el jugador puede decidir si pedir carta o no
      // En una implementación real sería un botón en la interfaz gráfica
    }

    // La máquina decide plantarse
    computerPlant();

    String winner = determineWinner();

    if (winner.contains('jugador')) {
      playerWins++;
    } else if (winner.contains('máquina')) {
      computerWins++;
    }
    
    resetRound();
  }
}
