import 'package:persistence/entities/lists.dart';

import 'objectbox.g.dart';

class ObjectBox {
  Store? _store;

  Future<Store> getStore() async {
    return _store ??= await openStore();
  }
}

class Persistence {
  late final ObjectBox _database;

  Persistence(this._database);

  Future<Box> getBox() async {
    final store = await _database.getStore();

    return store.box<ListsEntity>();
  }

  closeBox() async {
    final store = await _database.getStore();

    store.close();
  }

  save(String listName, List<String> listItems, int? id) async {
    final box = await getBox();
    ListsEntity le = id == null
        ? ListsEntity(listName: listName, listItems: listItems as List<String>)
        : ListsEntity(
            id: id, listName: listName, listItems: listItems as List<String>);

    return box.put(le);
  }

  fetch() async {
    final box = await getBox();
    return box.getAll();
  }

  delete(int id) async {
    final box = await getBox();
    box.remove(id);
  }

  get(id) async {
    final box = await getBox();
    return box.get(id);
  }
}
