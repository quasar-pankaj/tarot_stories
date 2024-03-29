import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tarot_stories/providers/project/open_project_provider.dart';

import '../database/entities/element.dart' as entities;
import '../database/entities/enum_journal_category.dart';
import '../providers/elements/element_filter_by_type_providers.dart';
import '../providers/elements/elements_provider.dart';
import '../providers/elements/selected_element_provider.dart';
import '../providers/journals/journals_provider.dart';
import '../providers/journals/open_journal_provider.dart';
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
          final selectedElement = ref.watch(selectedElementProvider);
          return ExpansionTile(
            title: Row(
              children: [
                Text(_items[index].text),
                const Spacer(),
                IconButton(
                  onPressed: () async {
                    final openProject = ref.read(openProjectProvider)!;
                    await ref
                        .read(elementsProvider(openProject.id!).notifier)
                        .addNew(_items[index].type);
                  },
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
            leading: Icon(_items[index].icon),
            children: asyncChildren.when(
              data: (data) => data
                  .map(
                    (element) => InkWell(
                      onTap: () => ref
                          .read(selectedElementProvider.notifier)
                          .state = element,
                      child: Dismissible(
                        onDismissed: (direction) async {
                          final openProject = ref.read(openProjectProvider)!;
                          await ref
                              .read(elementsProvider(openProject.id!).notifier)
                              .delete(element);
                        },
                        key: Key(element.toString()),
                        child: Card(
                          child: ListTile(
                            selectedColor: Colors.blue[400],
                            selectedTileColor: Colors.amber[50],
                            selected: selectedElement == element,
                            title: InPlaceEditor(
                              text: element.name,
                              onTextChanged: (newText) async {
                                final openProject =
                                    ref.read(openProjectProvider)!;
                                await ref
                                    .read(elementsProvider(openProject.id!)
                                        .notifier)
                                    .save(element.copyWith(name: newText));
                              },
                            ),
                            trailing: PopupMenuButton(
                              itemBuilder: (context) => _items[index]
                                  .type
                                  .spreads
                                  .map(
                                    (shape) => PopupMenuItem(
                                      onTap: () async {
                                        final journal = await ref
                                            .read(journalProvider(element.id!)
                                                .notifier)
                                            .addNew(shape);
                                        ref
                                            .read(openJournalProvider.notifier)
                                            .state = journal;
                                        ref
                                            .read(selectedElementProvider
                                                .notifier)
                                            .state = element;
                                      },
                                      value: shape,
                                      child: Text(
                                        shape.toString(),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
              error: (error, stackTrace) => [
                Text(
                  error.toString(),
                ),
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
  JournalCategory type;
  IconData icon;
  AutoDisposeFutureProvider<Iterable<entities.Element>> provider;
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
    type: JournalCategory.character,
    icon: Icons.face,
    provider: charactersFilterProvider,
  ),
  _ListViewItem(
    text: 'Scenes/Sequels',
    type: JournalCategory.sceneSequel,
    icon: Icons.picture_in_picture,
    provider: scenesFilterProvider,
  ),
  _ListViewItem(
    text: 'Places',
    type: JournalCategory.location,
    icon: Icons.house,
    provider: placesFilterProvider,
  ),
  _ListViewItem(
    text: 'Props',
    type: JournalCategory.prop,
    icon: Icons.pending_actions,
    provider: propsFilterProvider,
  ),
  _ListViewItem(
      text: 'Structure',
      type: JournalCategory.structure,
      icon: Icons.account_tree,
      provider: structuresFilterProvider),
  _ListViewItem(
    text: 'Relationships',
    type: JournalCategory.relationship,
    icon: Icons.link,
    provider: relationshipsFilterProvider,
  ),
  // _ListViewItem(
  //   text: 'Detached Beats',
  //   type: JournalCategory.,
  //   icon: Icons.broken_image,
  //   provider: beatsFilterProvider,
  // ),
  // _ListViewItem(
  //   text: 'Uncategorised Stuff',
  //   type: JournalCategory.unassociated,
  //   icon: Icons.air,
  //   provider: unassociatedFilterProvider,
  // ),
  // _ListViewItem(
  //   text: 'Recycled',
  //   type: JournalCategory.recycled,
  //   icon: Icons.recycling,
  //   provider: recycledFilterProvider,
  // ),
];
