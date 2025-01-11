import 'package:hive_flutter/hive_flutter.dart';

class Service<T> {
  String boxName;
  Service({required this.boxName});
  Future<Box<T>> get _box async => await Hive.openBox<T>(boxName);

//create
  Future<void> addPerson(T model) async {
    var box = await _box;
    await box.add(model);
  }

//read
  Future<List<T>> getAllPerson() async {
    var box = await _box;
    return box.values.toList();
  }

//update
  Future<void> updateDeck(int index, T model) async {
    var box = await _box;
    await box.putAt(index, model);
  }

//delete
  Future<void> deletePerson(int index) async {
    var box = await _box;
    await box.deleteAt(index);
  }
}
