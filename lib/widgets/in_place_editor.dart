// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class InPlaceEditor extends StatefulWidget {
  String text;
  InPlaceEditor({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  State<InPlaceEditor> createState() => _InPlaceEditorState();
}

class _InPlaceEditorState extends State<InPlaceEditor> {
  bool _editable = false;
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController(text: widget.text);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_editable) {
      return TextField(
        controller: _controller,
        onSubmitted: (value) {
          setState(() {
            _editable = false;
            widget.text = _controller.text;
          });
        },
      );
    } else {
      return GestureDetector(
        onLongPress: () {
          setState(() {
            _editable = true;
          });
        },
        child: Text(widget.text),
      );
    }
  }
}
