import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

import '../database/app_database.dart';
import '../database/project.dart';
import '../database/spread.dart';
import 'project_list_provider.dart';
import 'repository_provider.dart';

final projectNotifierProvider =
    StateNotifierProvider.family<ProjectNotifier, Project, int>((ref, index) {
  final watch = ref.watch(projectListProvider);
  return ProjectNotifier(
    index >= 0 ? watch[index] : Project(name: 'no name'),
    AppDatabase.projects,
  );
});

class ProjectNotifier extends RepositoryNotifier<Project> {
  ProjectNotifier(Project project, String entityName)
      : super(project, entityName);

  void rename(String name) {
    execute((entity) {
      entity.name = name;
      save();
    });
  }

  void load(String name) {
    final box = Hive.box<Project>(AppDatabase.projects);
    state = box.values.firstWhere((element) => element.name == name);
  }

  void loadWithKey(dynamic key) {
    final box = Hive.box<Project>(AppDatabase.projects);
    state = box.get(key)!;
  }

  List<Spread> get spreads {
    final project = state;
    return project.spreads.toList();
  }

  List<Spread> filterBy(String name) {
    return spreads.where((element) => element.name.contains(name)).toList();
  }
}
