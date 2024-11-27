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

  // Inicializar las cartas del mazo (sin 8 y 9)
  void _initializeDeck() {
    List<String> names = ['1', '2', '3', '4', '5', '6', '7', 'sota', 'caballo', 'rey'];
    for (String name in names) {
      double value = (name == 'sota' || name == 'caballo' || name == 'rey') ? 0.5 : double.parse(name);
      cards.add(Card(name, value));
    }
  }

  // Sacar una carta aleatoria del mazo
  Card drawCard() {
    final card = cards.removeAt(0);
    return card;
  }
}
