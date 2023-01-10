import 'package:flutter/material.dart';

class ReadingPage extends StatelessWidget {
  final Widget _spread;
  final Widget _journal;

  const ReadingPage({
    super.key,
    required Widget spread,
    required Widget journal,
  })  : _journal = journal,
        _spread = spread;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Readings'),
        ),
        body: Row(
          children: [
            Expanded(
              flex: 3,
              child: FittedBox(
                child: InteractiveViewer(
                  child: _spread,
                ),
              ),
            ),
            const VerticalDivider(
              width: 3,
              thickness: 3,
            ),
            Expanded(
              flex: 2,
              child: _journal,
            ),
          ],
        ),
      ),
    );
  }
}
