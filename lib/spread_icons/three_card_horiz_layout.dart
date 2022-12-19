import 'package:flutter/material.dart';
import 'package:tarot_stories/spread_icons/box_widget.dart';

class ThreeCardHorizLayout extends StatelessWidget {
  static const _width = 40.0;

  final String _card1, _card2, _card3;

  const ThreeCardHorizLayout({
    super.key,
    required String card1,
    required String card2,
    required String card3,
  })  : _card1 = card1,
        _card2 = card2,
        _card3 = card3;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Row(
          children: [
            const Spacer(),
            BoxWidget(
              width: _width,
              height: _width * 2,
              label: _card1,
              fontSize: _width * 2 / 5,
            ),
            const VerticalDivider(
              width: 10,
            ),
            BoxWidget(
              width: _width,
              height: _width * 2,
              label: _card2,
              fontSize: _width * 2 / 5,
            ),
            const VerticalDivider(
              width: 10,
            ),
            BoxWidget(
              width: _width,
              height: _width * 2,
              label: _card3,
              fontSize: _width * 2 / 5,
            ),
            const Spacer(),
          ],
        ),
        const Spacer(),
      ],
    );
  }
}
