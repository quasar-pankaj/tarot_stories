import 'package:flutter/material.dart';

import 'tarot_spread_widget.dart';

class VerticalSpread extends TarotSpreadWidget {
  const VerticalSpread({super.key});

  @override
  Widget layoutCards(Iterable<Widget> widgets) {
    return Column(
      children: widgets.toList(),
    );
  }
}
