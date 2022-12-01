import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tarot_stories/providers/project_repository_provider.dart';

import '../database/project.dart';
import 'projects_in_memory_notifier_provider.dart';

final sortOrderButtonsProvider =
    StateNotifierProvider<SortOrderButtonsNotifier, List<bool>>(
        (ref) => SortOrderButtonsNotifier());

class SortOrderButtonsNotifier extends StateNotifier<List<bool>> {
  SortOrderButtonsNotifier() : super(<bool>[true, false]);

  void onSelected(int index) {
    List<bool> selected = [...state];

    for (int i = 0; i < state.length; i++) {
      selected[i] = i == index;
    }

    state = selected;
  }
}

final sortConditionButtonsProvider =
    StateNotifierProvider<SortConditionButtonsNotifier, List<bool>>(
        (ref) => SortConditionButtonsNotifier());

class SortConditionButtonsNotifier extends StateNotifier<List<bool>> {
  SortConditionButtonsNotifier() : super(<bool>[true, false, false]);

  void onSelected(int index) {
    List<bool> selected = [...state];

    for (int i = 0; i < state.length; i++) {
      selected[i] = i == index;
    }

    state = selected;
  }
}

final filterTextProvider = StateProvider<String>((ref) {
  return "";
});

enum SortOrder {
  ascending,
  descending,
}

enum SortCondition {
  name,
  dateCreated,
  dateModified,
}

final sortOrderProvider = StateProvider<SortOrder>((ref) {
  return SortOrder.descending;
});

final sortConditionProvider = StateProvider<SortCondition>((ref) {
  return SortCondition.dateModified;
});

final sortedFilteredListProvider = FutureProvider<List<Project>>((ref) async {
  final condition = ref.watch(sortConditionProvider);
  final order = ref.watch(sortOrderProvider);
  final notifier = ref.watch(inMemoryProjectsProvider.notifier);
  if (!notifier.isInitialized) {
    final repo = ref.watch(projectRepositoryProvider);
    notifier.initialize(List.from(await repo.getAllSortedByName()));
  }
  final projects = ref.watch(inMemoryProjectsProvider);
  final filterPattern = ref.watch(filterTextProvider);

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
            (a, b) => a.created.compareTo(b.created),
          );
      } else {
        sortedProjects = projects
          ..sort(
            (b, a) => a.created.compareTo(b.created),
          );
      }
      break;
    case SortCondition.dateModified:
      if (order == SortOrder.ascending) {
        sortedProjects = projects
          ..sort(
            (a, b) => a.modified.compareTo(b.modified),
          );
      } else {
        sortedProjects = projects
          ..sort(
            (b, a) => a.modified.compareTo(b.modified),
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
