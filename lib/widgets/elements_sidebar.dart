import 'package:flutter/material.dart';

class ElementsSidebar extends StatelessWidget {
  const ElementsSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: const [
        ExpansionTile(
          leading: Icon(Icons.face),
          title: Text('Characters'),
          children: [],
        ),
        ExpansionTile(
          leading: Icon(Icons.picture_in_picture),
          title: Text('Scenes/Sequels'),
          children: [],
        ),
        ExpansionTile(
          leading: Icon(Icons.house),
          title: Text('Places'),
          children: [],
        ),
        ExpansionTile(
          leading: Icon(Icons.pending_actions),
          title: Text('Props'),
          children: [],
        ),
        ExpansionTile(
          leading: Icon(Icons.account_tree),
          title: Text('Structure'),
          children: [],
        ),
        ExpansionTile(
          leading: Icon(Icons.link),
          title: Text('Relationships'),
          children: [],
        ),
        ExpansionTile(
          leading: Icon(Icons.broken_image),
          title: Text('Detached Beats'),
          children: [],
        ),
        ExpansionTile(
          leading: Icon(Icons.air),
          title: Text('Uncategorised Stuff'),
          children: [],
        ),
        ExpansionTile(
          leading: Icon(Icons.recycling),
          title: Text('Recycled'),
          children: [],
        ),
      ],
    );
  }
}
