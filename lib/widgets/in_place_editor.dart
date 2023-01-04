// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class InPlaceEditor extends StatefulWidget {
  String _text;
  final void Function(String newText)? _onTextChanged;
  InPlaceEditor({
    Key? key,
    required String text,
    void Function(String newText)? onTextChanged,
  })  : _text = text,
        _onTextChanged = onTextChanged,
        super(key: key);

  @override
  State<InPlaceEditor> createState() => _InPlaceEditorState();
}

class _InPlaceEditorState extends State<InPlaceEditor> {
  bool _editable = false;
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController(text: widget._text);
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
            widget._text = _controller.text;
            widget._onTextChanged?.call(_controller.text);
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
        child: Text(
          widget._text,
        ),
      );
    }
  }
}
