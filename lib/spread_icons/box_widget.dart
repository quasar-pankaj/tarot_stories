import 'package:flutter/material.dart';

import 'box.dart';

class BoxWidget extends StatelessWidget {
  final double _width;
  final double _height;
  final String _label;
  final double _fontSize;

  const BoxWidget({
    super.key,
    required double width,
    required double height,
    required String label,
    required double fontSize,
  })  : _height = height,
        _width = width,
        _label = label,
        _fontSize = fontSize;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: Box(),
      child: Center(
        child: SizedBox(
          width: _width,
          height: _height,
          child: Center(
            child: Text(
              _label,
              style: TextStyle(fontSize: _fontSize),
            ),
          ),
        ),
      ),
    );
  }
}
