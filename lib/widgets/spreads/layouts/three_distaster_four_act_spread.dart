import 'package:flutter/material.dart';

import 'tarot_spread_widget.dart';

class ThreeDisasterFourActSpread extends TarotSpreadWidget {
  const ThreeDisasterFourActSpread({super.key});

  @override
  Widget layoutCards(Iterable<Widget> widgets) {
    final list = widgets.toList();
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            list[0],
            list[2],
            list[4],
            list[6],
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            list[1],
            list[3],
            list[5],
          ],
        ),
      ],
    );
  }
}
