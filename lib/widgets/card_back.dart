import 'package:flutter/material.dart';

class CardBack extends StatelessWidget {
  final String _index;

  const CardBack({
    super.key,
    required String index,
  }) : _index = index;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(8),
        width: 150.0,
        height: 247.0,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('assets/tarot/back.jpg'),
          ),
        ),
        child: Center(
          child: Stack(
            children: [
              Container(
                color: Colors.white,
                width: 20,
                height: 20,
              ),
              CircleAvatar(
                child: Text(_index),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
