import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tarot_stories/providers/project/open_project_provider.dart';

import '../../database/entities/element.dart';
import '../../database/entities/enum_element_type.dart';
import 'elements_notifier_provider.dart';

final charactersFilterProvider = FutureProvider<Iterable<Element>>((ref) async {
  final project = ref.watch(openProjectProvider);
  final Iterable<Element> all = await ref.watch(elementsProvider.future);
  return all.where((element) =>
      element.elementType == ElementType.character &&
      element.projectId == project!.id);
});

final beatsFilterProvider = FutureProvider<Iterable<Element>>((ref) async {
  final project = ref.watch(openProjectProvider);
  final Iterable<Element> all = await ref.watch(elementsProvider.future);
  return all.where((element) =>
      element.elementType == ElementType.beat &&
      element.projectId == project!.id);
});

final placesFilterProvider = FutureProvider<Iterable<Element>>((ref) async {
  final project = ref.watch(openProjectProvider);
  final Iterable<Element> all = await ref.watch(elementsProvider.future);
  return all.where((element) =>
      element.elementType == ElementType.place &&
      element.projectId == project!.id);
});

final propsFilterProvider = FutureProvider<Iterable<Element>>((ref) async {
  final project = ref.watch(openProjectProvider);
  final Iterable<Element> all = await ref.watch(elementsProvider.future);
  return all.where((element) =>
      element.elementType == ElementType.prop &&
      element.projectId == project!.id);
});

final recycledFilterProvider = FutureProvider<Iterable<Element>>((ref) async {
  final project = ref.watch(openProjectProvider);
  final Iterable<Element> all = await ref.watch(elementsProvider.future);
  return all.where((element) =>
      element.elementType == ElementType.recycled &&
      element.projectId == project!.id);
});

final relationshipsFilterProvider =
    FutureProvider<Iterable<Element>>((ref) async {
  final project = ref.watch(openProjectProvider);
  final Iterable<Element> all = await ref.watch(elementsProvider.future);
  return all.where((element) =>
      element.elementType == ElementType.relationship &&
      element.projectId == project!.id);
});

final scenesFilterProvider = FutureProvider<Iterable<Element>>((ref) async {
  final project = ref.watch(openProjectProvider);
  final Iterable<Element> all = await ref.watch(elementsProvider.future);
  return all.where((element) =>
      element.elementType == ElementType.scene &&
      element.projectId == project!.id);
});

final structuresFilterProvider = FutureProvider<Iterable<Element>>((ref) async {
  final project = ref.watch(openProjectProvider);
  final Iterable<Element> all = await ref.watch(elementsProvider.future);
  return all.where((element) =>
      element.elementType == ElementType.structure &&
      element.projectId == project!.id);
});

final unassociatedFilterProvider =
    FutureProvider<Iterable<Element>>((ref) async {
  final project = ref.watch(openProjectProvider);
  final Iterable<Element> all = await ref.watch(elementsProvider.future);
  return all.where((element) =>
      element.elementType == ElementType.unassociated &&
      element.projectId == project!.id);
});
