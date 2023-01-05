import 'package:flutter/material.dart';

import 'tarot_spread_widget.dart';

class VerticalSpread extends TarotSpreadWidget {
  const VerticalSpread({super.key});

  @override
  Widget layoutCards(Iterable<Widget> widgets) {
    final modifiedWidgets = <Widget>[];
    for (var element in widgets) {
      modifiedWidgets.add(element);
      const Divider(
        thickness: 3,
        height: 3,
      );
    }
    return Column(
      children: modifiedWidgets,
    );
  }
}
