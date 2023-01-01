import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../database/entities/journal.dart';
import '../providers/project/open_project_provider.dart';
import '../providers/journals/open_journal_provider.dart';
import '../providers/journals/sorted_filtered_journal_list_provider.dart';
import '../providers/journals/journal_filter_text_provider.dart';
import '../providers/journals/journal_sort_condition_buttons_provider.dart';
import '../providers/journals/journal_sort_condition_provider.dart';
import '../providers/journals/journal_sort_order_buttons_provider.dart';
import '../providers/journals/journal_sort_order_provider.dart';
import '../providers/journals/journals_provider.dart';
import '../widgets/elements_sidebar.dart';
import '../widgets/in_place_editor.dart';
import '../widgets/toolbar.dart';

class ProjectPage extends ConsumerWidget {
  const ProjectPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final openProject = ref.watch(openProjectProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(openProject!.name),
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Expanded(
            flex: 1,
            child: ElementsSidebar(),
          ),
          const VerticalDivider(
            width: 2,
            thickness: 2,
          ),
          Expanded(
            flex: 3,
            child: Column(
              children: [
                Consumer(
                  builder:
                      (BuildContext context, WidgetRef ref, Widget? child) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Toolbar(
                        sortOrderButtonsProvider:
                            journalSortOrderButtonsProvider,
                        sortOrderProvider: journalSortOrderProvider,
                        sortConditionButtonsProvider:
                            journalSortConditionButtonsProvider,
                        sortConditionProvider: journalSortConditionProvider,
                        filterTextProvider: journalFilterTextProvider,
                      ),
                    );
                  },
                ),
                Consumer(
                  builder: (context, ref, child) {
                    final result = ref.watch(sortedFilteredJournalListProvider);

                    return result.when(
                      data: (data) {
                        return GridView.extent(
                          maxCrossAxisExtent: 150,
                          childAspectRatio: 0.75,
                          shrinkWrap: true,
                          children: data
                              .map(
                                (journal) => Dismissible(
                                  key: Key(journal.toString()),
                                  child: Card(
                                    color: Colors.green,
                                    child: InkWell(
                                      onTap: () {
                                        ref
                                            .read(openJournalProvider.notifier)
                                            .update((state) => journal);
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
                                              text: journal.name,
                                              onTextChanged: (newText) {
                                                final Journal renamedSpread =
                                                    journal.copyWith(
                                                  name: newText,
                                                  modifiedTimestamp: DateTime
                                                          .now()
                                                      .millisecondsSinceEpoch,
                                                );
                                                ref
                                                    .read(journalProvider(
                                                            renamedSpread
                                                                .elementId)
                                                        .notifier)
                                                    .save(renamedSpread);
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
                                      .read(journalProvider(journal.id!).notifier)
                                      .delete(journal),
                                ),
                              )
                              .toList(),
                        );
                      },
                      error: (error, stackTrace) => Text(
                        error.toString(),
                      ),
                      loading: () => const CircularProgressIndicator(),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
