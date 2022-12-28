import 'package:flutter/material.dart';
import 'package:tarot_stories/spread_icons/box_widget.dart';

class BackstoryLayout extends StatelessWidget {
  static const _width = 35.0;

  final String _card1, _card2, _card3, _card4;

  const BackstoryLayout({
    super.key,
    required String card1,
    required String card2,
    required String card3,
    required String card4,
  })  : _card1 = card1,
        _card2 = card2,
        _card3 = card3,
        _card4 = card4;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        BoxWidget(
          width: _width,
          label: _card1,
        ),
        const Divider(
          height: 10,
        ),
        Row(
          children: [
            const Spacer(),
            BoxWidget(
              label: _card2,
              width: _width,
            ),
            const Spacer(),
            const VerticalDivider(
              width: 10,
            ),
            BoxWidget(
              width: _width,
              label: _card3,
            ),
          ],
        ),
        const Divider(
          height: 10,
        ),
        BoxWidget(
          width: _width,
          label: _card4,
        ),
        const Spacer(),
      ],
    );
  }
}
