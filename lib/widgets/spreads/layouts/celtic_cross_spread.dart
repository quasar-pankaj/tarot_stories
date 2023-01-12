import 'package:flutter/material.dart';

import 'tarot_spread_widget.dart';

class CelticCrossSpread extends TarotSpreadWidget {
  const CelticCrossSpread({super.key});

  @override
  Widget layoutCards(Iterable<Widget> widgets) {
    final cards = widgets.toList();

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
            cards[9],
            cards[8],
            cards[7],
            cards[6],
          ],
        ),
      ],
    );
  }
}
