import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../database/entities/project.dart';
import '../database/repository.dart';

final inMemoryProjectsProvider = StateNotifierProvider.family<
    InMemoryProjectsNotifier, List<Project>, Repository<Project>>((ref, repo) {
  return InMemoryProjectsNotifier(repo);
});

class InMemoryProjectsNotifier extends StateNotifier<List<Project>> {
  final Repository<Project> _repository;

  bool _initialized = false;

  InMemoryProjectsNotifier(Repository<Project> repo)
      : _repository = repo,
        super([]);

  bool get isInitialized => _initialized;

  void initialize(List<Project> initialList) {
    state = initialList;
    _initialized = true;
  }

  Future<void> addNew() async {
    final Project project = Project(
      name: 'No Name',
      synopsis: '',
      createdTimestamp: DateTime.now().millisecondsSinceEpoch,
      modifiedTimestamp: DateTime.now().millisecondsSinceEpoch,
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
