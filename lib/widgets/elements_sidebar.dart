// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tarot_stories/providers/elements/selected_element_provider.dart';

import '../database/entities/element.dart' as entities;
import '../database/entities/enum_element_type.dart';
import '../providers/elements/element_filter_by_type_providers.dart';
import '../providers/elements/elements_notifier_provider.dart';
import 'in_place_editor.dart';

class ElementsSidebar extends StatelessWidget {
  const ElementsSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: _items.length,
      itemBuilder: (context, index) => Consumer(
        builder: (context, ref, child) {
          final asyncChildren = ref.watch(_items[index].provider);
          return ExpansionTile(
            title: Row(
              children: [
                Text(_items[index].text),
                const Spacer(),
                IconButton(
                  onPressed: () => ref
                      .read(elementsProvider.notifier)
                      .addNew(_items[index].type),
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
            leading: Icon(_items[index].icon),
            children: asyncChildren.when(
              data: (data) => data
                  .map(
                    (e) => InkWell(
                      onTap: () =>
                          ref.read(selectedElementProvider.notifier).state = e,
                      child: Dismissible(
                        key: Key(e.toString()),
                        child: Card(
                          child: ListTile(
                            title: InPlaceEditor(
                              text: e.name,
                              onTextChanged: (newText) {
                                final entities.Element element =
                                    e.copyWith(name: newText);
                                ref
                                    .read(elementsProvider.notifier)
                                    .save(element);
                              },
                            ),
                            trailing: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.more_vert),
                            ),
                          ),
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
  FutureProvider<Iterable<entities.Element>> provider;
  _ListViewItem({
    required this.text,
    required this.type,
    required this.icon,
    required this.provider,
  });
}

List<_ListViewItem> _items = [
  _ListViewItem(
    text: 'Characters',
    type: ElementType.character,
    icon: Icons.face,
    provider: charactersFilterProvider,
  ),
  _ListViewItem(
    text: 'Scenes/Sequels',
    type: ElementType.scene,
    icon: Icons.picture_in_picture,
    provider: scenesFilterProvider,
  ),
  _ListViewItem(
    text: 'Places',
    type: ElementType.place,
    icon: Icons.house,
    provider: placesFilterProvider,
  ),
  _ListViewItem(
    text: 'Props',
    type: ElementType.prop,
    icon: Icons.pending_actions,
    provider: propsFilterProvider,
  ),
  _ListViewItem(
      text: 'Structure',
      type: ElementType.structure,
      icon: Icons.account_tree,
      provider: structuresFilterProvider),
  _ListViewItem(
    text: 'Relationships',
    type: ElementType.relationship,
    icon: Icons.link,
    provider: relationshipsFilterProvider,
  ),
  _ListViewItem(
    text: 'Detached Beats',
    type: ElementType.beat,
    icon: Icons.broken_image,
    provider: beatsFilterProvider,
  ),
  _ListViewItem(
    text: 'Uncategorised Stuff',
    type: ElementType.unassociated,
    icon: Icons.air,
    provider: unassociatedFilterProvider,
  ),
  _ListViewItem(
    text: 'Recycled',
    type: ElementType.recycled,
    icon: Icons.recycling,
    provider: recycledFilterProvider,
  ),
];
