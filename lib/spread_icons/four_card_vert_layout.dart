import 'package:flutter/material.dart';
import 'package:tarot_stories/spread_icons/box_widget.dart';

class FourCardVertLayout extends StatelessWidget {
  static const _width = 17.0;

  const FourCardVertLayout({super.key});

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
              height: 5,
            ),
            BoxWidget(
              width: _width,
              height: _width * 2,
              label: '2',
              fontSize: _width * 2 / 5,
            ),
            Divider(
              height: 5,
            ),
            BoxWidget(
              width: _width,
              height: _width * 2,
              label: '2',
              fontSize: _width * 2 / 5,
            ),
            Divider(
              height: 5,
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
