import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../database/entities/element.dart';
import '../../database/entities/enum_element_type.dart';
import '../project/open_project_provider.dart';
import 'elements_repository_provider.dart';

final elementsProvider =
    AsyncNotifierProvider<ElementsNotifier, Iterable<Element>>(
  ElementsNotifier.new,
);

class ElementsNotifier extends AsyncNotifier<Iterable<Element>> {
  @override
  FutureOr<Iterable<Element>> build() async {
    state = const AsyncValue.loading();
    final elementsRepo = ref.watch(elementRepositoryProvider);
    return await elementsRepo.getAllUnsorted();
  }

  Future<void> addNew(ElementType type) async {
    final project = ref.read(openProjectProvider);
    final element = Element(
      projectId: project!.id!,
      name: 'No Name',
      elementType: type,
    );
    await add(element);
  }

  Future<void> add(Element element) async {
    state = const AsyncValue.loading();

    final elem = await ref.read(elementRepositoryProvider).insert(element);

    final elements = [...?state.value, elem];

    state = AsyncValue.data(elements);
  }

  Future<void> save(Element element) async {
    state = const AsyncValue.loading();

    await ref.read(elementRepositoryProvider).update(element);

    final elements = [
      for (Element item in state.value!)
        if (item.id == element.id) element else item
    ];

    state = AsyncValue.data(elements);
  }

  Future<void> delete(Element element) async {
    state = const AsyncValue.loading();

    await ref.read(elementRepositoryProvider).delete(element);

    final elements = [
      for (Element item in state.value!)
        if (item.id != element.id) item
    ];

    state = AsyncValue.data(elements);
  }

  Iterable<Element> filterByType(ElementType type) =>
      state.value!.where((element) => element.elementType == type);
}
