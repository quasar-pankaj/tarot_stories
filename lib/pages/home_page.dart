import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../database/entities/project.dart';
import '../providers/projects_in_memory_notifier_provider.dart';
import '../providers/project_sort_and_filter_providers.dart';
import '../widgets/in_place_editor.dart';
import '../widgets/project_sort_condition_buttons.dart';
import '../widgets/project_sort_order_buttons.dart';
import 'page_base.dart';
import 'project_page.dart';

class HomePage extends ConsumerWidget {
  final TextEditingController _controller = TextEditingController(text: '');
  HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PageBase(
      title: 'Tarot Stories',
      body: Column(
        children: [
          Row(
            children: [
              const Spacer(),
              Expanded(
                child: ListTile(
                  leading: const Icon(Icons.search),
                  trailing: IconButton(
                    onPressed: _controller.clear,
                    icon: const Icon(
                      Icons.close,
                    ),
                  ),
                  title: TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter text to search',
                      hintText: 'Search',
                    ),
                    controller: _controller,
                    onChanged: (value) =>
                        ref.read(projectFilterTextProvider.notifier).update(
                              (state) => value,
                            ),
                  ),
                ),
              ),
              const ProjectSortOrderButtons(),
              const VerticalDivider(
                color: Colors.amber,
                width: 10.0,
                thickness: 5.5,
              ),
              const ProjectSortConditionButtons(),
            ],
          ),
          Consumer(
            builder: (context, ref, child) {
              final result = ref.watch(sortedFilteredProjectListProvider);

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
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const ProjectPage(),
                                  ),
                                );
                              },
                              child: GridTile(
                                header: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: InPlaceEditor(
                                      text: e.name,
                                      onTextChanged: (newText) {
                                        final Project project = e.copyWith(
                                          name: newText,
                                          modifiedTimestamp: DateTime.now()
                                              .millisecondsSinceEpoch,
                                        );
                                        ref
                                            .read(inMemoryProjectsProvider
                                                .notifier)
                                            .update(project);
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
                              .read(inMemoryProjectsProvider.notifier)
                              .remove(e),
                        ),
                      )
                      .toList(),
                ),
                error: (error, stackTrace) => Text(
                  error.toString(),
                ),
                loading: () => const CircularProgressIndicator(),
              );
            },
          ),
        ],
      ),
      fabIcon: Icons.add,
      fabToolTip: 'Add new Project',
      onFABPressed: () async =>
          await ref.read(inMemoryProjectsProvider.notifier).addNew(),
    );
  }
}
