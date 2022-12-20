import 'package:flutter/material.dart';
import 'package:tarot_stories/spread_icons/box_widget.dart';

class FourCardHorizLayout extends StatelessWidget {
  static const _width = 40.0;

  final String _label1, _label2, _label3, _label4;

  const FourCardHorizLayout({
    super.key,
    required String label1,
    required String label2,
    required String label3,
    required String label4,
  })  : _label1 = label1,
        _label2 = label2,
        _label3 = label3,
        _label4 = label4;

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
              label: _label1,
            ),
            const VerticalDivider(
              width: 10,
            ),
            BoxWidget(
              width: _width,
              label: _label2,
            ),
            const VerticalDivider(
              width: 10,
            ),
            BoxWidget(
              width: _width,
              label: _label3,
            ),
            const VerticalDivider(
              width: 10,
            ),
            BoxWidget(
              width: _width,
              label: _label4,
            ),
            const Spacer(),
          ],
        ),
        const Spacer(),
      ],
    );
  }
}
