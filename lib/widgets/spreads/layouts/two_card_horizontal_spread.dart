import 'package:flutter/material.dart';

import 'tarot_spread_widget.dart';

class TwoCardHorizontalSpread extends TarotSpreadWidget {
  const TwoCardHorizontalSpread({super.key});

  @override
  Widget layoutCards(Iterable<Widget> widgets) {
    return Row(
      children: widgets.toList(),
    );
  }
}
