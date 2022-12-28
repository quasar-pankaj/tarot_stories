import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../database/entities/enum_spread_category.dart';
import '../database/entities/spread.dart';
import '../providers/project/open_project_provider.dart';
import '../providers/spreads/open_spread_provider.dart';
import '../providers/spreads/sorted_filtered_spread_list_provider.dart';
import '../providers/spreads/spread_category_provider.dart';
import '../providers/spreads/spread_filter_text_provider.dart';
import '../providers/spreads/spread_sort_condition_buttons_provider.dart';
import '../providers/spreads/spread_sort_condition_provider.dart';
import '../providers/spreads/spread_sort_order_buttons_provider.dart';
import '../providers/spreads/spread_sort_order_provider.dart';
import '../providers/spreads/spreads_provider.dart';
import '../widgets/elements_sidebar.dart';
import '../widgets/in_place_editor.dart';
import '../widgets/spread_dialog.dart';
import '../widgets/toolbar.dart';
import 'page_base.dart';

class ProjectPage extends ConsumerWidget {
  const ProjectPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final openProject = ref.watch(openProjectProvider);

    return PageBase(
      title: openProject!.name,
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
                            spreadSortOrderButtonsProvider,
                        sortOrderProvider: spreadSortOrderProvider,
                        sortConditionButtonsProvider:
                            spreadSortConditionButtonsProvider,
                        sortConditionProvider: spreadSortConditionProvider,
                        filterTextProvider: spreadFilterTextProvider,
                        optionalWidget: DropdownButton<SpreadCategory>(
                          items: SpreadCategory.values
                              .map(
                                (filter) => DropdownMenuItem<SpreadCategory>(
                                  value: filter,
                                  child: Text(
                                    filter.toString(),
                                  ),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            ref
                                .read(spreadCategoryProvider.notifier)
                                .update((state) => value!);
                          },
                          value: ref.watch(spreadCategoryProvider),
                        ),
                      ),
                    );
                  },
                ),
                Consumer(
                  builder: (context, ref, child) {
                    final result = ref.watch(sortedFilteredSpreadListProvider);

                    return result.when(
                      data: (data) {
                        return GridView.extent(
                          maxCrossAxisExtent: 150,
                          childAspectRatio: 0.75,
                          shrinkWrap: true,
                          children: data
                              .map(
                                (spread) => Dismissible(
                                  key: Key(spread.toString()),
                                  child: Card(
                                    color: Colors.green,
                                    child: InkWell(
                                      onTap: () {
                                        ref
                                            .read(openSpreadProvider.notifier)
                                            .update((state) => spread);
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
                                              text: spread.name,
                                              onTextChanged: (newText) {
                                                final Spread renamedSpread =
                                                    spread.copyWith(
                                                  name: newText,
                                                  modifiedTimestamp: DateTime
                                                          .now()
                                                      .millisecondsSinceEpoch,
                                                );
                                                ref
                                                    .read(
                                                        spreadProvider.notifier)
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
                                      .read(spreadProvider.notifier)
                                      .delete(spread),
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
      fabIcon: Icons.add,
      fabToolTip: 'Add New Spread',
      onFABPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return const SpreadDialog();
          },
        );
      },
    );
  }
}
