import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sembast/timestamp.dart';

import '../database/project.dart';
import '../providers/misc_providers.dart';
import '../providers/project_filter_provider.dart';
import '../providers/projects_in_memory_notifier_provider.dart';
import '../widgets/in_place_editor.dart';
import '../widgets/sort_condition_buttons.dart';
import '../widgets/sort_order_buttons.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: EasySearchBar(
            title: const Text('Tarot Stories'),
            onSearch: (value) => ref
                .read(
                  projectFilterProvider.notifier,
                )
                .filter(value),
          ),
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
              children: const [
                SortOrderButtons(),
                VerticalDivider(
                  color: Colors.amber,
                  width: 30.0,
                  thickness: 25.5,
                ),
                SortConditionButtons(),
              ],
            ),
            Consumer(
              builder: (context, ref, child) {
                final result = ref.watch(projectsListProvider);

                return result.when(
                  data: (data) => GridView.extent(
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
                                          .read(
                                              inMemoryProjectsProvider.notifier)
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
                  loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
                );
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
