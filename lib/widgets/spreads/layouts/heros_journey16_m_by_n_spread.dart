import 'package:flutter/material.dart';

import 'tarot_spread_widget.dart';

class HerosJourney16MByNSpread extends TarotSpreadWidget {
  const HerosJourney16MByNSpread({super.key});

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
            cards[3],
          ],
        ),
        Row(
          children: [
            cards[4],
            cards[5],
            cards[6],
            cards[7],
          ],
        ),
        Row(
          children: [
            cards[8],
            cards[9],
            cards[10],
            cards[11],
          ],
        ),
        Row(
          children: [
            cards[12],
            cards[13],
            cards[14],
            cards[15],
          ],
        ),
      ],
    );
  }
}
