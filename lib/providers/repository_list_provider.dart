import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tarot_stories/database/entity.dart';
import 'package:tarot_stories/database/repository.dart';

class RepositoryListNotifier<E extends Entity> extends StateNotifier<List<E>> {
  Repository<E> _repo;

  RepositoryListNotifier(List<E> list, String repoName)
      : _repo = Repository(storeName: repoName),
        super(list);

  void execute(void Function(List<E> list, Repository<E> repo) visit) {
    final list = [...state];
    visit(list, _repo);
    state = list;
  }

  Future<void> add(E item) async {
    final list = [...state];
    list.add(item);
    await _repo.insert(item);
    state = list;
  }

  Future<void> delete(E item) async {
    final list = [...state];
    list.remove(item);
    await _repo.delete(item);
    state = list;
  }

  Future<void> update(E item) async {
    final list = [...state];
    await _repo.update(item);
    state = list;
  }
}
