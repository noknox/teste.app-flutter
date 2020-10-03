import 'package:database/filter.dart';
import 'package:meta/meta.dart';
import 'package:database/database.dart';
import 'package:teste_app_flutter/core/data/base_model.dart';

abstract class MemoryDatabase<T extends BaseModel> {
  String table;
  final _database = MemoryDatabaseAdapter().database();

  MemoryDatabase({this.table}) {
    this.setup();
  }

  @protected
  void setup();

  @protected
  Future insert(T data) async {
    await _database.collection(this.table).insert(data: data.toJson());
  }

  @protected
  Future<List<Map<String, Object>>> readAll() async {
    // Define what we are searching
    final result = await _database.collection(this.table).search(reach: Reach.local);
    return result.snapshots.map((e) => e.data).toList();
  }

  @protected
  Future teardown() async {
    await _database.collection(this.table).searchAndDelete();
  }
}