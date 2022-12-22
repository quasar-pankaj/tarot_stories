import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../database/entities/project.dart';
import '../database/repository.dart';
import 'generic_state_notifiers.dart';
import 'project_repository_provider.dart';

final inMemoryProjectsProvider =
    StateNotifierProvider<InMemoryProjectsNotifier, List<Project>>((ref) {
  final repo = ref.watch(projectRepositoryProvider);
  return InMemoryProjectsNotifier(repo);
});

class InMemoryProjectsNotifier extends GenericStateNotifier<Project> {
  InMemoryProjectsNotifier(Repository<Project> repo)
      : super(
          repo,
        );

  Future<void> addNew() async {
    final Project project = Project(
      name: 'No Name',
      synopsis: '',
      createdTimestamp: DateTime.now().millisecondsSinceEpoch,
      modifiedTimestamp: DateTime.now().millisecondsSinceEpoch,
    );

    await add(project);
  }

  Future<void> remove(Project item) async {
    await super.delete(item, (entity) => entity.id == item.id);
  }

  Future<void> update(Project item) async {
    await super.modify(item, (entity) => entity.id == item.id);
  }
}
