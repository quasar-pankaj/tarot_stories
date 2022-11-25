import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sembast/timestamp.dart';

import '../database/app_database.dart';
import '../database/project.dart';
import '../database/repository.dart';

final inMemoryProjectsProvider =
    StateNotifierProvider<InMemoryProjectsNotifier, List<Project>>((ref) {
  return InMemoryProjectsNotifier();
});

class InMemoryProjectsNotifier extends StateNotifier<List<Project>> {
  final Repository<Project> _repository =
      Repository(storeName: AppDatabase.projects);

  bool _initialized = false;

  InMemoryProjectsNotifier() : super([]);

  bool get isInitialized => _initialized;

  void initialize(List<Project> initialList) {
    state = initialList;
    _initialized = true;
  }

  Future<void> addNew() async {
    final Project project = Project(
      name: 'No Name',
      created:Timestamp.now(),
      modified:Timestamp.now(),
    );

    await add(project);
  }

  Future<void> add(Project project) async {
    final projects = [
      ...state,
      project,
    ];

    await _repository.insert(project);

    state = projects;
  }

  Future<void> remove(Project project) async {
    final projects = [
      ...state.where((element) => element.id != project.id).toList()
    ];

    await _repository.delete(project);

    state = projects;
  }

  Future<void> update(Project project) async {
    final projects = [
      ...state.where((element) => element.id != project.id).toList(),
      project,
    ];

    await _repository.update(project);

    state = projects;
  }
}
