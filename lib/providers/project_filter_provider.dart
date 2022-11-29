import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../database/project.dart';
import 'projects_in_memory_notifier_provider.dart';

final projectFilterProvider =
    StateNotifierProvider<ProjectNameFilterNotifier, List<Project>>((ref) {
  final projects = ref.watch(inMemoryProjectsProvider);
  return ProjectNameFilterNotifier(projects);
});

class ProjectNameFilterNotifier extends StateNotifier<List<Project>> {
  ProjectNameFilterNotifier(List<Project> projects) : super(projects);
  void filter(String pattern) {
    state = state.where((element) => element.name.contains(pattern)).toList();
  }
}
