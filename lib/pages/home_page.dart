import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sembast/timestamp.dart';

import '../database/project.dart';
import '../providers/projects_in_memory_notifier_provider.dart';
import '../providers/sort_and_filter_providers.dart';
import '../widgets/in_place_editor.dart';
import '../widgets/sort_condition_buttons.dart';
import '../widgets/sort_order_buttons.dart';

class HomePage extends ConsumerWidget {
  final TextEditingController _controller = TextEditingController(text: '');
  HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Tarot Stories'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.sort),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.sort_by_alpha),
            ),
          ],
        ),
        drawer: Drawer(
          backgroundColor: const Color(0xffa2d2ff),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const UserAccountsDrawerHeader(
                accountName: Text('Tarot for Writers'),
                accountEmail: Text('quasar.pankaj@gmail.com'),
                currentAccountPicture: CircleAvatar(
                  child: Text('Tarot'),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: ((context, index) {
                    return Card(
                      color: const Color(0xffffc8dd),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: ListTile(
                        title: Text('Hello World $index'),
                      ),
                    );
                  }),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(12.0),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Text('An App for Writers © Pankaj Agarwal'),
                ),
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            Row(
              children: [
                const Spacer(),
                Expanded(
                  child: ListTile(
                    leading: const Icon(Icons.search),
                    trailing: IconButton(
                      onPressed: () => _controller.clear(),
                      icon: const Icon(Icons.close),
                    ),
                    title: TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter text to search',
                        hintText: 'Search',
                      ),
                      controller: _controller,
                      onChanged: (value) => ref
                          .read(filterTextProvider.notifier)
                          .update((state) => value),
                    ),
                  ),
                ),
                const SortOrderButtons(),
                const VerticalDivider(
                  color: Colors.amber,
                  width: 10.0,
                  thickness: 5.5,
                ),
                const SortConditionButtons(),
              ],
            ),
            Consumer(
              builder: (context, ref, child) {
                final result = ref.watch(sortedFilteredListProvider);

                return result.when(
                    data: (data) => GridView.extent(
                          shrinkWrap: true,
                          maxCrossAxisExtent: 150,
                          childAspectRatio: 0.75,
                          children: data
                              .map(
                                (e) => Dismissible(
                                  key: Key(e.toString()),
                                  child: Card(
                                    color: Colors.green,
                                    child: GridTile(
                                      footer: Center(
                                        child: InPlaceEditor(
                                          text: e.name,
                                          onTextChanged: (newText) {
                                            final Project project = e.copyWith(
                                              name: newText,
                                              modified: Timestamp.now(),
                                              withId: true,
                                            );
                                            ref
                                                .read(inMemoryProjectsProvider
                                                    .notifier)
                                                .update(project);
                                          },
                                        ),
                                      ),
                                      child: const Icon(
                                        Icons.analytics_outlined,
                                        size: 80.6,
                                        color: Colors.yellowAccent,
                                      ),
                                    ),
                                  ),
                                  onDismissed: (direction) => ref
                                      .read(inMemoryProjectsProvider.notifier)
                                      .remove(e),
                                ),
                              )
                              .toList(),
                        ),
                    error: (error, stackTrace) => Text(error.toString()),
                    loading: () => const CircularProgressIndicator());
              },
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (() =>
              ref.read(inMemoryProjectsProvider.notifier).addNew()),
          tooltip: 'Add new Project',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
