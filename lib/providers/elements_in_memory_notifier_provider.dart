import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../database/entities/element.dart';
import '../database/entities/enum_element_type.dart';
import '../database/repository.dart';
import 'elements_repository_provider.dart';
import 'generic_state_notifiers.dart';
import 'open_project_provider.dart';

final elementsProvider = StateNotifierProvider.family<ElementsInMemoryNotifier,
    AsyncValue<Iterable<Element>>, ElementType>((ref, elementType) {
  final openProject = ref.watch(openProjectProvider);
  final repo = ref.watch(elementRepositoryProvider);

  return ElementsInMemoryNotifier(
    repo,
    openProject!.id!,
    elementType,
  );
});

class ElementsInMemoryNotifier extends AsyncGenericStateNotifier<Element> {
  final int _projectId;
  final ElementType _elementType;
  ElementsInMemoryNotifier(
      Repository<Element> repo, int projectId, ElementType elementType)
      : _projectId = projectId,
        _elementType = elementType,
        super(
          repo,
          (e) =>
              e.id == projectId &&
              e.projectId == projectId &&
              e.elementType == elementType,
        );

  Future<void> addNew() async {
    final element = Element(
      projectId: _projectId,
      name: 'no name',
      elementType: _elementType,
    );
    await add(element);
  }

  Future<void> remove(Element element) =>
      super.delete(element, (entity) => entity.id == element.id);

  Future<void> update(Element element) =>
      super.modify(element, (entity) => entity.id == element.id);
}
