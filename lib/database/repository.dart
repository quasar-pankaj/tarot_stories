import 'package:sembast/sembast.dart';

import 'app_database.dart';

class Repository<E> {
  // A Store with int keys and Map<String, dynamic> values.
  // This Store acts like a persistent map, values of which are Fruit objects converted to Map
  late final StoreRef<int, Map<String, Object?>> _store;

  // Private getter to shorten the amount of code needed to get the
  // singleton instance of an opened database.
  Future<Database> get _db async => await AppDatabase.instance.database;

  final Map<String, dynamic> Function(E entity) _getMap;
  final int Function(E entity) _getId;
  final E Function(Map<String, dynamic> map) _getEntity;
  final E Function(E entity, int id) _setId;

  Repository({
    required String storeName,
    required Map<String, dynamic> Function(E entity) getMap,
    required int Function(E entity) getId,
    required E Function(Map<String, dynamic> map) getEntity,
    required E Function(E entity, int id) setId,
  })  : _getMap = getMap,
        _getId = getId,
        _getEntity = getEntity,
        _setId = setId,
        _store = intMapStoreFactory.store(storeName);

  Future<int> insert(E entity) async {
    return await _store.add(await _db, _getMap(entity));
    // return await _store.add(await _db, entity.toMap());
  }

  Future<int> update(E entity) async {
    // For filtering by key (ID), RegEx, greater than, and many other criteria,
    // we use a Finder.
    // final finder = Finder(filter: Filter.byKey(entity.id));
    final finder = Finder(filter: Filter.byKey(_getId(entity)));
    return await _store.update(
      await _db,
      // entity.toMap(),
      _getMap(entity),
      finder: finder,
    );
  }

  Future<int> delete(E entity) async {
    // final finder = Finder(filter: Filter.byKey(entity.id));
    final finder = Finder(filter: Filter.byKey(_getId(entity)));
    return await _store.delete(
      await _db,
      finder: finder,
    );
  }

  Future<void> deleteAll() async {
    return await _store.drop(await _db);
  }

  Future<List<E>> getAllUnsorted() async {
    final recordSnapshots = await _store.find(
      await _db,
    );

    // Making a List<Fruit> out of List<RecordSnapshot>
    return recordSnapshots.map((snapshot) {
      // final entity = Entity.fromMap(_storeName, snapshot.value);
      final entity = _getEntity(snapshot.value);
      // An ID is a key of a record from the database.
      // entity.id = snapshot.key;
      _setId(entity, snapshot.key);
      return entity;
    }).toList();
  }

  Future<List<E>> _getAllSortedByFields(List<String> fieldnames,
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
      // final entity = Entity.fromMap(_storeName, snapshot.value);
      final entity = _getEntity(snapshot.value);
      // An ID is a key of a record from the database.
      // entity.id = snapshot.key;
      // _setId(entity, snapshot.key);
      // return entity;
      return _setId(entity, snapshot.key);
    }).toList();
  }

  Future<List<E>> getAllSortedByName({
    String? pattern,
    bool ascending = true,
  }) async {
    return _getAllSortedByFields(['name'], filterText: pattern, asc: ascending);
  }

  Future<List<E>> getAllSortedByCreatedTimestamp({
    String? pattern,
    bool ascending = true,
  }) async {
    return _getAllSortedByFields(['created'],
        filterText: pattern, asc: ascending);
  }

  Future<List<E>> getAllSortedByModifiedTimestamp({
    String? pattern,
    bool ascending = true,
  }) async {
    return _getAllSortedByFields(['modified'],
        filterText: pattern, asc: ascending);
  }
}
