import 'package:flutter/material.dart';

import 'tarot_spread_widget.dart';

class BackstorySpread extends TarotSpreadWidget {
  const BackstorySpread({super.key});

  @override
  Widget layoutCards(Iterable<Widget> widgets) {
    final list = widgets.toList();
    return Row(
      children: [
        list[1],
        Column(
          children: [
            list[0],
            list[3],
          ],
        ),
        list[2],
      ],
    );
  }
}
