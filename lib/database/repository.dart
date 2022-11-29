import 'package:sembast/sembast.dart';

import 'app_database.dart';
import 'entity.dart';

class Repository<E extends Entity> {
  late final String _storeName;
  // A Store with int keys and Map<String, dynamic> values.
  // This Store acts like a persistent map, values of which are Fruit objects converted to Map
  late final StoreRef<int, Map<String, Object?>> _store;

  // Private getter to shorten the amount of code needed to get the
  // singleton instance of an opened database.
  Future<Database> get _db async => await AppDatabase.instance.database;

  Repository({required String storeName})
      : _storeName = storeName,
        _store = intMapStoreFactory.store(storeName);

  Future<int> insert(E entity) async {
    return await _store.add(await _db, entity.toMap());
  }

  Future<int> update(E entity) async {
    // For filtering by key (ID), RegEx, greater than, and many other criteria,
    // we use a Finder.
    final finder = Finder(filter: Filter.byKey(entity.id));
    return await _store.update(
      await _db,
      entity.toMap(),
      finder: finder,
    );
  }

  Future<int> delete(E entity) async {
    final finder = Finder(filter: Filter.byKey(entity.id));
    return await _store.delete(
      await _db,
      finder: finder,
    );
  }

  Future<void> deleteAll() async {
    return await _store.drop(await _db);
  }

  Future<List<Entity>> _getAllSortedByFields(List<String> fieldnames,
      {String? filterText, bool asc = true}) async {
    // Finder object can also sort data.
    Filter? filter =
        filterText == null ? null : Filter.matches('name', filterText);
    final finder = Finder(
      filter: filter,
      sortOrders: fieldnames.map((e) => SortOrder(e, asc)).toList(),
    );

    final recordSnapshots = await _store.find(
      await _db,
      finder: finder,
    );

    // Making a List<Fruit> out of List<RecordSnapshot>
    return recordSnapshots.map((snapshot) {
      final entity = Entity.fromMap(_storeName, snapshot.value);
      // An ID is a key of a record from the database.
      entity.id = snapshot.key;
      return entity;
    }).toList();
  }

  Future<List<Entity>> getAllSortedByName({
    String? pattern,
    bool ascending = true,
  }) async {
    return _getAllSortedByFields(['name'], filterText: pattern, asc: ascending);
  }

  Future<List<Entity>> getAllSortedByCreatedTimestamp({
    String? pattern,
    bool ascending = true,
  }) async {
    return _getAllSortedByFields(['created'],
        filterText: pattern, asc: ascending);
  }

  Future<List<Entity>> getAllSortedByModifiedTimestamp({
    String? pattern,
    bool ascending = true,
  }) async {
    return _getAllSortedByFields(['modified'],
        filterText: pattern, asc: ascending);
  }
}
