import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

import '../../services/card_model.dart';
import 'card_back.dart';
import 'card_front.dart';

class TarotCard extends StatelessWidget {
  late final String _path;
  final String _index;

  TarotCard({
    super.key,
    required String name,
    required Suit suit,
    required String index,
  }) : _index = index {
    switch (suit) {
      case Suit.trumps:
        _path = 'assets/tarot/major/tarot_$name.jpg';
        break;
      case Suit.cups:
        _path = 'assets/tarot/minor/cups/tarot_cups_${name.substring(1)}.jpg';
        break;
      case Suit.pentacles:
        _path =
            'assets/tarot/minor/pentacles/tarot_pentacles_${name.substring(1)}.jpg';
        break;
      case Suit.swords:
        _path =
            'assets/tarot/minor/swords/tarot_swords_${name.substring(1)}.jpg';
        break;
      case Suit.wands:
        _path = 'assets/tarot/minor/wands/tarot_wands_${name.substring(1)}.jpg';
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FlipCard(
      back: CardFront(
        path: _path,
      ),
      front: CardBack(
        index: _index,
      ),
    );
  }
}
