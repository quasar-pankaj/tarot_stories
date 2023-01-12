import 'package:flutter/material.dart';

import 'tarot_spread_widget.dart';

class HerosJourney12CircularSpread extends TarotSpreadWidget {
  const HerosJourney12CircularSpread({super.key});

  @override
  Widget layoutCards(Iterable<Widget> widgets) {
    final cards = widgets.toList();

    return Row(
      children: [
        cards[9],
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Spacer(
              flex: 1,
            ),
            cards[10],
            const Spacer(
              flex: 2,
            ),
            cards[8],
            const Spacer(
              flex: 1,
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Spacer(flex: 1),
            cards[11],
            const Spacer(
              flex: 4,
            ),
            cards[7],
            const Spacer(
              flex: 1,
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            cards[0],
            const Spacer(),
            cards[6],
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Spacer(flex: 1),
            cards[1],
            const Spacer(
              flex: 4,
            ),
            cards[5],
            const Spacer(
              flex: 1,
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Spacer(
              flex: 1,
            ),
            cards[2],
            const Spacer(
              flex: 2,
            ),
            cards[4],
            const Spacer(
              flex: 1,
            ),
          ],
        ),
        cards[3],
      ],
    );
  }
}
