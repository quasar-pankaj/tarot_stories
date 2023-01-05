import 'package:flutter/material.dart';

import 'tarot_spread_widget.dart';

class ThreeWayRelationShipSpread extends TarotSpreadWidget {
  const ThreeWayRelationShipSpread({super.key});

  @override
  Widget layoutCards(Iterable<Widget> widgets) {
    final list = widgets.toList();

    return Column(
      children: [
        list[0],
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            list[3],
            list[4],
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            list[1],
            list[5],
            list[2],
          ],
        ),
      ],
    );
  }
}
