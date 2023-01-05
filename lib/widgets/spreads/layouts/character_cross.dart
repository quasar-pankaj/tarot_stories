import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'tarot_spread_widget.dart';

class CharacterCrossSpread extends TarotSpreadWidget {
  const CharacterCrossSpread({super.key});

  @override
  Widget layoutCards(Iterable<Widget> widgets) {
    final list = widgets.toList();
    return Row(
      children: [
        list[3],
        Column(
          children: [
            list[4],
            list[0],
            Transform.rotate(
              angle: math.pi / 2,
              child: list[1],
            ),
            list[2]
          ],
        ),
        list[5],
      ],
    );
  }
}
