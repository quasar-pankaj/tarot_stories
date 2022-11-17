import 'package:flutter/material.dart';

class CardFront extends StatelessWidget {
  final String _path;
  const CardFront({super.key, required String path}) : _path = path;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(8),
        width: 150.0,
        height: 247.0,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(_path),
          ),
        ),
      ),
    );
  }
}
