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
    double? height,
    required String label,
    double? fontSize,
  })  : _height = height ?? width * 3 / 2,
        _width = width,
        _label = label,
        _fontSize = fontSize ?? width * 2 / 5;

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
