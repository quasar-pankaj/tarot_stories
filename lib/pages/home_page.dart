import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tarot_stories/providers/open_project_provider.dart';

import '../database/entities/project.dart';
import '../providers/projects_in_memory_notifier_provider.dart';
import '../providers/project_sort_and_filter_providers.dart';
import '../widgets/in_place_editor.dart';
import '../widgets/toolbar.dart';
import 'page_base.dart';
import 'project_page.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PageBase(
      title: 'Tarot Stories',
      body: Column(
        children: [
          Toolbar(
            sortOrderButtonsProvider: projectSortOrderButtonsProvider,
            sortOrderProvider: projectSortOrderProvider,
            sortConditionButtonsProvider: projectSortConditionButtonsProvider,
            sortConditionProvider: projectSortConditionProvider,
            filterTextProvider: projectFilterTextProvider,
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
                        (project) => Dismissible(
                          key: Key(project.toString()),
                          child: Card(
                            color: Colors.green,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      ref
                                          .read(openProjectProvider.notifier)
                                          .update((state) => project);
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
                                            .read(inMemoryProjectsProvider
                                                .notifier)
                                            .update(renamedProject);
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
                              .remove(project),
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
