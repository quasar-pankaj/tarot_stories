import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../database/entities/project.dart';
import '../../database/repository.dart';
import '../elements/elements_provider.dart';
import '../generic_notifier.dart';
import 'project_repository_provider.dart';

final projectsProvider = AsyncNotifierProvider.autoDispose
    .family<ProjetcsNotifier, Iterable<Project>, int>(
  ProjetcsNotifier.new,
);

class ProjetcsNotifier extends GenericNotifier<Project> {
  @override
  Future<void> deleteChildren(Project item) async {
    final elements = await ref.read(elementsProvider(item.id!).future);

    for (var element in elements) {
      ref.read(elementsProvider(item.id!).notifier).delete(element);
    }
  }

  @override
  String get fKField => '';

  @override
  Repository<Project> get repository => ref.read(projectRepositoryProvider);

  Future<Project> addNew() async {
    final project = Project(
      name: 'No Name',
      synopsis: '',
      createdTimestamp: DateTime.now().millisecondsSinceEpoch,
      modifiedTimestamp: DateTime.now().millisecondsSinceEpoch,
    );

    final p = await add(project);
    return p;
  }

  Future<void> save(Project project) =>
      saveBase(project, (item) => item.id == project.id);

  Future<void> delete(Project project) =>
      deleteBase(project, (item) => item.id != project.id);

  @override
  void undo() {
    ref.read(elementsProvider(arg).notifier).undo();
    super.undo();
  }

  @override
  void redo() {
    ref.read(elementsProvider(arg).notifier).redo();
    super.redo();
  }
}
