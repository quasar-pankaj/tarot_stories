import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../database/project.dart';
import 'project_repository_provider.dart';
import 'projects_in_memory_notifier_provider.dart';

final projectsListProvider = FutureProvider<List<Project>>((ref) async {
  final inMemoryProjectsNotifier = ref.watch(inMemoryProjectsProvider.notifier);

  if (!inMemoryProjectsNotifier.isInitialized) {
    final repo = ref.watch(projectRepositoryProvider);
    final List<Project> projects = List.from(
      await repo.getAllSortedByName(
        ascending: false,
      ),
    );
    inMemoryProjectsNotifier.initialize(projects);
  }

  final inMemoryProjects = ref.watch(inMemoryProjectsProvider);
  return inMemoryProjects;
});

final sortAscendingByNameProjectsProvider = Provider<List<Project>>((ref) {
  final inMemoryProjects = ref.watch(inMemoryProjectsProvider);

  return inMemoryProjects
    ..sort(
      (a, b) => a.name.compareTo(b.name),
    );
});

final sortDescendingByNameProjectsProvider = Provider<List<Project>>((ref) {
  final inMemoryProjects = ref.watch(inMemoryProjectsProvider);

  return inMemoryProjects
    ..sort(
      (a, b) => b.name.compareTo(a.name),
    );
});

final sortAscendingByCreatedDateProjectsProvider =
    Provider<List<Project>>((ref) {
  final inMemoryProjects = ref.watch(inMemoryProjectsProvider);

  return inMemoryProjects
    ..sort(
      (a, b) => a.created.compareTo(b.created),
    );
});

final sortDescendingByCreatedDateProjectsProvider =
    Provider<List<Project>>((ref) {
  final inMemoryProjects = ref.watch(inMemoryProjectsProvider);

  return inMemoryProjects
    ..sort(
      (a, b) => b.created.compareTo(a.created),
    );
});

final sortAscendingByModifiedDateProjectsProvider =
    Provider<List<Project>>((ref) {
  final inMemoryProjects = ref.watch(inMemoryProjectsProvider);

  return inMemoryProjects
    ..sort(
      (a, b) => a.modified.compareTo(b.modified),
    );
});

final sortDescendingByModifiedDateProjectsProvider =
    Provider<List<Project>>((ref) {
  final inMemoryProjects = ref.watch(inMemoryProjectsProvider);

  return inMemoryProjects
    ..sort(
      (a, b) => b.modified.compareTo(a.modified),
    );
});

final projectNameFilterProvider =
    Provider.family<List<Project>, String>((ref, pattern) {
  final projects = ref.watch(inMemoryProjectsProvider);
  return projects.where((element) => element.name.contains(pattern)).toList();
});
