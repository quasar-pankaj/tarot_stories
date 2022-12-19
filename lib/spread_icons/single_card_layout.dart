import 'package:flutter/material.dart';

import 'box_widget.dart';

class SingleCardLayout extends StatelessWidget {
  static const _width = 50.0;

  const SingleCardLayout({super.key});

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
              height: 2 * _width,
              label: '1',
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
