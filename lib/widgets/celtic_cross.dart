import 'package:flutter/material.dart';

import '../services/card_service.dart';
import 'tarot_card.dart';

class CelticCross extends StatelessWidget {
  const CelticCross({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, snapshot) {
        if (snapshot.data == null) {
          return Container();
        }
        final List<TarotCard> cards = [];
        for (var i = 0; i < 11; i++) {
          final card = snapshot.data!.nextCard;
          cards.add(
            TarotCard(
              key: GlobalKey(),
              name: card.name,
              suit: card.suit,
              index: '$i',
            ),
          );
        }

        return FittedBox(
          child: InteractiveViewer(
            maxScale: 15.0,
            minScale: 0.01,
            child: layout(cards),
          ),
        );
      },
      future: CardService.instance,
    );
  }

  Row layout(List<TarotCard> cards) {
    return Row(
      children: [
        cards[5],
        Column(
          children: [
            cards[3],
            SizedBox(
              width: 405,
              child: Stack(
                children: [
                  cards[0],
                  Positioned(
                    left: 120,
                    child: cards[1],
                  ),
                  Positioned(
                    left: 240,
                    child: cards[2],
                  ),
                ],
              ),
            ),
            cards[4],
          ],
        ),
        cards[6],
        Column(
          children: [
            cards[10],
            cards[9],
            cards[8],
            cards[7],
          ],
        ),
      ],
    );
  }
}
