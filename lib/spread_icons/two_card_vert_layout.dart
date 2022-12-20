import 'package:flutter/material.dart';
import 'package:tarot_stories/spread_icons/box_widget.dart';

class TwoCardVertLayout extends StatelessWidget {
  static const _width = 35.0;

  final String _label1, _label2;

  const TwoCardVertLayout({
    super.key,
    required String label1,
    required String label2,
  })  : _label1 = label1,
        _label2 = label2;

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
              height: 10,
            ),
            BoxWidget(
              width: _width,
              label: _label2,
            ),
            const Spacer(),
          ],
        ),
        const Spacer(),
      ],
    );
  }
}
