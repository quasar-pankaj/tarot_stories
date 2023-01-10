import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../database/entities/journal.dart';
import '../pages/reading_page.dart';
import '../providers/journals/journal_filter_text_provider.dart';
import '../providers/journals/journal_sort_condition_buttons_provider.dart';
import '../providers/journals/journal_sort_condition_provider.dart';
import '../providers/journals/journal_sort_order_buttons_provider.dart';
import '../providers/journals/journal_sort_order_provider.dart';
import '../providers/journals/journals_provider.dart';
import '../providers/journals/open_journal_provider.dart';
import '../providers/journals/sorted_filtered_journal_list_provider.dart';
import 'in_place_editor.dart';
import 'readings_widget.dart';
import 'spread_widget.dart';
import 'toolbar.dart';

class JournalWidget extends StatelessWidget {
  const JournalWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Toolbar(
                sortOrderButtonsProvider: journalSortOrderButtonsProvider,
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
                                      return const ReadingPage(
                                        journal: ReadingsWidget(),
                                        spread: SpreadWidget(),
                                      );
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
                                      onTextChanged: (newText) async {
                                        final Journal renamedSpread =
                                            journal.copyWith(
                                          name: newText,
                                          modifiedTimestamp: DateTime.now()
                                              .millisecondsSinceEpoch,
                                        );
                                        await ref
                                            .read(journalProvider(
                                                    renamedSpread.elementId)
                                                .notifier)
                                            .save(renamedSpread);
                                      },
                                    ),
                                  ),
                                ),
                                child: journal.shape.widget,
                              ),
                            ),
                          ),
                          onDismissed: (direction) async => await ref
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
    );
  }
}
