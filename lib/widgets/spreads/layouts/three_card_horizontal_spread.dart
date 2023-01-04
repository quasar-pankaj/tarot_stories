import 'package:flutter/material.dart';

import 'tarot_spread_widget.dart';

class ThreeCardHorizontalSpread extends TarotSpreadWidget {
  const ThreeCardHorizontalSpread({super.key});

  @override
  Widget layoutCards(Iterable<Widget> widgets) {
    return Row(
      children: widgets.toList(),
    );
  }
}
