import 'package:flutter/material.dart';
import 'package:tarot_stories/spread_icons/box_widget.dart';

class FiveCardHorizLayout extends StatelessWidget {
  static const _width = 35.0;

  final String _card1, _card2, _card3, _card4, _card5;

  const FiveCardHorizLayout({
    super.key,
    required String card1,
    required String card2,
    required String card3,
    required String card4,
    required String card5,
  })  : _card1 = card1,
        _card2 = card2,
        _card3 = card3,
        _card4 = card4,
        _card5 = card5;

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
            const VerticalDivider(
              width: 10,
            ),
            BoxWidget(
              width: _width,
              height: _width * 2,
              label: _card4,
              fontSize: _width * 2 / 5,
            ),
            const VerticalDivider(
              width: 10,
            ),
            BoxWidget(
              width: _width,
              height: _width * 2,
              label: _card5,
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
