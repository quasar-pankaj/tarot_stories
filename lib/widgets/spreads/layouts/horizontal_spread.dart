import 'package:flutter/material.dart';

import 'tarot_spread_widget.dart';

class HorizontalSpread extends TarotSpreadWidget {
  const HorizontalSpread({super.key});

  @override
  Widget layoutCards(Iterable<Widget> widgets) {
    return Row(
      children: widgets.toList(),
    );
  }
}
