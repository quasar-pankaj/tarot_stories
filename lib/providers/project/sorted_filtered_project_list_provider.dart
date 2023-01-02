import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../database/entities/project.dart';
import '../sort_condition_buttons_notifier.dart';
import '../sort_order_buttons_notifier.dart';
import 'project_filter_text_provider.dart';
import 'project_provider.dart';
import 'project_sort_condition_provider.dart';
import 'project_sort_order_provider.dart';

final sortedFilteredProjectListProvider =
    FutureProvider.autoDispose<Iterable<Project>>((ref) async {
  final condition = ref.watch(projectSortConditionProvider);
  final order = ref.watch(projectSortOrderProvider);

  final filterPattern = ref.watch(projectFilterTextProvider);

  final projects = (await ref.watch(projectsProvider.future)).toList();

  Iterable<Project> sortedProjects;
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

  return sortedProjects.where(
    (element) => element.name.contains(
      filterPattern,
    ),
  );
});
