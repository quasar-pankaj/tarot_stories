import 'package:flutter/material.dart';
import 'package:tarot_stories/spread_icons/box_widget.dart';

class CharacterCrossLayout extends StatelessWidget {
  static const _width = 25.0;

  final String _card1, _card2, _card3, _card4, _card5, _card6;

  const CharacterCrossLayout({
    super.key,
    required String card1,
    required String card2,
    required String card3,
    required String card4,
    required String card5,
    required String card6,
  })  : _card1 = card1,
        _card2 = card2,
        _card3 = card3,
        _card4 = card4,
        _card5 = card5,
        _card6 = card6;

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
              label: _card5,
            ),
            const Spacer(),
          ],
        ),
        const Divider(
          height: 10,
        ),
        Row(
          children: [
            const Spacer(),
            BoxWidget(
              label: _card4,
              width: _width,
            ),
            const VerticalDivider(
              width: 10,
            ),
            Stack(
              children: [
                BoxWidget(
                  width: _width,
                  label: _card1,
                ),
                BoxWidget(
                  width: _width * 3 / 2,
                  height: _width,
                  label: _card2,
                  fontSize: _width * 2 / 5,
                )
              ],
            ),
            const VerticalDivider(
              width: 10,
            ),
            BoxWidget(
              width: _width,
              label: _card6,
            ),
            const Spacer(),
          ],
        ),
        const Divider(
          height: 10,
        ),
        Row(
          children: [
            const Spacer(),
            BoxWidget(
              width: _width,
              label: _card3,
            ),
            const Spacer(),
          ],
        ),
        const Spacer(),
      ],
    );
  }
}
