import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../database/app_database.dart';
import '../database/project.dart';
import 'repository_list_provider.dart';

final projectListProvider =
    StateNotifierProvider<ProjectListNotifier, List<Project>>((ref) {
  return ProjectListNotifier();
});

class ProjectListNotifier extends RepositoryListNotifier<Project> {
  ProjectListNotifier() : super([], AppDatabase.projects);

  void rename(int index, String name) {
    execute((list, repo) async {
      final project = list[index];
      project.name = name;
      await repo.update(project);
    });
  }

  List<Project> findByName(String criteria) {
    return state.where((element) => element.name.contains(criteria)).toList();
  }

  void addNew() {
    execute((list, repo) async {
      final project = Project(name: 'No Name');
      project.id = await repo.insert(project);
      list.add(project);
    });
  }
}
