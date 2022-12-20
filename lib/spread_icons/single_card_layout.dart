import 'package:flutter/material.dart';

import 'box_widget.dart';

class SingleCardLayout extends StatelessWidget {
  static const _width = 50.0;
  static const _height = _width * 3 / 2;
  static const _fontsize = _width * 2 / 5;

  final String _label1;

  const SingleCardLayout({
    super.key,
    required String label1,
  }) : _label1 = label1;

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
              height: _height,
              label: _label1,
              fontSize: _fontsize,
            ),
            const Spacer(),
          ],
        ),
        const Spacer(),
      ],
    );
  }
}
