import 'package:flutter/material.dart';
import 'package:tarot_stories/spread_icons/box_widget.dart';

class TwoCardHorizLayout extends StatelessWidget {
  static const _width = 40.0;

  const TwoCardHorizLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Row(
          children: const [
            Spacer(),
            BoxWidget(
              width: _width,
              height: _width * 2,
              label: '1',
              fontSize: _width * 2 / 5,
            ),
            VerticalDivider(
              width: 10,
            ),
            BoxWidget(
              width: _width,
              height: _width * 2,
              label: '2',
              fontSize: _width * 2 / 5,
            ),
            Spacer(),
          ],
        ),
        const Spacer(),
      ],
    );
  }
}
