import 'package:flutter/material.dart';

import 'tarot_spread_widget.dart';

class OneCardSpread extends TarotSpreadWidget {
  const OneCardSpread({super.key});

  @override
  Widget layoutCards(Iterable<Widget> widgets) {
    return widgets.first;
  }
}
