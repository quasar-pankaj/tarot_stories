import 'package:flutter/material.dart';

class ElementsSidebar extends StatelessWidget {
  const ElementsSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        ExpansionTile(
          leading: const Icon(Icons.verified_user),
          title: const Text('Characters'),
          trailing: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          ),
          children: [],
        ),
        ExpansionTile(
          leading: const Icon(Icons.verified_user),
          title: const Text('Scenes'),
          trailing: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          ),
          children: [],
        ),
        ExpansionTile(
          leading: const Icon(Icons.verified_user),
          title: const Text('Places'),
          trailing: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          ),
          children: [],
        ),
        ExpansionTile(
          leading: const Icon(Icons.verified_user),
          title: const Text('Props'),
          trailing: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          ),
          children: [],
        ),
        ExpansionTile(
          leading: const Icon(Icons.verified_user),
          title: const Text('Structure'),
          trailing: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          ),
          children: [],
        ),
        ExpansionTile(
          leading: const Icon(Icons.verified_user),
          title: const Text('Detached Beats'),
          trailing: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          ),
          children: [],
        ),
        ExpansionTile(
          leading: const Icon(Icons.verified_user),
          title: const Text('Uncategorised Stuff'),
          trailing: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          ),
          children: [],
        ),
      ],
    );
  }
}
