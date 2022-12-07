import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tarot_stories/providers/project_repository_provider.dart';

import '../database/entities/project.dart';
import 'projects_in_memory_notifier_provider.dart';
import 'sort_condition_buttons_notifier.dart';
import 'sort_order_buttons_notifier.dart';

final projectSortOrderButtonsProvider =
    StateNotifierProvider<SortOrderButtonsNotifier, List<bool>>(
  (ref) => SortOrderButtonsNotifier(),
);

final projectSortConditionButtonsProvider =
    StateNotifierProvider<SortConditionButtonsNotifier, List<bool>>(
  (ref) => SortConditionButtonsNotifier(),
);

final projectFilterTextProvider = StateProvider<String>((ref) {
  return "";
});

final projectSortOrderProvider = StateProvider<SortOrder>((ref) {
  return SortOrder.descending;
});

final projectSortConditionProvider = StateProvider<SortCondition>((ref) {
  return SortCondition.dateModified;
});

final sortedFilteredProjectListProvider =
    FutureProvider<List<Project>>((ref) async {
  final condition = ref.watch(projectSortConditionProvider);
  final order = ref.watch(projectSortOrderProvider);
  final repo = ref.watch(projectRepositoryProvider);
  final notifier = ref.watch(inMemoryProjectsProvider.notifier);
  if (!notifier.isInitialized) {
    notifier.initialize(List.from(await repo.getAllSortedByName()));
  }
  final projects = ref.watch(inMemoryProjectsProvider);
  final filterPattern = ref.watch(projectFilterTextProvider);

  late final List<Project> sortedProjects;

  switch (condition) {
    case SortCondition.name:
      if (order == SortOrder.ascending) {
        sortedProjects = projects
          ..sort(
            (a, b) => a.name.compareTo(b.name),
          );
      } else {
        sortedProjects = projects
          ..sort(
            (b, a) => a.name.compareTo(b.name),
          );
      }
      break;
    case SortCondition.dateCreated:
      if (order == SortOrder.ascending) {
        sortedProjects = projects
          ..sort(
            (a, b) => a.createdTimestamp.compareTo(b.createdTimestamp),
          );
      } else {
        sortedProjects = projects
          ..sort(
            (b, a) => a.createdTimestamp.compareTo(b.createdTimestamp),
          );
      }
      break;
    case SortCondition.dateModified:
      if (order == SortOrder.ascending) {
        sortedProjects = projects
          ..sort(
            (a, b) => a.modifiedTimestamp.compareTo(b.modifiedTimestamp),
          );
      } else {
        sortedProjects = projects
          ..sort(
            (b, a) => a.modifiedTimestamp.compareTo(b.modifiedTimestamp),
          );
      }
      break;
  }

  return sortedProjects
      .where(
        (element) => element.name.contains(
          filterPattern,
        ),
      )
      .toList();
});
