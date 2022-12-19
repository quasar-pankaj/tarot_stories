import 'package:flutter/material.dart';
import 'package:tarot_stories/spread_icons/box_widget.dart';

class TwoCardVertLayout extends StatelessWidget {
  static const _width = 35.0;

  const TwoCardVertLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        Column(
          children: const [
            Spacer(),
            BoxWidget(
              width: _width,
              height: _width * 2,
              label: '1',
              fontSize: _width * 2 / 5,
            ),
            Divider(
              height: 10,
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
