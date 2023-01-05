import 'package:flutter/material.dart';

import 'tarot_spread_widget.dart';

class HorizontalSpread extends TarotSpreadWidget {
  const HorizontalSpread({super.key});

  @override
  Widget layoutCards(Iterable<Widget> widgets) {
    final modifiedWidgets = <Widget>[];
    for (var element in widgets) {
      modifiedWidgets.add(element);
      const VerticalDivider(
        thickness: 3,
        width: 3,
      );
    }
    return Row(
      children: modifiedWidgets,
    );
  }
}
