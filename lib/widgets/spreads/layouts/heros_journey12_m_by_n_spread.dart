import 'package:flutter/material.dart';

import 'tarot_spread_widget.dart';

class HerosJourney12MByNSpread extends TarotSpreadWidget {
  const HerosJourney12MByNSpread({super.key});

  @override
  Widget layoutCards(Iterable<Widget> widgets) {
    final cards = widgets.toList();

    return Column(
      children: [
        Row(
          children: [
            cards[0],
            cards[1],
            cards[2],
          ],
        ),
        Row(
          children: [
            cards[3],
            cards[4],
            cards[5],
          ],
        ),
        Row(
          children: [
            cards[6],
            cards[7],
            cards[8],
          ],
        ),
        Row(
          children: [
            cards[9],
            cards[10],
            cards[11],
          ],
        ),
      ],
    );
  }
}
