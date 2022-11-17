import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

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
    execute((list) {
      final project = list[index];
      project.name = name;
      project.save();
    });
  }

  List<Project> findByName(String criteria) {
    return state.where((element) => element.name.contains(criteria)).toList();
  }

  void addNew() {
    execute((list) {
      final project = Project(name: 'No Name');
      final box = Hive.box<Project>(repoName);
      box.add(project);
      list.add(project);
    });
  }
}
