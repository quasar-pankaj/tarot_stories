import 'package:flutter/material.dart';
import 'package:tarot_stories/spread_icons/box_widget.dart';

class ThreeCardVertLayout extends StatelessWidget {
  static const _width = 20.0;

  final String _label1, _label2, _label3;

  const ThreeCardVertLayout({
    super.key,
    required String label1,
    required String label2,
    required String label3,
  })  : _label1 = label1,
        _label2 = label2,
        _label3 = label3;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        Column(
          children: [
            const Spacer(),
            BoxWidget(
              width: _width,
              label: _label1,
            ),
            const Divider(
              height: 5,
            ),
            BoxWidget(
              width: _width,
              label: _label2,
            ),
            const Divider(
              height: 5,
            ),
            BoxWidget(
              width: _width,
              label: _label3,
            ),
            const Spacer(),
          ],
        ),
        const Spacer(),
      ],
    );
  }
}
