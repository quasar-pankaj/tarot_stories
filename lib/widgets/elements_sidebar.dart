// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../database/entities/enum_element_type.dart';
import '../providers/elements_in_memory_notifier_provider.dart';
import 'in_place_editor.dart';
import '../database/entities/element.dart' as entities;

class ElementsSidebar extends StatelessWidget {
  const ElementsSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: _items.length,
      itemBuilder: (context, index) => Consumer(
        builder: (context, ref, child) {
          final children = ref.watch(elementsProvider(_items[index].type));
          return ExpansionTile(
            title: Row(
              children: [
                Text(_items[index].text),
                const Spacer(),
                IconButton(
                  onPressed: () => ref
                      .read(elementsProvider(_items[index].type).notifier)
                      .addNew(),
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
            leading: Icon(_items[index].icon),
            children: children.when(
              data: (data) => data
                  .map(
                    (e) => Dismissible(
                      key: Key(e.toString()),
                      child: ListTile(
                        title: InPlaceEditor(
                          text: e.name,
                          onTextChanged: (newText) {
                            final entities.Element element =
                                e.copyWith(name: newText);
                            ref
                                .read(elementsProvider(_items[index].type)
                                    .notifier)
                                .update(element);
                          },
                        ),
                      ),
                    ),
                  )
                  .toList(),
              error: (error, stackTrace) => [
                const Text('Error occured'),
              ],
              loading: () => [
                const CircularProgressIndicator(),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _ListViewItem {
  String text;
  ElementType type;
  IconData icon;
  _ListViewItem({
    required this.text,
    required this.type,
    required this.icon,
  });
}

List<_ListViewItem> _items = [
  _ListViewItem(
    text: 'Characters',
    type: ElementType.character,
    icon: Icons.face,
  ),
  _ListViewItem(
    text: 'Scenes/Sequels',
    type: ElementType.scene,
    icon: Icons.picture_in_picture,
  ),
  _ListViewItem(
    text: 'Places',
    type: ElementType.place,
    icon: Icons.house,
  ),
  _ListViewItem(
    text: 'Props',
    type: ElementType.prop,
    icon: Icons.pending_actions,
  ),
  _ListViewItem(
    text: 'Structure',
    type: ElementType.structure,
    icon: Icons.account_tree,
  ),
  _ListViewItem(
    text: 'Relationships',
    type: ElementType.relationship,
    icon: Icons.link,
  ),
  _ListViewItem(
    text: 'Detached Beats',
    type: ElementType.beat,
    icon: Icons.broken_image,
  ),
  _ListViewItem(
    text: 'Uncategorised Stuff',
    type: ElementType.unassociated,
    icon: Icons.air,
  ),
  _ListViewItem(
    text: 'Recycled',
    type: ElementType.recycled,
    icon: Icons.recycling,
  ),
];
