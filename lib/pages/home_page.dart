import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../database/entities/project.dart';
import '../providers/project/open_project_provider.dart';
import '../providers/project/project_filter_text_provider.dart';
import '../providers/project/project_provider.dart';
import '../providers/project/project_sort_condition_buttons_provider.dart';
import '../providers/project/project_sort_condition_provider.dart';
import '../providers/project/project_sort_order_buttons_provider.dart';
import '../providers/project/project_sort_order_provider.dart';
import '../providers/project/sorted_filtered_project_list_provider.dart';
import '../widgets/in_place_editor.dart';
import '../widgets/toolbar.dart';
import 'project_page.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Tarot Stories'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.settings),
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Toolbar(
                sortOrderButtonsProvider: projectSortOrderButtonsProvider,
                sortOrderProvider: projectSortOrderProvider,
                sortConditionButtonsProvider:
                    projectSortConditionButtonsProvider,
                sortConditionProvider: projectSortConditionProvider,
                filterTextProvider: projectFilterTextProvider,
              ),
            ),
            Consumer(
              builder: (context, ref, child) {
                final result = ref.watch(sortedFilteredProjectListProvider);

                ref.listen(
                  projectsProvider(-1),
                  (previous, next) {
                    if (previous == null || previous.value == null) return;
                    if (next.value!.length < previous.value!.length) {
                      final diff = previous.value?.where(
                        (element) => !next.value!.contains(element),
                      );
                      final deleted = diff!.first;
                      final snackbar = SnackBar(
                        content: Text('Deleting ${deleted.name}...'),
                        action: SnackBarAction(
                          label: 'Undo',
                          onPressed: () async => await ref
                              .read(projectsProvider(-1).notifier)
                              .add(deleted),
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackbar);
                    }
                  },
                );

                return result.when(
                  data: (data) => GridView.extent(
                    shrinkWrap: true,
                    maxCrossAxisExtent: 150,
                    childAspectRatio: 0.75,
                    children: data
                        .map(
                          (project) => Dismissible(
                            key: Key(project.toString()),
                            child: Card(
                              color: Colors.green,
                              child: InkWell(
                                onTap: () {
                                  ref
                                      .read(openProjectProvider.notifier)
                                      .update((state) => project);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return const ProjectPage();
                                      },
                                    ),
                                  );
                                },
                                child: GridTile(
                                  header: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: InPlaceEditor(
                                        text: project.name,
                                        onTextChanged: (newText) {
                                          final Project renamedProject =
                                              project.copyWith(
                                            name: newText,
                                            modifiedTimestamp: DateTime.now()
                                                .millisecondsSinceEpoch,
                                          );
                                          ref
                                              .read(
                                                  projectsProvider(-1).notifier)
                                              .save(renamedProject);
                                        },
                                      ),
                                    ),
                                  ),
                                  child: const Icon(
                                    Icons.analytics_outlined,
                                    size: 80.6,
                                    color: Colors.yellowAccent,
                                  ),
                                ),
                              ),
                            ),
                            onDismissed: (direction) => ref
                                .read(projectsProvider(-1).notifier)
                                .delete(project),
                          ),
                        )
                        .toList(),
                  ),
                  error: (Object error, StackTrace stackTrace) => Center(
                    child: Text(
                      error.toString(),
                    ),
                  ),
                  loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              },
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async =>
              await ref.read(projectsProvider(-1).notifier).addNew(),
          tooltip: 'Press to add new project',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
