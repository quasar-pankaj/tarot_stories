import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tarot_stories/providers/project_repository_provider.dart';

import '../database/project.dart';
import 'projects_in_memory_notifier_provider.dart';

final projectSortOrderButtonsProvider =
    StateNotifierProvider<ProjectSortOrderButtonsNotifier, List<bool>>(
        (ref) => ProjectSortOrderButtonsNotifier());

class ProjectSortOrderButtonsNotifier extends StateNotifier<List<bool>> {
  ProjectSortOrderButtonsNotifier() : super(<bool>[true, false]);

  void onSelected(int index) {
    List<bool> selected = [...state];

    for (int i = 0; i < state.length; i++) {
      selected[i] = i == index;
    }

    state = selected;
  }
}

final projectSortConditionButtonsProvider =
    StateNotifierProvider<ProjectSortConditionButtonsNotifier, List<bool>>(
        (ref) => ProjectSortConditionButtonsNotifier());

class ProjectSortConditionButtonsNotifier extends StateNotifier<List<bool>> {
  ProjectSortConditionButtonsNotifier() : super(<bool>[false, false, true]);

  void onSelected(int index) {
    List<bool> selected = [...state];

    for (int i = 0; i < state.length; i++) {
      selected[i] = i == index;
    }

    state = selected;
  }
}

final projectFilterTextProvider = StateProvider<String>((ref) {
  return "";
});

enum ProjectSortOrder {
  descending,
  ascending,
}

enum ProjectSortCondition {
  name,
  dateCreated,
  dateModified,
}

final projectSortOrderProvider = StateProvider<ProjectSortOrder>((ref) {
  return ProjectSortOrder.descending;
});

final projectSortConditionProvider = StateProvider<ProjectSortCondition>((ref) {
  return ProjectSortCondition.dateModified;
});

final sortedFilteredProjectListProvider =
    FutureProvider<List<Project>>((ref) async {
  final condition = ref.watch(projectSortConditionProvider);
  final order = ref.watch(projectSortOrderProvider);
  final notifier = ref.watch(inMemoryProjectsProvider.notifier);
  if (!notifier.isInitialized) {
    final repo = ref.watch(projectRepositoryProvider);
    notifier.initialize(List.from(await repo.getAllSortedByName()));
  }
  final projects = ref.watch(inMemoryProjectsProvider);
  final filterPattern = ref.watch(projectFilterTextProvider);

  late final List<Project> sortedProjects;

  switch (condition) {
    case ProjectSortCondition.name:
      if (order == ProjectSortOrder.ascending) {
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
    case ProjectSortCondition.dateCreated:
      if (order == ProjectSortOrder.ascending) {
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
    case ProjectSortCondition.dateModified:
      if (order == ProjectSortOrder.ascending) {
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
