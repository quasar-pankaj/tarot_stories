import 'package:flutter/material.dart';

import 'tarot_spread_widget.dart';

class HerosJourney16CircularSpread extends TarotSpreadWidget {
  const HerosJourney16CircularSpread({super.key});

  @override
  Widget layoutCards(Iterable<Widget> widgets) {
    final cards = widgets.toList();

    return Row(
      children: [
        Column(
          children: [
            const Spacer(),
            cards[12],
            cards[11],
            const Spacer(),
          ],
        ),
        Column(
          children: [
            const Spacer(
              flex: 1,
            ),
            cards[13],
            const Spacer(
              flex: 2,
            ),
            cards[10],
            const Spacer(
              flex: 1,
            ),
          ],
        ),
        Column(
          children: [
            const Spacer(
              flex: 1,
            ),
            cards[14],
            const Spacer(
              flex: 4,
            ),
            cards[9],
            const Spacer(
              flex: 1,
            ),
          ],
        ),
        Column(
          children: [
            cards[15],
            const Spacer(),
            cards[8],
          ],
        ),
        Column(
          children: [
            cards[0],
            const Spacer(),
            cards[7],
          ],
        ),
        Column(
          children: [
            const Spacer(
              flex: 1,
            ),
            cards[1],
            const Spacer(
              flex: 4,
            ),
            cards[6],
            const Spacer(
              flex: 1,
            ),
          ],
        ),
        Column(
          children: [
            const Spacer(
              flex: 1,
            ),
            cards[2],
            const Spacer(
              flex: 2,
            ),
            cards[5],
            const Spacer(
              flex: 1,
            ),
          ],
        ),
        Column(
          children: [
            const Spacer(),
            cards[3],
            cards[4],
            const Spacer(),
          ],
        ),
      ],
    );
  }
}
